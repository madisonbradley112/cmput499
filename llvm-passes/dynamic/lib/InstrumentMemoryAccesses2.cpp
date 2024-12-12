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

using namespace llvm;

#define DEBUG_TYPE "instrument-memory"

void setUpFunctions(Module &M, IRBuilder<> *Builder) {
    auto &CTX = M.getContext();

    // a FILE * can be seen as a pointer to an int8 type.
    // setup the fopen function
    PointerType *StringPtrArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX));
    PointerType *FilePointerArgTy =
        PointerType::getUnqual(Type::getInt8Ty(CTX));
    FunctionType *FopenTy =
        FunctionType::get(FilePointerArgTy, {StringPtrArgTy, StringPtrArgTy},
                          /*IsVarArgs=*/true);

    FunctionCallee Fopen = M.getOrInsertFunction("fopen", FopenTy);

    // setup the fprintf function, with attributes
    FunctionType *FprintfTy = FunctionType::get(
        IntegerType::getInt32Ty(CTX), {FilePointerArgTy, StringPtrArgTy},
        /*IsVarArgs=*/true);

    FunctionCallee Fprintf = M.getOrInsertFunction("fprintf", FprintfTy);

    llvm::Constant *LoadResultFormatStr = llvm::ConstantDataArray::getString(
        CTX, "load instruction with id: %d\t accesses memory location: %p\n");
    Constant *LoadResultFormatStrVar = M.getOrInsertGlobal(
        "LoadResultFormatStrIR", LoadResultFormatStr->getType());
    dyn_cast<GlobalVariable>(LoadResultFormatStrVar)
        ->setInitializer(LoadResultFormatStr);

    llvm::Constant *StoreResultFormatStr = llvm::ConstantDataArray::getString(
        CTX, "store instruction with id: %d\t accesses memory location: %p\n");
    Constant *StoreResultFormatStrVar = M.getOrInsertGlobal(
        "StoreResultFormatStrIR", StoreResultFormatStr->getType());
    dyn_cast<GlobalVariable>(StoreResultFormatStrVar)
        ->setInitializer(StoreResultFormatStr);

    llvm::Constant *FileLocationStr =
        llvm::ConstantDataArray::getString(CTX, "./memoryaccesses.txt");
    Constant *FileLocationStrVar =
        M.getOrInsertGlobal("fileLocationStrIR", FileLocationStr->getType());
    dyn_cast<GlobalVariable>(FileLocationStrVar)
        ->setInitializer(FileLocationStr);

    llvm::Constant *FileWriteStr = llvm::ConstantDataArray::getString(CTX, "w");
    Constant *FileWriteStrVar =
        M.getOrInsertGlobal("fileWriteStrIR", FileWriteStr->getType());
    dyn_cast<GlobalVariable>(FileWriteStrVar)->setInitializer(FileWriteStr);

    llvm::Constant *FileAppendStr =
        llvm::ConstantDataArray::getString(CTX, "a");
    Constant *FileAppendStrVar =
        M.getOrInsertGlobal("fileAppendStrIR", FileAppendStr->getType());
    dyn_cast<GlobalVariable>(FileAppendStrVar)->setInitializer(FileAppendStr);
}

//-----------------------------------------------------------------------------
// InstrumentMemoryAccesses implementation
//-----------------------------------------------------------------------------
bool InstrumentMemoryAccesses::runOnModule(Module &M) {
    bool Instrumented = false;
    bool openedAlready = false;

    auto &CTX = M.getContext();

    // empty the file at the start of the main function, if it exists
    Module::iterator MI = M.begin();
    Function &main = *MI;
    Function::iterator FI = main.begin();
    BasicBlock &firstBlock = *FI;
    BasicBlock::iterator BI = firstBlock.begin();
    Instruction &firstInst = *BI;

    IRBuilder<> Builder(&firstInst);
    setUpFunctions(M, &Builder);

    PointerType *StringPtrArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX));
    FunctionCallee Fprintf = M.getFunction("fprintf");
    FunctionCallee Fopen = M.getFunction("fopen");
    Constant *fileLocationStrVar = M.getGlobalVariable("fileLocationStrIR");
    Constant *fileWriteStrVar = M.getGlobalVariable("fileWriteStrIR");
    Constant *fileAppendStrVar = M.getGlobalVariable("fileAppendStrIR");
    Constant *LoadResultFormatStrVar =
        M.getGlobalVariable("LoadResultFormatStrIR");
    Constant *StoreResultFormatStrVar =
        M.getGlobalVariable("StoreResultFormatStrIR");

    llvm::Value *fileLocationStrPtr =
        Builder.CreatePointerCast(fileLocationStrVar, StringPtrArgTy);
    llvm::Value *fileWriteStrPtr =
        Builder.CreatePointerCast(fileWriteStrVar, StringPtrArgTy);
    llvm::Value *fileAppendStrPtr =
        Builder.CreatePointerCast(fileAppendStrVar, StringPtrArgTy);
    llvm::Value *LoadResultFormatStrPtr =
        Builder.CreatePointerCast(LoadResultFormatStrVar, StringPtrArgTy);
    llvm::Value *StoreResultFormatStrPtr =
        Builder.CreatePointerCast(StoreResultFormatStrVar, StringPtrArgTy);

    Builder.CreateCall(Fopen, {fileLocationStrPtr, fileWriteStrPtr});

    for (auto &F : M) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                // If this is a load or store function, then these will not be
                // nullptr.
                auto *load = dyn_cast<LoadInst>(&Inst);
                auto *store = dyn_cast<StoreInst>(&Inst);

                // depending on the instruction type, the memory access location
                // can be found in different operands.
                Instruction *memoryAccessInst = load;
                Value *memoryAccessLocation;
                Value *instructionLocation;
                if (store == nullptr && load == nullptr) {
                    continue;
                } else if (store == nullptr) {
                    memoryAccessInst = load;
                    memoryAccessLocation = memoryAccessInst->getOperand(0);
                } else {
                    memoryAccessInst = store;
                    memoryAccessLocation = memoryAccessInst->getOperand(1);
                }

                Builder.SetInsertPoint(memoryAccessInst->getNextNode());

                // get the unique identifier of an instruction
                auto identifier = ConstantInt::get(
                    IntegerType::getInt32Ty(CTX),
                    reinterpret_cast<uintptr_t>(memoryAccessInst));

                llvm::Value *filePtr = Builder.CreateCall(
                    Fopen, {fileLocationStrPtr, fileAppendStrPtr});
                if (store == nullptr) {
                    Builder.CreateCall(Fprintf,
                                       {filePtr, LoadResultFormatStrPtr,
                                        identifier, memoryAccessLocation});
                } else {
                    Builder.CreateCall(
                        Fprintf, {filePtr, StoreResultFormatStrPtr, identifier,
                                  memoryAccessInst->getOperand(1)});
                }

                LLVM_DEBUG(dbgs() << " Instrumented: " << F.getName() << "\n");

                Instrumented = true;
            }
        }
    }

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
