//========================================================================
// FILE:
//      BuildACFTree.cpp
//
// DESCRIPTION:
//      Constructs the tree form of the input, for loads and stores. Each
//      load/store is represented as a tree, where the subtrees are the tree
//      forms of the operands.
// USAGE:
//      $  opt -load-pass-plugin <BUILD_DIR>/libBuildACFTree.so
//      -passes="print<build-acf-tree>" -disable-output
//      <input-llvm-file>
//
//========================================================================
#include "../include/BuildACFTree.h"

using namespace llvm;

#define DEBUG_TYPE "build-acf-tree"

// Pretty-prints the result of this analysis
static void printBuildACFTree(llvm::raw_ostream &OutS,
                              const ResultBuildACFTree &InstructionTrees);

void buildACFForm(InstructionTreeRepresentation *tree) {
    auto leftSubtree = tree->getLeftOperand();
    auto rightSubtree = tree->getRightOperand();

    if (leftSubtree) {
        buildACFForm(leftSubtree);
    }

    if (rightSubtree) {
        buildACFForm(rightSubtree);
    }
}

//-----------------------------------------------------------------------------
// BuildACFTree implementation
//-----------------------------------------------------------------------------
BuildACFTree::Result BuildACFTree::runOnModule(Module &M) {
    std::vector<InstructionTreeRepresentation *> Res;
    BlockToBranchInstructionMap conditionalMapping;

    for (auto &F : M) {

        bool changes = true;
        while (changes) {
            changes = false;
            for (auto &BB : F) {
                // To get the ACF form, we need to grab conditional branches
                // preceding entry to a block These branches are what we use to
                // build the conditional part of each term in ACF form If there
                // are multiple predecessors for a block with conditional
                // branches leading to it, we include those conditions as well.
                Instruction *terminator = BB.getTerminator();

                if (terminator) {
                    // get information about the branch
                    BranchInst *branch = dyn_cast<BranchInst>(terminator);

                    // send the condition to the immediate successor
                    if (branch && branch->isConditional()) {

                        auto *trueBlock =
                            dyn_cast<BasicBlock>(branch->getOperand(2));
                        auto *falseBlock =
                            dyn_cast<BasicBlock>(branch->getOperand(1));
                        conditionalMapping[trueBlock].insert(
                            std::make_tuple(branch, &BB, true));
                        conditionalMapping[falseBlock].insert(
                            std::make_tuple(branch, &BB, false));

                        // now, copy all the conditions associated with the
                        // current block to the successor (if not there already)
                        long unsigned int oldSizeTrue =
                            conditionalMapping[trueBlock].size();
                        long unsigned int oldSizeFalse =
                            conditionalMapping[falseBlock].size();
                        conditionalMapping[trueBlock].insert(
                            conditionalMapping[&BB].begin(),
                            conditionalMapping[&BB].end());
                        conditionalMapping[falseBlock].insert(
                            conditionalMapping[&BB].begin(),
                            conditionalMapping[&BB].end());
                        if (oldSizeTrue !=
                                conditionalMapping[trueBlock].size() ||
                            oldSizeFalse !=
                                conditionalMapping[falseBlock].size()) {
                            changes = true;
                        }
                    }
                }
            }
        }
    }

    for (auto &F : M) {
        for (auto &BB : F) {
            // once we have the branch that is associated with it, then we are
            // ready to get a tree of the instructions
            // TODO: replace with it's own pass, to adequately separate jobs
            // outs() << conditionalMapping[&BB].size();
            for (auto &Inst : BB) {
                InstructionTreeRepresentation *tree;

                auto *gep = dyn_cast<GetElementPtrInst>(&Inst);
                // if (gep) {
                tree = new InstructionTreeRepresentation(&Inst);
                tree->buildTree();
                tree->assignConditions(conditionalMapping);
                Res.push_back(tree);
                //}
            }
        }
    }
    return Res;
}

PreservedAnalyses BuildACFTreePrinter::run(llvm::Module &M,
                                           llvm::ModuleAnalysisManager &MAM) {
    auto DirectCalls = MAM.getResult<BuildACFTree>(M);

    printBuildACFTree(OS, DirectCalls);
    return PreservedAnalyses::all();
}

BuildACFTree::Result BuildACFTree::run(llvm::Module &M,
                                       llvm::ModuleAnalysisManager &MAM) {
    return runOnModule(M);
}

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
AnalysisKey BuildACFTree::Key;

llvm::PassPluginLibraryInfo getBuildACFTreePluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "build-acf-tree", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                // #1 REGISTRATION FOR "opt
                // -passes=print<build-instruction-tree>"
                PB.registerPipelineParsingCallback(
                    [&](StringRef Name, ModulePassManager &MPM,
                        ArrayRef<PassBuilder::PipelineElement>) {
                        if (Name == "print<build-acf-tree>") {
                            MPM.addPass(BuildACFTreePrinter(llvm::errs()));
                            return true;
                        }
                        return false;
                    });

                // #2 REGISTRATION FOR "MAM.getResult<BuildACFTree>(Module)"
                PB.registerAnalysisRegistrationCallback(
                    [](ModuleAnalysisManager &MAM) {
                        MAM.registerPass([&] { return BuildACFTree(); });
                    });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getBuildACFTreePluginInfo();
}

static void printBuildACFTree(llvm::raw_ostream &OutS,
                              const ResultBuildACFTree &InstructionTrees) {
    OutS << "================================================="
         << "\n";
    OutS << "BuildACFTree: static analysis results\n";
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
