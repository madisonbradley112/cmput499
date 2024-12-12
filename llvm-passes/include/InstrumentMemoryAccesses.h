//==============================================================================
// FILE:
//    InstrumentMemoryAccesses.h
//
// DESCRIPTION:
//    Declares the InstrumentMemoryAccesses pass for the new and the legacy pass
//    managers.
//
// License: MIT
//==============================================================================
#ifndef NSERC_2024_INSTRUMENT_MEMORY_ACCESSES_H
#define NSERC_2024_INSTRUMENT_MEMORY_ACCESSES_H

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

//------------------------------------------------------------------------------
// New PM interface
//------------------------------------------------------------------------------
struct InstrumentMemoryAccesses
    : public llvm::PassInfoMixin<InstrumentMemoryAccesses> {
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &);
    bool runOnModule(llvm::Module &M);

    // Without isRequired returning true, this pass will be skipped for
    // functions decorated with the optnone LLVM attribute. Note that clang -O0
    // decorates all functions with optnone.
    static bool isRequired() { return true; }
};

#endif // NSERC_2024_INSTRUMENT_MEMORY_ACCESSES_H
