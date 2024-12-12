//==============================================================================
// FILE:
//    InstructionTreeRepresentation.h
//
// DESCRIPTION:
//    Declares the InstructionTreeRepresentation class for the new and the
//    legacy pass managers. This tree represents an expression for a load or
//    store expression, and the expressions that created the operands.
//
// License: MIT
//==============================================================================
#ifndef NSERC_2024_INSTRUCTION_TREE_H
#define NSERC_2024_INSTRUCTION_TREE_H

#include "llvm/IR/Module.h"
#include "llvm/Support/Format.h"
#include "llvm/Support/raw_ostream.h"
#include <iostream>
#include <llvm/IR/Instructions.h>
#include <map>
#include <set>
#include <sstream>

using namespace llvm;
using BlockToBranchInstructionMap =
    std::map<BasicBlock *,
             std::set<std::tuple<BranchInst *, BasicBlock *, bool>>>;

class InstructionTreeRepresentation {
  public:
    explicit InstructionTreeRepresentation(Instruction *root);
    ~InstructionTreeRepresentation();

    Instruction *getRoot() { return root; }
    InstructionTreeRepresentation *getLeftOperand() { return leftOperand; }
    InstructionTreeRepresentation *getRightOperand() { return rightOperand; }

    void buildTree();
    void assignConditions(const BlockToBranchInstructionMap &map);
    void printTree();

  private:
    Instruction *root;
    std::vector<std::pair<InstructionTreeRepresentation *, bool>> conditions;
    int numChildren;
    InstructionTreeRepresentation *leftOperand;
    InstructionTreeRepresentation *rightOperand;
    std::vector<InstructionTreeRepresentation *> children;

    void printTree(const std::string &prefix,
                   InstructionTreeRepresentation *node, bool isLeft);
};

#endif // NSERC_2024_INSTRUCTION_TREE_H
