/**
 * Copyright (c) 2018 Metempsy Technology Consulting
 * 
 * Modified by Madison Bradley and Sarah Thomson 
 * in November 2024, to add prefetch filtering
 * 
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "mem/cache/prefetch/signature_path_perceptron_filter.hh"

#include <cassert>
#include <climits>
#include <cmath>

#include "debug/HWPrefetch.hh"
#include "mem/cache/prefetch/associative_set_impl.hh"
#include "params/SignaturePathPrefetcherPerceptronFilter.hh"
#include "params/LRURP.hh"

namespace gem5
{

namespace prefetch
{

int THRESHOLD = 256; // The training threshold
int NUM_FEATURES = 9;

SignaturePathPerceptronFilter::SignaturePathPerceptronFilter(const SignaturePathPrefetcherPerceptronFilterParams &p)
    : pc_fifo(),
      Queued(p),
      stridesPerPatternEntry(p.strides_per_pattern_entry),
      signatureShift(p.signature_shift),
      signatureBits(p.signature_bits),
      prefetchConfidenceThreshold(p.prefetch_confidence_threshold),
      lookaheadConfidenceThreshold(p.lookahead_confidence_threshold),
      signatureTable((name() + ".SignatureTable").c_str(),
                     p.signature_table_entries,
                     p.signature_table_assoc,
                     p.signature_table_replacement_policy,
                     p.signature_table_indexing_policy),
      patternTable((name() + ".PatternTable").c_str(),
                   p.pattern_table_entries,
                   p.pattern_table_assoc,
                   p.pattern_table_replacement_policy,
                   p.pattern_table_indexing_policy,
                   PatternEntry(stridesPerPatternEntry, p.num_counter_bits)),
      prefetchTable((name() + ".PrefetchTable").c_str(),
                   p.prefetch_table_entries,
                   p.prefetch_table_assoc,
                   p.prefetch_table_replacement_policy,
                   p.prefetch_table_indexing_policy), 
      rejectTable((name() + ".RejectTable").c_str(),
                   p.reject_table_entries,
                   p.reject_table_assoc,
                   p.reject_table_replacement_policy,
                   p.reject_table_indexing_policy)
{

    fatal_if(prefetchConfidenceThreshold < 0,
        "The prefetch confidence threshold must be greater than 0\n");
    fatal_if(prefetchConfidenceThreshold > 1,
        "The prefetch confidence threshold must be less than 1\n");
    fatal_if(lookaheadConfidenceThreshold < 0,
        "The lookahead confidence threshold must be greater than 0\n");
    fatal_if(lookaheadConfidenceThreshold > 1,
        "The lookahead confidence threshold must be less than 1\n");


    //gem5::LRURPParams params;
    //params.name = "LRU_ReplacementPolicy";  // Set the name
    // (You can set other parameters if needed)

    // Create the LRU replacement policy using the `create()` method
    //gem5::replacement_policy::LRU* lruPolicy = params.create();

    //AssociativeSet<RejectEntry> rejectTable("replacement table", 1024, 1024, lruPolicy, nullptr);

    // init weights
    for (int i = 0; i < NUM_FEATURES; i++){
      auto vec = std::vector<SatCounter8>();

      for (int j = 0; j < 8192; j++){

        SatCounter8 new_counter = SatCounter8(0);
        vec.push_back(new_counter);


      }

      weightTable.push_back(vec);

      }
}

SignaturePathPerceptronFilter::PatternStrideEntry &
SignaturePathPerceptronFilter::PatternEntry::getStrideEntry(stride_t stride)
{
  std::cout << "got stride entry:";
    PatternStrideEntry *pstride_entry = findStride(stride);
    if (pstride_entry == nullptr) {
        // Specific replacement algorithm for this table,
        // pick the entry with the lowest counter value,
        // then decrease the counter of all entries

        // If all counters have the max value, this will be the pick
        PatternStrideEntry *victim_pstride_entry = &(strideEntries[0]);

        unsigned long current_counter = ULONG_MAX;
        for (auto &entry : strideEntries) {
            if (entry.counter < current_counter) {
                victim_pstride_entry = &entry;
                current_counter = entry.counter;
            }
            entry.counter--;
        }
        pstride_entry = victim_pstride_entry;
        pstride_entry->counter.reset();
        pstride_entry->stride = stride;
    }
    return *pstride_entry;
}

void
SignaturePathPerceptronFilter::addPrefetch(Addr pc, Addr request_addr, uint8_t depth, Addr ppn, stride_t last_block,
    stride_t delta, double path_confidence, signature_t signature,
    bool is_secure, std::vector<AddrPriority> &addresses)
{
    stride_t block = last_block + delta;

    std::cout << "Adding a new prefetch\n";

    Addr pf_ppn;
    stride_t pf_block;
    if (block < 0) {
        stride_t num_cross_pages = 1 + (-block) / (pageBytes/blkSize);
        if (num_cross_pages > ppn) {
            // target address smaller than page 0, ignore this request;
            return;
        }
        pf_ppn = ppn - num_cross_pages;
        pf_block = block + (pageBytes/blkSize) * num_cross_pages;
        handlePageCrossingLookahead(signature, last_block, delta,
                                    path_confidence);
    } else if (block >= (pageBytes/blkSize)) {
        stride_t num_cross_pages = block / (pageBytes/blkSize);
        if (MaxAddr/pageBytes < (ppn + num_cross_pages)) {
            // target address goes beyond MaxAddr, ignore this request;
            return;
        }
        pf_ppn = ppn + num_cross_pages;
        pf_block = block - (pageBytes/blkSize) * num_cross_pages;
        handlePageCrossingLookahead(signature, last_block, delta,
                                    path_confidence);
    } else {
        pf_ppn = ppn;
        pf_block = block;
    }

    Addr new_addr = pf_ppn * pageBytes;
    new_addr += pf_block * (Addr)blkSize;

    // create the struct of features
    Features features;

    // Truncate each feature to its specified number of bits
    features.signature_xor_delta = (signature ^ delta) & 0x3FF;

    features.phys_address = (request_addr & 0xFFF);

    // page addr is the physical address shifted by the size of a page (each page is 4096 bytes, 2^12 = 4096 so shift by 12)
    auto shift_p = static_cast<uint16_t>(log2(pageBytes));

    auto p_addr = (request_addr >> shift_p);
    features.page_addr = (p_addr) & 0xFFF;

    features.cache_line = (p_addr & ((pageBytes/blkSize) -1 )) & 0xFFF;

    // use the page addr from above and xor with confidence
    features.page_addr_xor_confidence = (p_addr ^ static_cast<uint16_t>(path_confidence)) & 0xFFF;

    features.pc_xor_depth = (pc ^  depth) & 0x3FF;

    features.pc_xor_delta = (pc ^ delta) & 0x7F;

    features.confidence = (static_cast<uint16_t>(path_confidence) & 0x7F);


    std::cout << "Getttting the size o fifo: " << pc_fifo.get_size() << "\n";
    auto num_prev_pcs = pc_fifo.get_size();


    if (num_prev_pcs > 0){
        features.last3_pc_hash = pc_fifo.get(0);

      }


    for (int i = 0; i < (num_prev_pcs) ; i++){

           std::cout <<" Num prev pcs: " << num_prev_pcs << "\n";
           std::cout << "i: " << i << "\n";
        //std::cout << "last3 pc hash:" << (features.last3_pc_hash ^ (pc_fifo.get(i-1) >> i)) & 0x7FF;
          features.last3_pc_hash = (features.last3_pc_hash ^ (pc_fifo.get(i) >> i)) & 0x7FF;

      }


    DPRINTF(HWPrefetch, "Queuing prefetch to %#x.\n", new_addr);

    auto prediction = makeInference(features);
    // the index is the last address of the cache block to prefetch
    auto entry_index = request_addr & 0x3FF;
    // entry tag is the next 6 bits of the cache block to prefetch
    auto entry_tag = request_addr & 0xFC00;

    std::cout << "Made a prediction... :" << prediction << "\n";

    if (prediction == 1){

      std::cout << " Filter predicts yes\n";

      // add address as a prefetch candidate
        addresses.push_back(AddrPriority(new_addr, 0));

        // record the data from the prefetch candidate into the prefetch and reject tables
        PrefetchEntry *prefetch_entry;

        prefetch_entry = prefetchTable.findVictim(entry_index);

        prefetch_entry->tag = entry_tag;
        prefetch_entry->valid = 1;
        prefetch_entry->useful = 0;

        prefetch_entry->pc = pc & 0xFFF;
        prefetch_entry->address = request_addr & 0xFFFFFF;
        prefetch_entry->current_signature = signature & 0x3FF;
        prefetch_entry->pc_i_hash = features.last3_pc_hash ^ 0x7FF;
        prefetch_entry->delta = delta ^ 0xFFF;
        prefetch_entry->confidence = features.confidence;
        prefetch_entry->depth = depth & 0xF;

        prefetchTable.insertEntry(entry_index, 1, prefetch_entry);

      }
      else{

        std::cout << "Filter predicts NO\n";
          RejectEntry *reject_entry;

          reject_entry = rejectTable.findVictim(entry_index);

          // Associate a replacement data entry to the sector
          reject_entry->tag = entry_tag;
          reject_entry->valid = 1;

          reject_entry->pc = pc & 0xFFF;
          reject_entry->address = request_addr & 0xFFFFFF;
          reject_entry->current_signature = signature & 0x3FF;
          reject_entry->pc_i_hash = features.last3_pc_hash ^ 0x7FF;
          reject_entry->delta = delta ^ 0xFFF;
          reject_entry->confidence = features.confidence;
          reject_entry->depth = depth & 0xF;

          std::cout << "Inserting into reject table\n";
          rejectTable.insertEntry(entry_index, 1, reject_entry);
        }
}

//void
//Base::probeNotify(const CacheAccessProbeArg &acc, bool miss)
//{
//
//  std::cout << "in probe notify" << std::endl;
//    const PacketPtr pkt = acc.pkt;
//    const CacheAccessor &cache = acc.cache;
//
//    // Don't notify prefetcher on SWPrefetch, cache maintenance
//    // operations or for writes that we are coaslescing.
//    if (pkt->cmd.isSWPrefetch()) return;
//    if (pkt->req->isCacheMaintenance()) return;
//    if (pkt->isCleanEviction()) return;
//    if (pkt->isWrite() && cache.coalesce()) return;
//    if (!pkt->req->hasPaddr()) {
//        panic("Request must have a physical address");
//    }
//
//
//
//    bool has_been_prefetched =
//        acc.cache.hasBeenPrefetched(pkt->getAddr(), pkt->isSecure(),
//                                    requestorId);
//    if (has_been_prefetched) {
//        usefulPrefetches += 1;
//        prefetchStats.pfUseful++;
//        if (miss)
//            // This case happens when a demand hits on a prefetched line
//                // that's not in the requested coherency state.
//                    prefetchStats.pfUsefulButMiss++;
//    }
//
//    // Verify this access type is observed by prefetcher
//    if (observeAccess(pkt, miss, has_been_prefetched)) {
//        if (useVirtualAddresses && pkt->req->hasVaddr()) {
//            PrefetchInfo pfi(pkt, pkt->req->getVaddr(), miss);
//            notify(acc, pfi);
//        } else if (!useVirtualAddresses) {
//            PrefetchInfo pfi(pkt, pkt->req->getPaddr(), miss);
//
//            if (!pkt->isEviction()) {
//                handleDemand(pfi);
//            }
//
//            notify(acc, pfi);
//        }
//    }
//}


//void
//SignaturePathPerceptronFilter::notify(const CacheAccessProbeArg &arg, const PrefetchInfo &pfi)
//{
//
//    Base::PrefetchListener::notify(arg, pfi);
//}


// check tables and do training on a cache eviction

//void SignaturePathPerceptronFilter::notifyEvict(const EvictionInfo &info){
//
//  std::cout << "notify eviction \n";
//
//  // index prefetch table only
//  auto evict_addr = info.addr & 0x3FF;
//  auto entry_tag = info.addr & 0xFC00;
//
//  auto entry = prefetchTable.findEntry(evict_addr, 1);
//
//    if(!entry){
//        return;
//
//    }
//
//  // entry must be valid and tag must match to train ppf
//  if(entry->valid && entry_tag == entry->tag){
//    // must train on misprediction
//    trainPrefetch(-1, entry);
//
//    }
//
//    Base::notifyEvict(info);
//  }

void SignaturePathPerceptronFilter::handleDemand(const Base::PrefetchInfo &info){

    // index both tables
    auto demand_addr = info.getAddr() & 0x3FF;
    auto entry_tag = info.getAddr()  & 0xFC00;

    auto entry = prefetchTable.findEntry(demand_addr, 1);

    std::cout << "Notify of cache access \n";
    std::cout << "entry tag: "  << entry_tag << "\n";
    std::cout << "entry: " << entry << "\n";

    if(!entry){
      return;

      }

    std::cout << "entry tag?: " << entry->tag << "\n";

    if(entry->valid && entry_tag == entry->tag){
        // if address exists in the prefetch filter on a demand L2 accesss, then the prediction was correct
        trainPrefetch(1, entry);

    }

    auto r_entry = rejectTable.findEntry(demand_addr, 1);

    if(r_entry->valid && entry_tag == r_entry->tag){
        // if address exists in the reject filter on a demand L2 accesss, then the prediction should have been correct
        trainReject(1, r_entry);

    }

  }

 void SignaturePathPerceptronFilter::trainReject(int outcome, RejectEntry * entry){

// reconstruct the index values

    // page addr is the physical address shifted by the size of a page (each page is 4096 bytes, 2^12 = 4096 so shift by 12)
    auto shift_p = static_cast<uint16_t>(log2(pageBytes));

    auto p_addr = (entry->address >> shift_p);

    auto cache_line = (p_addr & ((pageBytes/blkSize) -1 ));

    // INDEX INFO
     auto f_index0 = (entry->confidence ^ p_addr) & 0xFFF;

     auto f_index1 = cache_line & 0xFFF;

     auto f_index2 = p_addr;

     auto f_index3 = entry->address;

     auto f_index4 = entry->confidence;

     auto f_index5 = entry->pc_i_hash;

     auto f_index6 = entry->current_signature ^ entry->delta;

     auto f_index7 = entry->pc ^ entry->depth;

     auto f_index8 = entry->pc ^ entry->delta;

    auto w0 = weightTable[0][f_index0];
    auto w1 = weightTable[1][f_index1];
    auto w2 = weightTable[2][f_index2];
    auto w3 = weightTable[3][f_index3];
    auto w4 = weightTable[4][f_index4];
    auto w5 = weightTable[5][f_index5];
    auto w6 = weightTable[6][f_index6];
    auto w7 = weightTable[7][f_index0];
    auto w8 = weightTable[8][f_index0];

    auto sum = static_cast<int>(w0) + static_cast<int>(w1) + static_cast<int>(w2) + static_cast<int>(w3) + static_cast<int>(w4) + static_cast<int>(w5) + static_cast<int>(w6) + static_cast<int>(w7) + static_cast<int>(w8);

    // set the entry's valid bit to 0 after it has been determined to be useful or useless
    entry->valid = 0;

    // don't over train
    if (abs(sum) >= THRESHOLD){
      return;
      }

    // prefetch was actually useful
    if (outcome > 0){
        w0+=1;
        w1+=1;
        w2+=1;
        w3+=1;
        w4+=1;
        w5+=1;
        w6+=1;
        w7+=1;
        w8+=1;

      }

    // prefetch was not useful
    if (outcome < 0){
        w0-=1;
        w1-=1;
        w2-=1;
        w3-=1;
        w4-=1;
        w5-=1;
        w6-=1;
        w7-=1;
        w8-=1;

    }

    // update the weights in the table
    weightTable[0][f_index0] = w0;
    weightTable[1][f_index1] = w1;
    weightTable[2][f_index2] = w2;
    weightTable[3][f_index3] = w3;
    weightTable[4][f_index4] = w4;
    weightTable[5][f_index5] = w5;
    weightTable[6][f_index6] = w6;
    weightTable[7][f_index7] = w7;
    weightTable[8][f_index8] = w8;


   }

void SignaturePathPerceptronFilter::trainPrefetch(int outcome, PrefetchEntry * entry){

     // reconstruct the index values

    // page addr is the physical address shifted by the size of a page (each page is 4096 bytes, 2^12 = 4096 so shift by 12)
    auto shift_p = static_cast<uint16_t>(log2(pageBytes));

    auto p_addr = (entry->address >> shift_p);

    auto cache_line = (p_addr & ((pageBytes/blkSize) -1 ));

    // INDEX INFO
     auto f_index0 = (entry->confidence ^ p_addr) & 0xFFF;

     auto f_index1 = cache_line & 0xFFF;

     auto f_index2 = p_addr;

     auto f_index3 = entry->address;

     auto f_index4 = entry->confidence;

     auto f_index5 = entry->pc_i_hash;

     auto f_index6 = entry->current_signature ^ entry->delta;

     auto f_index7 = entry->pc ^ entry->depth;

     auto f_index8 = entry->pc ^ entry->delta;

    auto w0 = weightTable[0][f_index0];
    auto w1 = weightTable[1][f_index1];
    auto w2 = weightTable[2][f_index2];
    auto w3 = weightTable[3][f_index3];
    auto w4 = weightTable[4][f_index4];
    auto w5 = weightTable[5][f_index5];
    auto w6 = weightTable[6][f_index6];
    auto w7 = weightTable[7][f_index0];
    auto w8 = weightTable[8][f_index0];

    auto sum = static_cast<int>(w0) + static_cast<int>(w1) + static_cast<int>(w2) + static_cast<int>(w3) + static_cast<int>(w4) + static_cast<int>(w5) + static_cast<int>(w6) + static_cast<int>(w7) + static_cast<int>(w8);

    // set the entry's valid bit to 0 after it has been determined to be useful or useless
    entry->valid = 0;

    // don't over train
    if (abs(sum) >= THRESHOLD){
      return;
      }

    // prefetch was actually useful
    if (outcome > 0){
        w0+=1;
        w1+=1;
        w2+=1;
        w3+=1;
        w4+=1;
        w5+=1;
        w6+=1;
        w7+=1;
        w8+=1;

      }

    // prefetch was not useful
    if (outcome < 0){
        w0-=1;
        w1-=1;
        w2-=1;
        w3-=1;
        w4-=1;
        w5-=1;
        w6-=1;
        w7-=1;
        w8-=1;

    }

    // update the weights in the table
    weightTable[0][f_index0] = w0;
    weightTable[1][f_index1] = w1;
    weightTable[2][f_index2] = w2;
    weightTable[3][f_index3] = w3;
    weightTable[4][f_index4] = w4;
    weightTable[5][f_index5] = w5;
    weightTable[6][f_index6] = w6;
    weightTable[7][f_index7] = w7;
    weightTable[8][f_index8] = w8;



  }

bool SignaturePathPerceptronFilter::makeInference( Features features){

  std::cout << "Making an inference:\n";
      auto w0 = static_cast<int>(weightTable[0][features.page_addr_xor_confidence]);
      auto w1 = static_cast<int>(weightTable[1][features.cache_line]);
      auto w2 = static_cast<int>(weightTable[2][features.page_addr]);
      auto w3 = static_cast<int>(weightTable[3][features.phys_address]);
      auto w4 = static_cast<int>(weightTable[4][features.confidence]);
      auto w5 = static_cast<int>(weightTable[5][features.last3_pc_hash]);
      auto w6 = static_cast<int>(weightTable[6][features.signature_xor_delta]);
      auto w7 = static_cast<int>(weightTable[7][features.pc_xor_depth]);
      auto w8 = static_cast<int>(weightTable[8][features.pc_xor_delta]);

      int sum = w0 + w1 + w2 + w3 + w4 + w5 + w6 + w7 + w8;

      std::cout << "inference: " << sum << "\n";


      if (sum >= t_high){
        return true;
       }
       return false;
       }


void
SignaturePathPerceptronFilter::handleSignatureTableMiss(stride_t current_block,
    signature_t &new_signature, double &new_conf, stride_t &new_stride)
{
    new_signature = current_block;
    new_conf = 1.0;
    new_stride = current_block;
}

void
SignaturePathPerceptronFilter::increasePatternEntryCounter(
        PatternEntry &pattern_entry, PatternStrideEntry &pstride_entry)
{
    pstride_entry.counter++;
}

void
SignaturePathPerceptronFilter::updatePatternTable(Addr signature, stride_t stride)
{
  std::cout << "Updating patternn table\n";
    assert(stride != 0);
    // The pattern table is indexed by signatures
    PatternEntry &p_entry = getPatternEntry(signature);
    PatternStrideEntry &ps_entry = p_entry.getStrideEntry(stride);
    increasePatternEntryCounter(p_entry, ps_entry);
}

SignaturePathPerceptronFilter::SignatureEntry &
SignaturePathPerceptronFilter::getSignatureEntry(Addr ppn, bool is_secure,
        stride_t block, bool &miss, stride_t &stride,
        double &initial_confidence)
{
  std::cout << " getting signature entry\n";
    SignatureEntry* signature_entry = signatureTable.findEntry(ppn, is_secure);
    if (signature_entry != nullptr) {
        signatureTable.accessEntry(signature_entry);
        miss = false;
        stride = block - signature_entry->lastBlock;
    } else {
        signature_entry = signatureTable.findVictim(ppn);
        assert(signature_entry != nullptr);

        // Sets signature_entry->signature, initial_confidence, and stride
        handleSignatureTableMiss(block, signature_entry->signature,
            initial_confidence, stride);

        signatureTable.insertEntry(ppn, is_secure, signature_entry);
        miss = true;
    }
    signature_entry->lastBlock = block;
    return *signature_entry;
}

SignaturePathPerceptronFilter::PatternEntry &
SignaturePathPerceptronFilter::getPatternEntry(Addr signature)
{
  std::cout << "getting parttern etry\n";
    constexpr bool is_secure = false;
    PatternEntry* pattern_entry = patternTable.findEntry(signature, is_secure);
    if (pattern_entry != nullptr) {
        // Signature found
        patternTable.accessEntry(pattern_entry);
    } else {
        // Signature not found
        pattern_entry = patternTable.findVictim(signature);
        assert(pattern_entry != nullptr);

        patternTable.insertEntry(signature, is_secure, pattern_entry);
    }
    return *pattern_entry;
}

double
SignaturePathPerceptronFilter::calculatePrefetchConfidence(PatternEntry const &sig,
        PatternStrideEntry const &entry) const
{
  std::cout << "cacluate prefetch confidence:\n";
    return entry.counter.calcSaturation();
}

double
SignaturePathPerceptronFilter::calculateLookaheadConfidence(PatternEntry const &sig,
        PatternStrideEntry const &lookahead) const
{

  std::cout << "calc llookahead confidence\n";
    double lookahead_confidence = lookahead.counter.calcSaturation();
    if (lookahead_confidence > 0.95) {
        /**
         * maximum confidence is 0.95, guaranteeing that
         * current confidence will eventually fall beyond
         * the threshold
         */
        lookahead_confidence = 0.95;
    }
    return lookahead_confidence;
}

void
SignaturePathPerceptronFilter::calculatePrefetch(const PrefetchInfo &pfi,
                                 std::vector<AddrPriority> &addresses,
                                 const CacheAccessor &cache)
{

  std::cout << "calculating preefetch\n";
    Addr request_addr = pfi.getPaddr();
    Addr ppn = request_addr / pageBytes;
    Addr pc = pfi.getPC();
    stride_t current_block = (request_addr % pageBytes) / blkSize;
    stride_t stride;
    bool is_secure = pfi.isSecure();
    double initial_confidence = 1.0;

    // Get the SignatureEntry of this page to:
    // - compute the current stride
    // - obtain the current signature of accesses
    bool miss;
    SignatureEntry &signature_entry = getSignatureEntry(ppn, is_secure,
            current_block, miss, stride, initial_confidence);

    if (miss) {
      std::cout << " MISS ( no signature entry for this page )\n" ;
        // No history for this page, can't continue
        return;
    }

    if (stride == 0) {
        std::cout << " Stride is 0 \n" ;
        // Can't continue with a stride 0
        return;
    }

    std::cout << "Can now update the current signature \n";

    // Update the confidence of the current signature
    updatePatternTable(signature_entry.signature, stride);

    // Update the current SignatureEntry signature
    signature_entry.signature =
        updateSignature(signature_entry.signature, stride);

    signature_t current_signature = signature_entry.signature;
    double current_confidence = initial_confidence;
    stride_t current_stride = signature_entry.lastBlock;
    uint8_t current_depth = 0;

    // Look for prefetch candidates while the current path confidence is
    // high enough
    // EDITED THE CURRENT CONFIDENCE THRESHOLD TO JUST BE 0.1 SO SPP CAN BE MORE AGGRESSIVE, NEED TO TUNE TO ALLOW LOOKAHEAD OF 15 MAX
    while (current_confidence > 0.1) {
      std::cout << "in current confidence while loop: " << current_confidence << "\n";
        // With the updated signature, attempt to generate prefetches
        // - search the PatternTable and select all entries with enough
        //   confidence, these are prefetch candidates
        // - select the entry with the highest counter as the "lookahead"
        PatternEntry *current_pattern_entry =
            patternTable.findEntry(current_signature, is_secure);
        PatternStrideEntry const *lookahead = nullptr;
        if (current_pattern_entry != nullptr) {
            unsigned long max_counter = 0;
            for (auto const &entry : current_pattern_entry->strideEntries) {
                //select the entry with the maximum counter value as lookahead
                if (max_counter < entry.counter) {
                    max_counter = entry.counter;
                    std::cout << "max_counter: "  << max_counter << "\n";
                    lookahead = &entry;
                }
                double prefetch_confidence =
                    calculatePrefetchConfidence(*current_pattern_entry, entry);

                if (prefetch_confidence >= 0.1) {
                  std::cout << "prefetch confidence\n" << prefetch_confidence << "\n";
                    assert(entry.stride != 0);
                    //prefetch candidate
                    std::cout << "Adding a prefetch pc: "<< pc << "\n";
                    addPrefetch(pc, request_addr, current_depth, ppn, current_stride, entry.stride,
                                current_confidence, current_signature,
                                is_secure, addresses);
                }
            }
        }

        if (lookahead != nullptr) {

          // Increasing the depth counter here
            current_depth += 1;
            std::cout << "current depthh: "<<  current_depth << "\n";
            current_confidence *= calculateLookaheadConfidence(
                    *current_pattern_entry, *lookahead);

            std::cout << "Neew confidence: " << current_confidence << "\n";
            current_signature =
                updateSignature(current_signature, lookahead->stride);
            current_stride += lookahead->stride;
        } else {
            current_confidence = 0.0;
        }
    }

    //auxiliaryPrefetcher(ppn, current_block, is_secure, addresses);
}


// Should we remove this? I don't think PPF uses next line prefetcher as an alternative

void
SignaturePathPerceptronFilter::auxiliaryPrefetcher(Addr ppn, stride_t current_block,
        bool is_secure, std::vector<AddrPriority> &addresses)
{

  std::cout << "Shouldn't be here...\n";
//    if (addresses.empty()) {
//        // Enable the next line prefetcher if no prefetch candidates are found
//        addPrefetch(ppn, current_block, 1, 0.0 /* unused*/, 0 /* unused */,
//                    is_secure, addresses);
//    }
}

} // namespace prefetch
} // namespace gem5
