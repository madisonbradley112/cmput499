//========================================================================
// FILE:
//     ExperimentWithSCEV.cpp
//
// DESCRIPTION:
// USAGE:
//      $  opt -load-pass-plugin <BUILD_DIR>/libExperimentWithSCEV.so
//      -passes="print<experiment-with-scev>" -disable-output <input-llvm-file>
//
//========================================================================
#include "../include/ExperimentWithSCEV.h"
#include "../include/ACFTree.h"
#include "SCEVRecurrenceRewriter.h"
#include <algorithm>
#include <llvm/ADT/FoldingSet.h>
#include <llvm/Analysis/CGSCCPassManager.h>
#include <llvm/Analysis/InlineAdvisor.h>
#include <llvm/Analysis/LoopAccessAnalysis.h>
#include <llvm/Analysis/LoopAnalysisManager.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Analysis/ScalarEvolutionExpressions.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Pass.h>
#include <llvm/Passes/OptimizationLevel.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Scalar/DCE.h>
#include <llvm/Transforms/Scalar/IndVarSimplify.h>
#include <llvm/Transforms/Scalar/LoopPassManager.h>
#include <llvm/Transforms/Scalar/LoopRotation.h>
#include <llvm/Transforms/Scalar/SCCP.h>
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include <llvm/Transforms/Scalar/SimplifyCFG.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Transforms/Utils.h>
#include <system_error>
#include <vector>
#include <iostream>
#include <fstream>

using namespace llvm;

#define DEBUG_TYPE "experiment-with-scev"


void printToCSV(std::string filename, ScalarEvolution *scevResult, ACFTree *tree, LoopInfo *LI,  unsigned long periodicity, 
    std::vector<const SCEV *> offsets, std::vector<const SCEV *> finalRepeatedSequence) {

  // open CSV
  std::error_code EC;
  raw_fd_ostream csv = raw_fd_ostream(filename, EC, llvm::sys::fs::OpenFlags::OF_Append);

  csv << "\"";
  tree->getRoot()->print(csv);
  csv << "\",";

  csv << "\"";
  tree->getScevRoot()->print(csv);
  csv << "\",";
  
  
  Loop * loop = LI->getLoopFor(tree->getRoot()->getParent());
  csv << "\"";
  csv << loop->getName();
  csv << "\",";

  
  long tripCount = scevResult->getSmallConstantMaxTripCount(loop);
  if (tripCount != 0) {
      csv << "\"" << tripCount << "\"" << ",";
  } else {
      csv << "\"" << "unknown" << "\"" << ",";
  }

  ScalarEvolution::LoopDisposition disposition = scevResult->getLoopDisposition(tree->getScevRoot(), loop);
          
  switch (disposition) {
    case ScalarEvolution::LoopInvariant:
      csv << "Loop invariant";
      break;          
    case ScalarEvolution::LoopVariant:
      csv << "Loop variant";
      break;
    case ScalarEvolution::LoopComputable:
      csv << "Loop computable";
      break;
    default: 
      csv << "Loop disposition unknown";
  }
  
  csv <<",";

  csv << "\"" << periodicity << "\"" << ",";
  if (periodicity == 0) {
    csv << "\"[ ";
    for (auto offset : offsets) {
        offset->print(csv);
        csv << "; ";
    } 
    csv << "]\"\n";
  } else {
    csv << "\"[ ";
    for (size_t i = 0; i < finalRepeatedSequence.size(); i++) {
        finalRepeatedSequence.at(i)->print(csv);
        csv << "; ";
    }
    csv << "]\"\n";
  }

  csv.close();

}

//-----------------------------------------------------------------------------
// experimentwithscev implementation
//-----------------------------------------------------------------------------
ExperimentWithSCEV::Result ExperimentWithSCEV::runOnModule(Module &M) {
    size_t lastindex = M.getSourceFileName().find_last_of("."); 
    std::string rawname; 
    if (lastindex == std::string::npos) {
        rawname = M.getSourceFileName();
    } else {
        rawname = M.getSourceFileName().substr(0, lastindex); 
    }
    std::string filename = rawname + "StridedAccesses.csv";

    std::error_code EC;
    raw_fd_ostream outputCSV = raw_fd_ostream(filename, EC);
    outputCSV << "Strided accesses analysis for " << M.getSourceFileName() << '\n';
    outputCSV << "Array access instruction, SCEV of array access instruction, Containing loop, Loop trip count, Loop disposition, Array access pattern periodicity, Array access pattern repeated sequence\n";
    outputCSV.close();
    Result Res;

    LoopAnalysisManager LAM;
    FunctionAnalysisManager FAM;
    CGSCCAnalysisManager CGAM;
    ModuleAnalysisManager MAM;

    PassBuilder PB;

    PB.registerModuleAnalyses(MAM);
    PB.registerCGSCCAnalyses(CGAM);
    PB.registerFunctionAnalyses(FAM);
    PB.registerLoopAnalyses(LAM);
    PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

    int variantCounter = 0;
    int computableCounter = 0;
    int invariantCounter = 0;

    for (auto &F : M) {
        // check that F actually has anything to analyze via SCEV
        bool hasSCEVableValues = false;
        for (auto &BB : F) {
            for (auto &I : BB) {
                if (I.getType()->isIntOrPtrTy()) {
                    hasSCEVableValues = true;
                    break;
                }
            }
            if (hasSCEVableValues) {
                break;
            }
        }

        if (!hasSCEVableValues) {
            continue;
        }

        ScalarEvolutionAnalysis::Result *SCEVresults =
            &FAM.getResult<ScalarEvolutionAnalysis>(F);
        LoopInfo *LI = &FAM.getResult<LoopAnalysis>(F);

        for (auto &BB : F) {
            // store all of the SCEVs for a GEP.
            std::map<Value *, std::vector<const SCEV *>> scevs;
            std::map<Value *, std::vector<const SCEV *>> offsets;
            std::vector<ACFTree *> scevTrees;
            Loop *L = LI->getLoopFor(&BB); 

            if (!L) {
                continue;
            }

            Value *inductionVar = L->getCanonicalInductionVariable();
            long tripCount = SCEVresults->getSmallConstantMaxTripCount(L);
           
            for (auto &I : BB) {
                if (&I == inductionVar) {
                    continue;
                }
                
                // ensure the valeu is SCEV-able
                if (!I.getType()->isIntOrPtrTy()) {
                    continue;
                }
                
                // ensure it's a GEP instruction; we don't care about others
                auto *gep = dyn_cast<GetElementPtrInst>(&I);
                if (!gep) {
                    continue;
                }

                // ensure that it's loop computable or invariant
                if (SCEVresults->getLoopDisposition(SCEVresults->getSCEV(&I), LI->getLoopFor(&BB)) == ScalarEvolution::LoopVariant) {
                    variantCounter++;
                    continue;
                } 
                
                ACFTree *tree = new ACFTree(SCEVresults, &I, LI, nullptr);
                tree->buildTree();
                // I.print(outs());
                // tree->printTree(); 

                std::vector<const SCEV *> offsets;
                // a million is plenty
                long upperBound = 1000;
                long lowerBound = 10;
                long numOffsets = std::max(lowerBound, std::min(tripCount, upperBound)); 
                for (long i = 1; i < numOffsets; i++) {
                    ACFTree *firstIteration = tree->evaluateAtIteration(i);
                    ACFTree *secondIteration = tree->evaluateAtIteration(i + 1);

                    const SCEV *offset = SCEVresults->getMinusSCEV(
                        secondIteration->getScevRoot(),
                        firstIteration->getScevRoot());
                    delete firstIteration;
                    delete secondIteration;
                    offsets.push_back(offset);
                }
                // once we have a list of offsets, detect repeating patterns
                // via the sliding window approach (will be exact)
                unsigned long periodicity = 0;
                std::vector<const SCEV *> finalRepeatedSequence;
                for (unsigned long windowSize = 1;
                     windowSize < (offsets.size() / 2); windowSize++) {
                    std::vector<const SCEV *> fullArr;
                    // split the offsets array into chunks with the size
                    unsigned long numSubarrays = offsets.size() / windowSize;
                    std::vector<const SCEV *> word(
                        offsets.begin(), offsets.begin() + windowSize);

                    for (unsigned long i = 0; i < numSubarrays; i++) {
                        fullArr.insert(fullArr.end(), word.begin(), word.end());
                    }

                    bool equal = true;
                    for (unsigned long i = 0; i < offsets.size(); i++) {
                        if (i < fullArr.size() && offsets.at(i) != fullArr.at(i)) {
                            equal = false;
                            break;
                        }
                    }

                    if (equal) {
                        finalRepeatedSequence.insert(
                            finalRepeatedSequence.end(), word.begin(),
                            word.end());
                        periodicity = windowSize;
                        break;
                    }
                }

                outs() << "\n-----------------------------------------------\n";
                outs() << "BEFORE SUBSTITUTION";
                tree->printTree();
                outs() << "\n\n";
                outs() << "AFTER SUBSTITUTION";
                ACFTree *firstIteration = tree->evaluateAtIteration(1);
                ACFTree *secondIteration = tree->evaluateAtIteration(2);
                firstIteration->printTree();
                secondIteration->printTree();
                
                if (tripCount != 0) {
                    outs() << "\nloop trip count: " << tripCount; 
                } else {
                    outs() << "\nloop trip count: unknown"; 
                }
                
                outs() << "\nperiodicity of the accesses: " << periodicity
                       << '\n';
                
                if (periodicity == 0) {
                    outs() << "full sequence: ";
                    outs() << "[ ";
                    for (auto offset : offsets) {
                        offset->print(outs());
                        outs() << "; ";
                    } 
                    outs() << "]";
                } else {
                    outs() << "repeated sequence: ";
                    outs() << "[ ";
                    for (size_t i = 0; i < finalRepeatedSequence.size(); i++) {
                        finalRepeatedSequence.at(i)->print(outs());
                        outs() << "; ";
                    }
                    outs() << "]";
                }

                
                outs() << "\n-----------------------------------------------\n";
                printToCSV(filename, SCEVresults, tree, LI, periodicity, offsets, finalRepeatedSequence);
                delete tree;
            }

        }
    }


    return Res;
}

PreservedAnalyses
AddAlwaysInline::run(llvm::Module &M,
                               llvm::ModuleAnalysisManager &MAM) {
    
    for (auto &F : M) {
        F.setAttributes(F.getAttributes().removeFnAttribute(M.getContext(), Attribute::AttrKind::NoInline));
        F.setAttributes(F.getAttributes().addFnAttribute(M.getContext(), Attribute::AttrKind::AlwaysInline));
    }

    return PreservedAnalyses::none();
}

PreservedAnalyses
ExperimentWithSCEVPrinter::run(llvm::Module &M,
                               llvm::ModuleAnalysisManager &MAM) {
    auto DirectCalls = MAM.getResult<ExperimentWithSCEV>(M);

    return PreservedAnalyses::none();
}

ExperimentWithSCEV::Result
ExperimentWithSCEV::run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) {

    return runOnModule(M);
}

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
AnalysisKey ExperimentWithSCEV::Key;

llvm::PassPluginLibraryInfo getExperimentWithSCEVPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION, "experiment-with-scev", LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            // #1 REGISTRATION FOR "opt -passes=print<experiment-with-scev>"
            PB.registerPipelineParsingCallback(
                [&](StringRef Name, ModulePassManager &MPM,
                    ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "print<experiment-with-scev>") {
                        MPM.addPass(createModuleToFunctionPassAdaptor(
                            createFunctionToLoopPassAdaptor(
                                IndVarSimplifyPass())));
                        MPM.addPass(ExperimentWithSCEVPrinter(llvm::errs()));
                        return true;
                    }
                    return false;
                });

            // #2 REGISTRATION FOR -01/2/3/s
            PB.registerOptimizerLastEPCallback(
                [&](ModulePassManager &MPM, OptimizationLevel Level) {
                    // MPM.addPass(AddAlwaysInline(llvm::errs()));
                    // MPM.addPass(AlwaysInlinerPass());
                    MPM.addPass(createModuleToFunctionPassAdaptor(
                        createFunctionToLoopPassAdaptor(IndVarSimplifyPass())));
                    MPM.addPass(createModuleToFunctionPassAdaptor(
                        SimplifyCFGPass()));
                    MPM.addPass(ExperimentWithSCEVPrinter(llvm::errs()));
                });

            // #3 REGISTRATION FOR
            // "MAM.getResult<ExperimentWithSCEV>(Module)"
            PB.registerAnalysisRegistrationCallback(
                [](ModuleAnalysisManager &MAM) {
                    FunctionAnalysisManager FAM;
                    MAM.registerPass([&] { return ExperimentWithSCEV(); });
                });
        }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getExperimentWithSCEVPluginInfo();
}
