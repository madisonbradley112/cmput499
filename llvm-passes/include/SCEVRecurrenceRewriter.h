//==============================================================================
// FILE:
//    SCEVRecurrenceRewriter.h
//
// DESCRIPTION:
//    Rewrites SCEV expressions to not have sign extensions (zext/sext/trunc).
//    This allows for easier manipulation of SCEV values, permitting
//
// License: MIT
//==============================================================================
#ifndef LLVM_DETECT_STRIDED_ACCESSES_SCEV_RECURRENCE_REWRITER_H
#define LLVM_DETECT_STRIDED_ACCESSES_SCEV_RECURRENCE_REWRITER_H

#include <cstdint>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Analysis/ScalarEvolutionExpressions.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <sys/types.h>

using namespace llvm;

class SCEVRecurrenceRewriter
    : public llvm::SCEVRewriteVisitor<SCEVRecurrenceRewriter> {
  public:
    static const SCEV *rewrite(const SCEV *S, ScalarEvolution &SE, LoopInfo *L, int it) {
        SCEVRecurrenceRewriter Rewriter(SE, L, it);
        return Rewriter.visit(S);
    }

    const SCEV *visitZeroExtendExpr(const SCEVZeroExtendExpr *Expr) {
        const SCEVConstant *constant =
            dyn_cast<SCEVConstant>(rewrite(Expr->getOperand(0), SE, this->loop, iteration));
        const SCEVUnknown *variable =
            dyn_cast<SCEVUnknown>(rewrite(Expr->getOperand(0), SE, this->loop, iteration));
        Instruction *originalInst =
            (variable ? dyn_cast<Instruction>(variable->getValue()) : nullptr);
        if (!constant && originalInst && originalInst->getOperand(0)->getType()->isIntOrPtrTy()) {
            const SCEV *operandSCEV = SE.getSCEV(originalInst->getOperand(0));
            constant =
                dyn_cast<SCEVConstant>(rewrite(operandSCEV, SE, this->loop, iteration));
        }

        if (constant) {
            uint64_t resultInt = constant->getValue()->getZExtValue();
            return SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getType(), resultInt)));
        }

        return Expr;
    }

    const SCEV *visitSignExtendExpr(const SCEVSignExtendExpr *Expr) {
        const SCEVConstant *constant =
            dyn_cast<SCEVConstant>(rewrite(Expr->getOperand(0), SE, this->loop, iteration));
        const SCEVUnknown *variable =
            dyn_cast<SCEVUnknown>(rewrite(Expr->getOperand(0), SE, this->loop, iteration));
        Instruction *originalInst =
            (variable ? dyn_cast<Instruction>(variable->getValue()) : nullptr);
        if (!constant && originalInst && originalInst->getOperand(0)->getType()->isIntOrPtrTy()) {
            const SCEV *operandSCEV = SE.getSCEV(originalInst->getOperand(0));
            constant =
                dyn_cast<SCEVConstant>(rewrite(operandSCEV, SE, this->loop, iteration));
        }

        if (constant) {
            uint64_t resultInt = constant->getValue()->getSExtValue();
            return SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getType(), resultInt)));
        }

        return Expr;    
    }

    const SCEV *visitTruncateExpr(const SCEVTruncateExpr *Expr) {
        const SCEVConstant *constant =
            dyn_cast<SCEVConstant>(rewrite(Expr->getOperand(0), SE, this->loop, iteration));
        const SCEVUnknown *variable =
            dyn_cast<SCEVUnknown>(rewrite(Expr->getOperand(0), SE, this->loop, iteration));
        Instruction *originalInst =
            (variable ? dyn_cast<Instruction>(variable->getValue()) : nullptr);
        if (!constant && originalInst && originalInst->getOperand(0)->getType()->isIntOrPtrTy()) {
            const SCEV *operandSCEV = SE.getSCEV(originalInst->getOperand(0));
            constant =
                dyn_cast<SCEVConstant>(rewrite(operandSCEV, SE, this->loop, iteration));
        }

        if (constant) {
            uint64_t resultInt = constant->getValue()->getSExtValue();
            return SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getType(), resultInt)));
        }

        return Expr;
    }

    const SCEV *visitAddExpr(const SCEVAddExpr *Expr) {
        // in the case of an add expression, we can potentially replace a
        // SCEV with it's constant value

        const SCEV *lhs = rewrite(Expr->getOperand(0), SE, this->loop, iteration);
        const SCEV *rhs = rewrite(Expr->getOperand(1), SE, this->loop, iteration);
        
        const SCEVConstant *lhsConst = dyn_cast<SCEVConstant>(lhs);
        const SCEVConstant *rhsConst = dyn_cast<SCEVConstant>(rhs);
        
        // if this is true, then we can calculate @ compile time
        if (lhsConst && rhsConst) {
            int64_t lhsRes = lhsConst->getValue()->getSExtValue();
            int64_t rhsRes = rhsConst->getValue()->getSExtValue();
            
            int64_t resultInt = lhsRes + rhsRes;
        
            if (Expr->getType()->isIntegerTy()) {
                return SE.getConstant(dyn_cast<ConstantInt>(
                    ConstantInt::get(Expr->getType(), resultInt)));
            }
        }
        
        return SE.getAddExpr(lhs, rhs);
    }

    const SCEV *visitMulExpr(const SCEVMulExpr *Expr) {
        // in the case of an add expression, we can potentially replace a
        // SCEV with it's constant value

        const SCEV *lhs = rewrite(Expr->getOperand(0), SE, this->loop, iteration);
        const SCEV *rhs = rewrite(Expr->getOperand(1), SE, this->loop, iteration);
        
        const SCEVConstant *lhsConst = dyn_cast<SCEVConstant>(lhs);
        const SCEVConstant *rhsConst = dyn_cast<SCEVConstant>(rhs);
        
        // if this is true, then we can calculate @ compile time
        if (lhsConst && rhsConst) {
            int64_t lhsRes = lhsConst->getValue()->getSExtValue();
            int64_t rhsRes = rhsConst->getValue()->getSExtValue();
            
            int64_t resultInt = lhsRes * rhsRes;

            return SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getType(), resultInt)));

        }
        return SE.getMulExpr(lhs, rhs);
    }

    const SCEV *visitUDivExpr(const SCEVUDivExpr *Expr) {
        // in the case of an add expression, we can potentially replace a
        // SCEV with it's constant value
        const SCEV *lhs = rewrite(Expr->getOperand(0), SE, this->loop, iteration);
        const SCEV *rhs = rewrite(Expr->getOperand(1), SE, this->loop, iteration);
        
        const SCEVConstant *lhsConst = dyn_cast<SCEVConstant>(lhs);
        const SCEVConstant *rhsConst = dyn_cast<SCEVConstant>(rhs);
        
        // if this is true, then we can calculate @ compile time
        if (lhsConst && rhsConst) {
            int64_t lhsRes = lhsConst->getValue()->getSExtValue();
            int64_t rhsRes = rhsConst->getValue()->getSExtValue();
            
            int64_t resultInt = lhsRes / rhsRes;

            return SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getType(), resultInt)));

        }
        return SE.getUDivExpr(lhs, rhs);
    }

    const SCEV *visitAddRecExpr(const SCEVAddRecExpr *Expr) {
        // first see if the operands can be simplified
        const SCEV *lhs = rewrite(Expr->getOperand(0), SE, this->loop, iteration);
        const SCEV *rhs = rewrite(Expr->getOperand(1), SE, this->loop, iteration);

        const SCEVAddRecExpr *simplifiedExpr = dyn_cast<const SCEVAddRecExpr>(SE.getAddRecExpr(lhs, rhs, Expr->getLoop(), Expr->getNoWrapFlags())); 

        if (Expr->getType()->isIntegerTy()) {
            const SCEV *it = SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getType(), iteration)));

            const SCEVConstant *constantRes = dyn_cast<SCEVConstant>(Expr->evaluateAtIteration(it, SE));
            
            if (constantRes) {
                return constantRes;
            }
            
            return simplifiedExpr->evaluateAtIteration(it, SE);
        } else if (Expr->getType()->isPointerTy()) {
            LLVMContext ctx;
            const SCEV *it = SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(Expr->getOperand(1)->getType(), iteration)));

            const SCEVAddRecExpr *ptrToInt = dyn_cast<SCEVAddRecExpr>(SE.getPtrToIntExpr(Expr, Expr->getOperand(1)->getType()));
            return ptrToInt->evaluateAtIteration(it, SE);
        }

        return simplifiedExpr;
    }

    const SCEV *visitUnknown(const SCEVUnknown *Expr) {
        // we wish to simplify conditionals as well, in the case that
        // they are comprised of SCEV values already determined.
        // to do this, we check if both sides of the conditional
        // are SCEV values - if so, we just do the comparison
        Instruction *originalInst =
            (Expr->getValue() ? dyn_cast<Instruction>(Expr->getValue())
                             : nullptr);

        if (!originalInst) {
          return Expr;
        }

        if (originalInst->getOpcode() == llvm::Instruction::Select) {
            SelectInst *select = dyn_cast<SelectInst>(originalInst);
            const SCEVConstant *comparison = dyn_cast<SCEVConstant>(
                rewrite(SE.getSCEV(select->getOperand(0)), SE, this->loop, iteration));

            if (comparison) {
                uint64_t comparisonConst =
                    comparison->getValue()->getZExtValue();
                int selectedOperand = (comparisonConst ? 1 : 2);
                return rewrite(SE.getSCEV(select->getOperand(selectedOperand)),
                               SE, this->loop, iteration);
            }

            return Expr;

        } else if (originalInst->getOpcode() == llvm::Instruction::ICmp) {
            // if it's an icmp instruction, check if the comparison
            // can be done with the existing values
            ICmpInst *comparison = dyn_cast<ICmpInst>(originalInst);

            if (!comparison->getOperand(0)->getType()->isIntOrPtrTy() || comparison->getOperand(0)->getType()->isIntOrPtrTy()) {
                return Expr;
            }


            const SCEVConstant *lhs = dyn_cast<SCEVConstant>(
                visit(SE.getSCEV(comparison->getOperand(0))));
            const SCEVConstant *rhs = dyn_cast<SCEVConstant>(
                visit(SE.getSCEV(comparison->getOperand(1))));

            if (!lhs || !rhs) {
                return Expr;
            }

            uint64_t lhsConst = lhs->getValue()->getSExtValue();
            uint64_t rhsConst = rhs->getValue()->getSExtValue();
            bool cond;
            switch (comparison->getPredicate()) {
            case llvm::CmpInst::ICMP_EQ: {
                cond = lhsConst == rhsConst;
                break;
            }
            case llvm::CmpInst::ICMP_NE: {
                cond = lhsConst != rhsConst;
                break;
            }
            case llvm::CmpInst::ICMP_SGT:
            case llvm::CmpInst::ICMP_UGT: {
                cond = lhsConst > rhsConst;
                break;
            }
            case llvm::CmpInst::ICMP_UGE:
            case llvm::CmpInst::ICMP_SGE: {
                cond = lhsConst >= rhsConst;
                break;
            }
            case llvm::CmpInst::ICMP_ULT:
            case llvm::CmpInst::ICMP_SLT: {
                cond = lhsConst < rhsConst;
                break;
            }
            case llvm::CmpInst::ICMP_ULE:
            case llvm::CmpInst::ICMP_SLE: {
                cond = lhsConst <= rhsConst;
                break;
            }
            default: {
                return Expr;
            }
            }

            return SE.getConstant(dyn_cast<ConstantInt>(
                ConstantInt::get(comparison->getType(), cond)));
        } else if (originalInst->getOpcode() == llvm::Instruction::Call) {
          
        }
        return Expr;
    }

  private:
    explicit SCEVRecurrenceRewriter(ScalarEvolution &SE, LoopInfo *L, int iteration)
        : SCEVRewriteVisitor(SE) {
        this->iteration = iteration;
        this->loop = L;
    }
    int iteration;
    LoopInfo *loop;
};

#endif
