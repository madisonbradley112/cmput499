#ifndef STATIC_REGISTER_VAL_H 
#define STATIC_REGISTER_VAL_H
#include <mutex>
#include <deque>
#include <unordered_map>
using namespace std;

namespace gem5
{

struct BaseO3CPUParams;

namespace o3
{

class  FeatureCommunicationTable{

private:

    static unordered_map<uint64_t, uint64_t> pc_to_static_value;
    static std::mutex mutex;

public:
    void add(uint64_t addr, uint64_t static_info);
    uint64_t get(uint64_t addr);

};
}
}

#endif //PC_FIFO3_H
