//==============================================================================
// FILE:
//    ACFTree.h
//
// DESCRIPTION:
//    Declares the ACFTree class for the new and the legacy pass
//    managers. This tree represents an expression for a load or store
//    expression, and the expressions that created the operands.
//
// License: MIT
//==============================================================================
#ifndef NSERC_2024_ACF_TREE_H
#define NSERC_2024_ACF_TREE_H

#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Analysis/ScalarEvolutionExpressions.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Support/Casting.h>
#include <set>
#include <unordered_map>

using namespace llvm;

class ACFTree {
  public:
    ACFTree(ScalarEvolution *scevResult, Instruction *root, LoopInfo *loop, ACFTree *parent);
    ~ACFTree();

    Instruction *getRoot() { return root; }
    const SCEV *getScevRoot() { return scevRoot; }
    ACFTree *getChild(size_t i) { 
        if (dyn_cast<Instruction>(getRoot()->getOperand(i))) {
            return this->childrenMap.at(dyn_cast<Instruction>(getRoot()->getOperand(i)));
        }
        return nullptr;
    }

    ACFTree *evaluateAtIteration(size_t iteration);
    bool isAncestor(ACFTree *potentialAncestor);
    void buildTree();
    void printTree();
    void assignConditions();
    void simplifySignExtension();

  private:
    Instruction *root;
    const SCEV *scevRoot;
    ScalarEvolution *scevResult;
    int numChildren;
    ACFTree *parent;
    LoopInfo *loop;
    std::vector<ACFTree *> children;
    std::unordered_map<Instruction *, ACFTree *> childrenMap;
    std::set<Instruction *> conditions;
    ACFTree *evaluateAtIteration(size_t iteration, ACFTree *node);
    void printTree(raw_ostream &OutS, const std::string &prefix, ACFTree *node,
                   bool isFirst, bool isLast);
};

#endif // NSERC_2024_ACF_TREE_H
