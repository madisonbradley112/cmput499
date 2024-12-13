//
// Created by vboxuser on 11/29/24.
//

#include "pc_fifo3.hh"
#include <iostream>

namespace gem5 {

namespace o3 {

std::deque<Addr> pcFifo::pc_fifo;
std::mutex pcFifo::pc_fifo_m;

void pcFifo::push(Addr pc) {
    std::lock_guard<std::mutex> lock(pc_fifo_m);
      //std::cout << "pcFIFO push\n";
    if (pc_fifo.size() >= max_size) {
       pc_fifo.pop_front();
    }

    pc_fifo.push_back(pc);
}

Addr pcFifo::get(size_t index){
    std::lock_guard<std::mutex> lock(pc_fifo_m);
      //std::cout << "pcFIFO get \n";

    if (index >= pc_fifo.size()){
          return -1;
    }

    return pc_fifo[index];
}

size_t pcFifo::get_size(){
  //std::cout << "pcFIFO get size\n";
  return pc_fifo.size();

}
}
}