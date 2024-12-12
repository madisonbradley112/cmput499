import sys

config.llvm_tools_dir = "/Users/jupiterbradley/llvm/llvm-17/bin"
config.llvm_shlib_ext = ".so"
config.llvm_shlib_dir = "/Users/jupiterbradley/Documents/University/cmput499/project/cmput499/llvm-passes/build/lib"

import lit.llvm
# lit_config is a global instance of LitConfig
lit.llvm.initialize(lit_config, config)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join("/Users/jupiterbradley/Documents/University/cmput499/project/cmput499/llvm-passes/build/test")

# Let the main config do the real work.
lit_config.load_config(config, "/Users/jupiterbradley/Documents/University/cmput499/project/cmput499/llvm-passes/test/lit.cfg.py")
