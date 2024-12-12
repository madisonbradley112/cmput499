//========================================================================
// FILE:
//      BuildInstructionTree.cpp
//
// DESCRIPTION:
//      Constructs the tree form of the input, for loads and stores. Each
//      load/store is represented as a tree, where the subtrees are the tree
//      forms of the operands.
// USAGE:
//      $  opt -load-pass-plugin <BUILD_DIR>/libBuildInstructionTree.so
//      -passes="print<build-instruction-tree>" -disable-output
//      <input-llvm-file>
//
//========================================================================
#include "../include/BuildInstructionTree.h"

using namespace llvm;

#define DEBUG_TYPE "build-instruction-tree"

// Pretty-prints the result of this analysis
static void
printBuildInstructionTree(llvm::raw_ostream &OutS,
                          const ResultBuildInstructionTree &InstructionTrees);

//-----------------------------------------------------------------------------
// BuildInstructionTree implementation
//-----------------------------------------------------------------------------
BuildInstructionTree::Result BuildInstructionTree::runOnModule(Module &M) {
    std::vector<InstructionTreeRepresentation *> Res;
    for (auto &F : M) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                InstructionTreeRepresentation *tree;

                // If this is a load or store function, then these will not be
                // nullptr.
                auto *load = dyn_cast<LoadInst>(&Inst);
                auto *store = dyn_cast<StoreInst>(&Inst);

                // depending on the instruction type, the memory access location
                // can be found in different operands.

                if (store == nullptr && load == nullptr) {
                    continue;
                }
                if (load) {
                    tree = new InstructionTreeRepresentation(load);
                } else {
                    tree = new InstructionTreeRepresentation(store);
                }

                tree = new InstructionTreeRepresentation(&Inst);
                tree->buildTree();
                Res.push_back(tree);
            }
        }
    }

    return Res;
}

PreservedAnalyses
BuildInstructionTreePrinter::run(llvm::Module &M,
                                 llvm::ModuleAnalysisManager &MAM) {
    auto DirectCalls = MAM.getResult<BuildInstructionTree>(M);

    printBuildInstructionTree(OS, DirectCalls);
    return PreservedAnalyses::all();
}

BuildInstructionTree::Result
BuildInstructionTree::run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) {
    return runOnModule(M);
}

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
AnalysisKey BuildInstructionTree::Key;

llvm::PassPluginLibraryInfo getBuildInstructionTreePluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION, "build-instruction-tree", LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            // #1 REGISTRATION FOR "opt -passes=print<build-instruction-tree>"
            PB.registerPipelineParsingCallback(
                [&](StringRef Name, ModulePassManager &MPM,
                    ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "print<build-instruction-tree>") {
                        MPM.addPass(BuildInstructionTreePrinter(llvm::errs()));
                        return true;
                    }
                    return false;
                });

            // #2 REGISTRATION FOR "MAM.getResult<BuildInstructionTree>(Module)"
            PB.registerAnalysisRegistrationCallback(
                [](ModuleAnalysisManager &MAM) {
                    MAM.registerPass([&] { return BuildInstructionTree(); });
                });
        }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getBuildInstructionTreePluginInfo();
}

static void
printBuildInstructionTree(llvm::raw_ostream &OutS,
                          const ResultBuildInstructionTree &InstructionTrees) {
    OutS << "================================================="
         << "\n";
    OutS << "BuildInstructionTree: static analysis results\n";
    OutS << "=================================================\n";
    const char *str1 = "FUNCTION";
    const char *str2 = "INSTRUCTION";
    OutS << format("%-20s %-10s\n", str1, str2);
    OutS << "-------------------------------------------------\n";

    for (auto tree : InstructionTrees) {
        OutS << "-------------------------------------------------\n";
        tree->printTree();
        OutS << "-------------------------------------------------\n";
    }
}