//
// Created by vboxuser on 11/29/24.
//

#include "pc_fifo3.h"

namespace gem5 {

namespace o3 {

std::deque<Addr> pcFifo::pc_fifo;
const size_t pcFifo::max_size = 4;
std::mutex pcFifo::pc_fifo_m;

void pcFifo::push(Addr pc) {
    std::lock_guard<std::mutex> lock(pc_fifo);
    if (pc_fifo.size() >= max_size) {
       pc_fifo.pop_front();
    }

    pc_fifo.push_back(pc);
}

Addr pcFifo::get(size_t index){
    std::lock_guard<std::mutex> lock(pc_fifo);

    if (index >= pc_fifo.size()){
          return -1;
    }

    return pc_fifo[index];
}

size_t size pcFifo::get_size(){
  return pc_fifo.size();

}
}