//==============================================================================
// FILE:
//    BuildACFTree.h
//
// DESCRIPTION:
//    Declares the BuildACFTree pass for the new and the legacy pass
//    managers.
//
// License: MIT
//==============================================================================
#ifndef NSERC_2024_BUILD_INSTRUCTION_TREE_H
#define NSERC_2024_BUILD_INSTRUCTION_TREE_H

#include "InstructionTreeRepresentation.h"
#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Scalar/FlattenCFG.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"
#include "llvm/Transforms/Utils/SimplifyCFGOptions.h"
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>
#include <vector>

//------------------------------------------------------------------------------
// New PM interface
//------------------------------------------------------------------------------
using ResultBuildACFTree = std::vector<InstructionTreeRepresentation *>;

struct BuildACFTree : public llvm::AnalysisInfoMixin<BuildACFTree> {
    using Result = ResultBuildACFTree;
    Result run(llvm::Module &M, llvm::ModuleAnalysisManager &);
    Result runOnModule(llvm::Module &M);

    void getAnalysisUsage(AnalysisUsage &AU) const;

    // Without isRequired returning true, this pass will be skipped for
    // functions decorated with the optnone LLVM attribute. Note that clang -O0
    // decorates all functions with optnone.
    static bool isRequired() { return true; }

  private:
    // A special type used by analysis passes to provide an address that
    // identifies that particular analysis pass type.
    static llvm::AnalysisKey Key;
    friend struct llvm::AnalysisInfoMixin<BuildACFTree>;
};

//------------------------------------------------------------------------------
// New PM interface for the printer pass
//------------------------------------------------------------------------------
class BuildACFTreePrinter : public llvm::PassInfoMixin<BuildACFTreePrinter> {
  public:
    explicit BuildACFTreePrinter(llvm::raw_ostream &OutS) : OS(OutS) {}
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);
    // Part of the official API:
    //  https://llvm.org/docs/WritingAnLLVMNewPMPass.html#required-passes
    static bool isRequired() { return true; }

  private:
    llvm::raw_ostream &OS;
};

#endif // NSERC_2024_BUILD_INSTRUCTION_TREE_H
