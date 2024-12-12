//==============================================================================
// FILE:
//    InstructionTreeRepresentation.cpp
//
// DESCRIPTION:
//    Defines the InstructionTreeRepresentation class. This tree represents an
//    ACF expression.
//
// License: MIT
//==============================================================================

#include "InstructionTreeRepresentation.h"

InstructionTreeRepresentation::InstructionTreeRepresentation(
    Instruction *root) {
    this->root = root;
    this->leftOperand = nullptr;
    this->rightOperand = nullptr;
    this->numChildren = 0;
}

InstructionTreeRepresentation::~InstructionTreeRepresentation() {
    for (auto child : this->children) {
        delete child;
    }
}

void InstructionTreeRepresentation::buildTree() {
    for (unsigned int i = 0; i < root->getNumOperands(); i++) {
        auto *subtreeInst = dyn_cast<Instruction>(root->getOperand(i));
        if (subtreeInst) {
            auto *subtree = new InstructionTreeRepresentation(subtreeInst);
            subtree->numChildren = 0;
            subtree->buildTree();
            this->children.push_back(subtree);
            this->numChildren++;
        }
        subtreeInst = nullptr;
    }
}

void InstructionTreeRepresentation::assignConditions(
    const BlockToBranchInstructionMap &map) {
    // assign conditions to each of the subtrees in the instruction tree
    // walks the tree, assigning conditions accordingly

    // recursively assign conditions to each child
    for (int i = 0; i < this->numChildren; i++) {
        this->children.at(i)->assignConditions(map);
    }

    // get the conditions for the *current* block
    if (map.count(this->root->getParent())) {
        for (auto branch : map.at(this->root->getParent())) {
            // the conditions must be associated with the instruction
            // if we branched to the basic block containing the instr when the
            // conditions is true, we set the flag in the instruction to
            // indicate this
            auto branchCondition =
                dyn_cast<Instruction>(std::get<0>(branch)->getOperand(0));
            bool isTrue = std::get<2>(branch);
            auto *subtree = new InstructionTreeRepresentation(branchCondition);
            if (isTrue) {
                this->conditions.emplace_back(subtree, true);
            } else {
                this->conditions.emplace_back(subtree, false);
            }
        }
    }
}

void InstructionTreeRepresentation::printTree(
    const std::string &prefix, InstructionTreeRepresentation *node,
    bool isLast) {
    llvm::raw_ostream &OutS = llvm::errs();
    if (node != nullptr) {
        OutS << prefix;

        OutS << (isLast ? "└──" : "├──");

        // print out the possible conditions
        for (auto &condition : node->conditions) {
            std::string conditionString;
            raw_string_ostream conditionStream(conditionString);
            std::string entireString;
            entireString.append("  (");
            if (!condition.second) {
                entireString.append("not ");
            }
            condition.first->root->print(conditionStream);
            entireString.append(conditionString);
            char buf[1024] = {};
            snprintf(buf, 1024, "%-20s  )", entireString.c_str());
            OutS << buf;
        }

        OutS << " ; ";
        node->getRoot()->print(OutS);
        OutS << '\n';

        for (int i = 0; i < node->numChildren; i++) {
            if (i == node->numChildren - 1) {
                printTree(prefix + (isLast ? "    " : "│   "),
                          node->children.at(i), true);
            } else {
                printTree(prefix + (isLast ? "    " : "│   "),
                          node->children.at(i), false);
            }
        }
    }
}

void InstructionTreeRepresentation::printTree() { printTree("", this, true); }