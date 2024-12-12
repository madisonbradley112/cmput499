//==============================================================================
// FILE:
//    DetectMemoryAccessesAnalysis.h
//
// DESCRIPTION:
//    Declares the DetectMemoryAccessesAnalysis pass for the new and the legacy
//    pass managers.
//
// License: MIT
//==============================================================================
#ifndef NSERC_2024_DETERMINE_MEMORY_ACCESSES_ANALYSIS_H
#define NSERC_2024_DETERMINE_MEMORY_ACCESSES_ANALYSIS_H

#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>
#include <vector>

//------------------------------------------------------------------------------
// New PM interface
//------------------------------------------------------------------------------
using ResultDetectMemoryAccesses =
    std::vector<std::pair<llvm::Function *, llvm::Instruction *>>;

struct DetectMemoryAccessesAnalysis
    : public llvm::AnalysisInfoMixin<DetectMemoryAccessesAnalysis> {
    using Result = ResultDetectMemoryAccesses;
    Result run(llvm::Module &M, llvm::ModuleAnalysisManager &);
    Result runOnModule(llvm::Module &M);

    // Without isRequired returning true, this pass will be skipped for
    // functions decorated with the optnone LLVM attribute. Note that clang -O0
    // decorates all functions with optnone.
    static bool isRequired() { return true; }

  private:
    // A special type used by analysis passes to provide an address that
    // identifies that particular analysis pass type.
    static llvm::AnalysisKey Key;
    friend struct llvm::AnalysisInfoMixin<DetectMemoryAccessesAnalysis>;
};

//------------------------------------------------------------------------------
// New PM interface for the printer pass
//------------------------------------------------------------------------------
class DetectMemoryAccessesPrinter
    : public llvm::PassInfoMixin<DetectMemoryAccessesPrinter> {
  public:
    explicit DetectMemoryAccessesPrinter(llvm::raw_ostream &OutS) : OS(OutS) {}
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);
    // Part of the official API:
    //  https://llvm.org/docs/WritingAnLLVMNewPMPass.html#required-passes
    static bool isRequired() { return true; }

  private:
    llvm::raw_ostream &OS;
};

#endif // NSERC_2024_DETERMINE_MEMORY_ACCESSES_ANALYSIS_H
