//========================================================================
// FILE:
//    InstrumentMemoryAccesses.cpp
//
// DESCRIPTION:
//    Instruments the LLVM IR so that a print function call is inserted before
//    each load or store instruction. This print call prints out a unique
//    identifier of the instruction with the load/store, and the address that
//    the instruction is loading from or storing to.
//
//    Important note: This is an analysis done dynamically via insertion of
//    function calls, not statically. So, any results are only obtained at
//    runtime. This prevents any future optimizations being made on the code,
//    undermining its usefulness as an analysis. Thus, this pass is mostly for
//    demonstration and testing purposes.
//
// USAGE:
//      $ opt -S -load-pass-plugin=<BUILD_DIR>/libInstrumentMemoryAccesses.so
//      `\`
//        -passes="instrument-memory" <source-file> -o instrumented.ll
//      $ lli instrumented.ll
//
//========================================================================
#include "../include/InstrumentMemoryAccesses.h"
//#include "../include/InstIterator.h"      //not working for some reason

using namespace llvm;

#define DEBUG_TYPE "instrument-memory"

void setUpFunctions(Module &M, IRBuilder<> *Builder) {
    auto &CTX = M.getContext();

    // setup the handleMemAccess function, with attributes
    FunctionType *handleMemAccessTy = FunctionType::get(/*Return type =*/Type::getVoidTy(CTX), /*Parameter types =*/{PointerType::getUnqual(Type::getInt8Ty(CTX)), IntegerType::getInt32Ty(CTX)},/*IsVarArgs=*/false);

    // Get/insert declaration of handleMemAccesses function
    //FunctionCallee handleMemAccessesF

    M.getOrInsertFunction("handleMemAccesses", handleMemAccessTy);

    // setup testPrint function to check that the unique instruction identifier works
    FunctionType *testPrintTy = FunctionType::get(
        Type::getVoidTy(CTX), {IntegerType::getInt32Ty(CTX), PointerType::getUnqual(Type::getInt8Ty(CTX)) /*IntegerType::getInt32Ty(CTX)*/}, false);


    //FunctionCallee testPrintF

    M.getOrInsertFunction("testPrintF", testPrintTy);

}

//-----------------------------------------------------------------------------
// InstrumentMemoryAccesses implementation
//-----------------------------------------------------------------------------
bool InstrumentMemoryAccesses::runOnModule(Module &M) {

    printf("PLEASE NO SEGDFAULT\n");
    int counter = 0; // counter assigns unique index to each memory instruction
    //int type = 0; // flag specifying whether the instruction was a load or a store      0 = load, 1 = store
    //
    auto &CTX = M.getContext();

    bool Instrumented = false;

    for (auto &F : M) {
        if(F.isDeclaration()){
            continue;
        }

        IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt());
        // Set up function declaration(?) at the start of the first function (?)
        setUpFunctions(M, &Builder);


        // F is a pointer to a Function instance
        //for (auto Inst = BB )
        //for (inst_iterator Inst = inst_begin(F), E = inst_end(F); Inst != E; ++Inst){
        for (auto &BB : F){
            for (auto &Inst : BB){
                //"The dyn_cast<> operator is a “checking cast” operation. It checks to see if the operand is of the specified type, and if so,
                // returns a pointer to it (this operator does not work with references).
                // If the operand is not of the correct type, a null pointer is returned."
                //auto *load = dyn_cast<LoadInst>(&Inst);
                //auto *store = dyn_cast<StoreInst>(&Inst);
                auto *gepi = dyn_cast<GetElementPtrInst>(&Inst);

                // Depending on the instruction type, the memory access location can be found in different operands.
                //Instruction *memoryAccessInst = load;
                //Value *memoryAccessLocation;
                //Value *instructionLocation;
                //Value *element;

                //if (store == nullptr && load == nullptr) {
                  //  continue;
                //}
                //
                if (gepi == nullptr){
                    continue;
                }

                Builder.SetInsertPoint(Inst.getNextNode());
                counter += 1;
                //Builder.CreateCall(testPrintF, {constIntCounter, gepi->getOperand(0)})

                //if (store == nullptr) { // if the memory access was a load
                
                //    memoryAccessInst = load;
                //    memoryAccessLocation = memoryAccessInst->getOperand(0);
                //    type = 0;

                    //Builder.CreateCall(testPrintF, {constIntCounter, memoryAccessLocation,  constInstAccessType});

                //} else { // if the memory access was a store
                //    memoryAccessInst = store;
                    //element = store->getValueOperand();
                    //printf("ELEMENT");
                //    memoryAccessLocation = memoryAccessInst->getOperand(1);
                //    type = 1;
                   // Builder.CreateCall(testPrintF, {constIntCounter, memoryAccessLocation, constInstAccessType});
                // }



		ConstantInt *constIntCounter = ConstantInt::get(IntegerType::getInt32Ty(CTX), counter, false);
	        //ConstantInt *constInstAccessType = ConstantInt::get(IntegerType::getInt32Ty(CTX), type, false);
    		FunctionCallee handleMemAccesses = M.getFunction("handleMemAccesses");

                Builder.CreateCall(handleMemAccesses, {gepi, /*gepi->getOperand(1)*/ constIntCounter});
                



                // Set the insert point of the Builder to be directly after the memory instruction
                //BasicBlock::iterator nextInst = Inst +1;
                //inst_iterator nextInst
                //Iterator nextInst = Inst;
                //nextInst++;
                //if(&Inst != BB->end()){
                //    auto nextInst = std::next(&Inst);
                // call the testPrint function from the linked C file to test if the unique instruction identifiers work
                //Builder.CreateCall(handleMemAccessesF, {&ConstIntCounter});
               // Builder.CreateCall(testPrintF, {constIntCounter, memoryAccessLocation, constInstAccessType});
                // }

                LLVM_DEBUG(dbgs() << " Instrumented: " << F.getName() << "\n");

                Instrumented = true;


    }
        }}

    // Stop here if there are no function definitions in this module
    if (false == Instrumented)
        return Instrumented;

    return true;

}

PreservedAnalyses InstrumentMemoryAccesses::run(llvm::Module &M,
                                                llvm::ModuleAnalysisManager &) {
    bool Changed = runOnModule(M);

    return (Changed ? llvm::PreservedAnalyses::none()
                    : llvm::PreservedAnalyses::all());
}

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
llvm::PassPluginLibraryInfo getInstrumentMemoryAccessesPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "instrument-memory", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, ModulePassManager &MPM,
                       ArrayRef<PassBuilder::PipelineElement>) {
                        if (Name == "instrument-memory") {
                            MPM.addPass(InstrumentMemoryAccesses());
                            return true;
                        }
                        return false;
                    });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getInstrumentMemoryAccessesPluginInfo();
}
