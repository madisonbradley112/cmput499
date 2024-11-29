//
// Created by vboxuser on 11/29/24.
//

#ifndef PC_FIFO3_H
#define PC_FIFO3_H
#include <mutex>
#include <deque>
namespace gem5
{

struct BaseO3CPUParams;

namespace o3
{

class pcFifo {

private:
    static std::deque<Addr> pc_fifo;
    static const size_t max_size = 4;
    static std::mutex pc_fifo_m;

public:
    void push(Addr pc);
    Addr get(size_t index);
    size_t get_size();

};
}
}

#endif //PC_FIFO3_H
