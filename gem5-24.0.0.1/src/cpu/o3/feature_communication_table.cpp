#include "feature_communication_table.hh"
#include <iostream>

namespace gem5 {

namespace o3 {

std::unordered_map<uint64_t, uint64_t> FeatureCommunicationTable::pc_to_static_value;
std::mutex FeatureCommunicationTable::mutex;

uint64_t FeatureCommunicationTable::get(uint64_t addr){
    std::lock_guard<std::mutex> lock(mutex);
      std::cout << "static register value get \n";


    return pc_to_static_value.at(addr); 
}

void FeatureCommunicationTable::add(uint64_t addr, uint64_t val){
    std::lock_guard<std::mutex> lock(mutex);
      std::cout << "static register value set\n";
    pc_to_static_value[addr] = val; 
}
}
}