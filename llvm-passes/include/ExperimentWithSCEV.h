//==============================================================================
// FILE:
//    ExperimentWithSCEV.h
//
// DESCRIPTION:
//    Declares the ExperimentWithSCEV pass for the new and the legacy pass
//    managers.
//
// License: MIT
//==============================================================================
#ifndef NSERC_2024_BUILD_INSTRUCTION_TREE_H
#define NSERC_2024_BUILD_INSTRUCTION_TREE_H

#include "ACFTree.h"
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
#include <llvm/Analysis/ScalarEvolutionExpressions.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>
#include <vector>
//------------------------------------------------------------------------------
// New PM interface
//------------------------------------------------------------------------------
using namespace llvm;
using ResultExperimentWithSCEV = std::map<Instruction *, ACFTree *>;

struct ExperimentWithSCEV : public AnalysisInfoMixin<ExperimentWithSCEV> {
    using Result = ResultExperimentWithSCEV;
    Result run(Module &M, ModuleAnalysisManager &);
    Result runOnModule(Module &M);

    void getAnalysisUsage(AnalysisUsage &AU) const;

    void printSCEVtree(raw_ostream &OutS, const std::string &prefix,
                       const SCEV *scev, bool isFirst, bool isLast);

    // Without isRequired returning true, this pass will be skipped for
    // functions decorated with the optnone LLVM attribute. Note that clang -O0
    // decorates all functions with optnone.
    static bool isRequired() { return true; }

  private:
    // A special type used by analysis passes to provide an address that
    // identifies that particular analysis pass type.
    static AnalysisKey Key;
    friend struct AnalysisInfoMixin<ExperimentWithSCEV>;
};

//------------------------------------------------------------------------------
// New PM interface for the printer pass
//------------------------------------------------------------------------------
class ExperimentWithSCEVPrinter
    : public PassInfoMixin<ExperimentWithSCEVPrinter> {
  public:
    explicit ExperimentWithSCEVPrinter(raw_ostream &OutS) : OS(OutS) {}
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);
    // Part of the official API:
    //  https://llvm.org/docs/WritingAnLLVMNewPMPass.html#required-passes
    static bool isRequired() { return true; }

  private:
    raw_ostream &OS;
};

class AddAlwaysInline 
    : public PassInfoMixin<ExperimentWithSCEVPrinter> {
  public:
    explicit AddAlwaysInline(raw_ostream &OutS) : OS(OutS) {}
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);
    // Part of the official API:
    //  https://llvm.org/docs/WritingAnLLVMNewPMPass.html#required-passes
    static bool isRequired() { return true; }

  private:
    raw_ostream &OS;
};
#endif // NSERC_2024_BUILD_INSTRUCTION_TREE_H
