//========================================================================
// FILE:
//      DetectMemoryAccessesAnalysis.cpp
//
// DESCRIPTION:
//      Static analysis pass that collects all the load/store instructions in
//      the pass Result. This pass is used as an intermediate step in the
//      calculation of an ACF representation of any loads/stores.
//
// USAGE:
//      $  opt -load-pass-plugin <BUILD_DIR>/libDetectMemoryAccessesAnalysis.so
//      -passes="print<detect-memory-accesses>" -disable-output
//      <input-llvm-file>
//
//========================================================================
#include "../include/DetectMemoryAccessesAnalysis.h"

using namespace llvm;

#define DEBUG_TYPE "detect-memory-accesses"

// Pretty-prints the result of this analysis
static void
printDetectMemoryAccessesResult(llvm::raw_ostream &OutS,
                                const ResultDetectMemoryAccesses &Accesses);

//-----------------------------------------------------------------------------
// DetectMemoryAccessesAnalysis implementation
//-----------------------------------------------------------------------------
DetectMemoryAccessesAnalysis::Result
DetectMemoryAccessesAnalysis::runOnModule(Module &M) {
    std::vector<std::pair<llvm::Function *, llvm::Instruction *>> Res;
    for (auto &F : M) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                // If this is a load or store function, then these will not be
                // nullptr.
                auto *load = dyn_cast<LoadInst>(&Inst);
                auto *store = dyn_cast<StoreInst>(&Inst);

                // depending on the instruction type, the memory access location
                // can be found in different operands.
                if (store == nullptr && load == nullptr) {
                    continue;
                } else if (store == nullptr) {
                    Res.push_back(std::make_pair(&F, load));
                } else {
                    Res.push_back(std::make_pair(&F, store));
                }
            }
        }
    }

    return Res;
}

PreservedAnalyses
DetectMemoryAccessesPrinter::run(llvm::Module &M,
                                 llvm::ModuleAnalysisManager &MAM) {
    auto DirectCalls = MAM.getResult<DetectMemoryAccessesAnalysis>(M);

    printDetectMemoryAccessesResult(OS, DirectCalls);
    return PreservedAnalyses::all();
}

DetectMemoryAccessesAnalysis::Result
DetectMemoryAccessesAnalysis::run(llvm::Module &M,
                                  llvm::ModuleAnalysisManager &) {
    return runOnModule(M);
}

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
AnalysisKey DetectMemoryAccessesAnalysis::Key;

llvm::PassPluginLibraryInfo getDetectMemoryAccessesAnalysisPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "detect-memory-accesses",
            LLVM_VERSION_STRING, [](PassBuilder &PB) {
                // #1 REGISTRATION FOR "opt
                // -passes=print<detect-memory-accesses>"
                PB.registerPipelineParsingCallback(
                    [&](StringRef Name, ModulePassManager &MPM,
                        ArrayRef<PassBuilder::PipelineElement>) {
                        if (Name == "print<detect-memory-accesses>") {
                            MPM.addPass(
                                DetectMemoryAccessesPrinter(llvm::errs()));
                            return true;
                        }
                        return false;
                    });
                // #2 REGISTRATION FOR
                // "MAM.getResult<DetectMemoryAccessesAnalysis>(Module)"
                PB.registerAnalysisRegistrationCallback(
                    [](ModuleAnalysisManager &MAM) {
                        MAM.registerPass(
                            [&] { return DetectMemoryAccessesAnalysis(); });
                    });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getDetectMemoryAccessesAnalysisPluginInfo();
}

static void
printDetectMemoryAccessesResult(llvm::raw_ostream &OutS,
                                const ResultDetectMemoryAccesses &Accesses) {
    OutS << "================================================="
         << "\n";
    OutS << "DetectMemoryAccessesAnalysis: static analysis results\n";
    OutS << "=================================================\n";
    const char *funcStr = "FUNCTION";
    const char *instrStr = "INSTR TYPE";
    const char *addrStr = "ADDR REGISTER";
    OutS << format("%-15s %-15s %-15s \n", funcStr, instrStr, addrStr);
    OutS << "-------------------------------------------------"
         << "\n";

    for (auto Inst : Accesses) {
        auto *load = dyn_cast<LoadInst>(Inst.second);

        const char *functionName = Inst.first->getName().data();
        unsigned int instrLineNumber = UINT32_MAX;
        if (Inst.second->getDebugLoc()) {
            instrLineNumber = Inst.second->getDebugLoc().getLine();
        }

        int addrRegisterOperandLocation;
        const char *instrType;
        if (load != nullptr) {
            // it's a load, operand is at index 0
            // format: load i32, ptr %ptr
            addrRegisterOperandLocation = 0;
            instrType = "load";
        } else {
            // it's a store, operand is at index 1
            // format: store i32 3, ptr %ptr
            addrRegisterOperandLocation = 1;
            instrType = "store";
        }

        const char *addrRegisterName =
            Inst.second->getOperand(addrRegisterOperandLocation)
                ->getName()
                .data();
        OutS << format("%-15s %-15s %-15s\n", functionName, instrType,
                       addrRegisterName);
    }

    OutS << "-------------------------------------------------"
         << "\n\n";
}