import sys

config.llvm_tools_dir = "/home/madison.bradley/llvm/llvm-17/bin"
config.llvm_shlib_ext = ".so"
config.llvm_shlib_dir = "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/lib"

import lit.llvm
# lit_config is a global instance of LitConfig
lit.llvm.initialize(lit_config, config)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join("/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/test")

# Let the main config do the real work.
lit_config.load_config(config, "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/test/lit.cfg.py")
