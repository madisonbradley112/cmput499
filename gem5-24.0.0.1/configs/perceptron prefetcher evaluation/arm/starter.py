# import sys
# import os

# #### CONSTANTS ####
# try:
#     os.environ['GEM_PATH']
# except:
#     print("This script requires the GEM_PATH environment variable")
#     exit()

# sys.path.append(os.getenv["GEM_PATH"] + "/configs")
# sys.path.append(os.getenv["GEM_PATH"] + "/src/python")

from gem5.components.boards.simple_board import SimpleBoard
from gem5.components.cachehierarchies.classic.private_l1_private_l2_cache_hierarchy import (
    PrivateL1PrivateL2CacheHierarchy,
)
from gem5.components.memory.single_channel import SingleChannelDDR3_1600
from gem5.resources.resource import obtain_resource
from gem5.simulate.simulator import Simulator
from gem5.isas import ISA

from gem5.components.processors.base_cpu_core import BaseCPUCore
from gem5.components.processors.base_cpu_processor import BaseCPUProcessor

from m5.objects import ArmO3CPU
from m5.objects import TournamentBP
import argparse

class MyOutOfOrderCore(BaseCPUCore):
    def __init__(self, width, rob_size, num_int_regs, num_fp_regs):
        super().__init__(ArmO3CPU(), ISA.ARM)
        self.core.fetchWidth = width
        self.core.decodeWidth = width
        self.core.renameWidth = width
        self.core.issueWidth = width
        self.core.wbWidth = width
        self.core.commitWidth = width

        self.core.numROBEntries = rob_size

        self.core.numPhysIntRegs = num_int_regs
        self.core.numPhysFloatRegs = num_fp_regs

        self.core.branchPred = TournamentBP()

        self.core.LQEntries = 128
        self.core.SQEntries = 128
        

class MyOutOfOrderProcessor(BaseCPUProcessor):
    def __init__(self, width, rob_size, num_int_regs, num_fp_regs):
        """
        :param width: sets the width of fetch, decode, raname, issue, wb, and
        commit stages.
        :param rob_size: determine the number of entries in the reorder buffer.
        :param num_int_regs: determines the size of the integer register file.
        :param num_int_regs: determines the size of the vector/floating point
        register file.
        """
        cores = [MyOutOfOrderCore(width, rob_size, num_int_regs, num_fp_regs)]
        super().__init__(cores)


main_memory = SingleChannelDDR3_1600(size="8GB")

cache_hierarchy = PrivateL1PrivateL2CacheHierarchy(
    l1d_size="32kB",
    l1i_size="16kB",
    l2_size="256kB",
)

my_ooo_processor = MyOutOfOrderProcessor(
    width=4, rob_size=256, num_int_regs=256, num_fp_regs=256
)

board = SimpleBoard(
    processor=my_ooo_processor,
    memory=main_memory,
    cache_hierarchy=cache_hierarchy,
    clk_freq="4GHz",
)

parser = argparse.ArgumentParser(epilog=__doc__)
parser.add_argument(
        "--benchmark",
        type=str,
        choices=["arm-spec-gcc-1-run-se", "arm-spec-gcc-2-run-se", "arm-spec-gcc-3-run-se", "arm-spec-gcc-4-run-se", "arm-spec-gcc-5-run-se", "arm-spec-mcf-run-se", "arm-spec-omnetpp-run-se", "arm-spec-xalancbmk-run-se", "arm-spec-x264_1-run-se", "arm-spec-x264_2-run-se", "arm-spec-x264_3-run-se", "arm-spec-deepsjeng-run-se", "arm-spec-leela-run-se", "arm-spec-exchange2-run-se", "arm-spec-xz_1-run-se", "arm-spec-xz_2-run-se", "arm-spec-xz_3-run-se"],
        help="benchmark to use",
    )

args = parser.parse_args()

board.set_workload(obtain_resource(args.benchmark))

simulator = Simulator(board)
simulator.run()