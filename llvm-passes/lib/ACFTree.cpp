//==============================================================================
// FILE:
//    ACFTree.cpp
//
// DESCRIPTION:
//    Defines the ACFTree class. This tree represents an
//    ACF expression.
//
// License: MIT
//==============================================================================

#include "../include/ACFTree.h"
#include "SCEVRecurrenceRewriter.h"
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Analysis/ScalarEvolutionExpressions.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/CommandLine.h>

ACFTree::ACFTree(ScalarEvolution *scevRes, Instruction *root, LoopInfo *loop, ACFTree *parent) {
    this->root = root;
    this->parent = parent;
    this->loop = loop;
    this->scevResult = scevRes;
    if (scevRes && root && root->getType()->isIntOrPtrTy()) {
        if (this->scevResult->getSCEV(root)->getSCEVType() <= SCEVTypes::scCouldNotCompute) {
            this->scevRoot = this->scevResult->getSCEV(root);
        } else {
            this->scevRoot = nullptr;
        }
    } else {
        this->scevRoot = nullptr;
    }
    this->numChildren = 0;
}

ACFTree::~ACFTree() {
    for (auto child : this->childrenMap) {
        delete child.second;
    }
}

// Checks whether the given node in potentialAncestor is an ancestor of
// the current node. This is to avoid cycles in the tree.
bool ACFTree::isAncestor(ACFTree *potentialAncestor) {
    bool isAncestor = false;
    ACFTree *currentAncestor = this->parent;
    while (!isAncestor && currentAncestor != nullptr) {
        if (potentialAncestor->root == currentAncestor->root) {
            isAncestor = true;
        }
        currentAncestor = currentAncestor->parent;
    }

    return isAncestor;
}

void ACFTree::buildTree() {
    for (unsigned int i = 0; i < root->getNumOperands(); i++) {
        auto *subtreeInst = dyn_cast<Instruction>(root->getOperand(i));
        if (subtreeInst && !this->childrenMap.count(subtreeInst)) {
            auto *subtree = new ACFTree(this->scevResult, subtreeInst, this->loop, this);
            
            if (!isAncestor(subtree)) {
                subtree->numChildren = 0;
                subtree->buildTree();
                this->childrenMap.insert(std::make_pair(subtreeInst, subtree));
                this->numChildren++;
            } else {
                delete subtree;
            }
        }
        subtreeInst = nullptr;
    }
}

ACFTree *ACFTree::evaluateAtIteration(size_t iteration, ACFTree *node) {
    ACFTree *evaluatedTree =
        new ACFTree(node->scevResult, node->root, node->loop, this->parent);
    
    if (evaluatedTree->scevRoot) {
        bool isChange = true;
        while (isChange) {
            // check if there were any changes in passing the  
            const SCEV *rewritten = SCEVRecurrenceRewriter::rewrite(evaluatedTree->scevRoot, *node->scevResult, node->loop, iteration);
            if (rewritten == evaluatedTree->scevRoot) {
                isChange = false;
            }

            evaluatedTree->scevRoot = rewritten;
        }
    }

    for (auto child : node->childrenMap) {
        // for each child, convert it to SCE
        evaluatedTree->childrenMap.insert(std::make_pair(child.first, child.second->evaluateAtIteration(iteration)));
        evaluatedTree->numChildren++;
        evaluatedTree->childrenMap.at(child.first)->parent = evaluatedTree;
    }

    return evaluatedTree;
}

ACFTree *ACFTree::evaluateAtIteration(size_t iteration) {
    return evaluateAtIteration(iteration, this);
}


void ACFTree::printTree(raw_ostream &OutS, const std::string &prefix,
                        ACFTree *node, bool isFirst, bool isLast) {
    if (node != nullptr) {

        OutS << prefix;

        if (isFirst) {
            OutS << "\n-->";
        } else {
            OutS << (isLast ? "└──" : "├──");
        }

        node->root->print(OutS);        
        OutS << "\t\t; SCEV: [ ";
        if (node->scevRoot) {
            node->scevRoot->print(OutS);
        } 

        OutS << " ]";

        Loop * loop = node->loop->getLoopFor(node->getRoot()->getParent());
        if (loop) {
          OutS << "\tLoop: [ " << loop->getName() << " ]";
        }

        OutS << "\tDisposition: [ ";

        if (node->scevRoot) {

          ScalarEvolution::LoopDisposition disposition = node->scevResult->getLoopDisposition(node->getScevRoot(), loop);
          
          switch (disposition) {
            case ScalarEvolution::LoopInvariant:
              OutS << "Loop invariant";
              break;          
            case ScalarEvolution::LoopVariant:
              OutS << "Loop variant";
              break;
            case ScalarEvolution::LoopComputable:
              OutS << "Loop computable";
              break;
            default: 
              OutS << "Loop disposition unknown";
          }

        }
        OutS << " ]";
        OutS << '\n';

        for (auto iter = node->childrenMap.begin(); iter != childrenMap.end(); iter++) {

            if (std::next(iter) == childrenMap.end()) {
                printTree(OutS, prefix + (isLast ? "    " : "│   "),
                          iter->second, false, true);
            } else {
                printTree(OutS, prefix + (isLast ? "    " : "│   "),
                          iter->second, false, false);
            }
        }
    }
}

void ACFTree::printTree() { printTree(outs(), "", this, true, true); }
