	.text
	.file	"input.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movl	%edi, %ebx
	movq	fileLocationStrIR@GOTPCREL(%rip), %r12
	movq	fileWriteStrIR@GOTPCREL(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	callq	fopen@PLT
	movl	$0, -72(%rbp)
	movq	fileAppendStrIR@GOTPCREL(%rip), %r14
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	StoreResultFormatStrIR@GOTPCREL(%rip), %r13
	leaq	-72(%rbp), %rcx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20856624, %edx                 # imm = 0x13E3F30
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	%ebx, -68(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	leaq	-68(%rbp), %rcx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20856768, %edx                 # imm = 0x13E3FC0
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	%r15, -80(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	leaq	-80(%rbp), %rcx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20856912, %edx                 # imm = 0x13E4050
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$1000, %edi                     # imm = 0x3E8
	callq	malloc@PLT
	movq	%rax, -56(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	leaq	-56(%rbp), %rbx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20859008, %edx                 # imm = 0x13E4880
	movq	%rbx, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	$.L.str, -56(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20859152, %edx                 # imm = 0x13E4910
	movq	%rbx, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$0, -64(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	leaq	-64(%rbp), %rcx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20859296, %edx                 # imm = 0x13E49A0
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$0, -60(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	leaq	-60(%rbp), %rcx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20859440, %edx                 # imm = 0x13E4A30
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$0, -44(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	leaq	-44(%rbp), %rbx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20859584, %edx                 # imm = 0x13E4AC0
	movq	%rbx, %rcx
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                # %cond.false
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-44(%rbp), %r15d
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %rsi
	movl	$20862960, %edx                 # imm = 0x13E57F0
	movq	%rbx, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
.LBB0_5:                                # %cond.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	%r15d, -48(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	%r13, %rsi
	movl	$20863328, %edx                 # imm = 0x13E5960
	leaq	-48(%rbp), %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	%r12, %r13
	movq	-56(%rbp), %r12
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %r15
	movq	%r15, %rsi
	movl	$20863440, %edx                 # imm = 0x13E59D0
	leaq	-56(%rbp), %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movslq	-48(%rbp), %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	%r15, %rsi
	movl	$20863632, %edx                 # imm = 0x13E5A90
	leaq	-48(%rbp), %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	leaq	(%r12,%rbx), %r15
	movsbl	(%r12,%rbx), %ebx
	movq	%r13, %r12
	movq	%r13, %rdi
	movq	%r14, %r13
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %rsi
	movl	$20864848, %edx                 # imm = 0x13E5F50
	movq	%r15, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$.L.str.1, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	-44(%rbp), %ebx
	movq	%r12, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %rsi
	movl	$20865856, %edx                 # imm = 0x13E6340
	leaq	-44(%rbp), %r15
	movq	%r15, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	incl	%ebx
	movl	%ebx, -44(%rbp)
	movq	%r15, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	StoreResultFormatStrIR@GOTPCREL(%rip), %r13
	movq	%r13, %rsi
	movl	$20866176, %edx                 # imm = 0x13E6480
	movq	%r15, %rcx
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	-44(%rbp), %r15d
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %rsi
	movl	$20860448, %edx                 # imm = 0x13E4E20
	movq	%rbx, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	cmpl	$99, %r15d
	jg	.LBB0_6
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-44(%rbp), %r15d
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %rsi
	movl	$20861328, %edx                 # imm = 0x13E5190
	movq	%rbx, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	%r15d, %eax
	shrl	$31, %eax
	addl	%r15d, %eax
	andl	$-2, %eax
	cmpl	%eax, %r15d
	jne	.LBB0_4
# %bb.3:                                # %cond.true
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-44(%rbp), %r15d
	movq	%r12, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	fopen@PLT
	movq	%rax, %rdi
	movq	LoadResultFormatStrIR@GOTPCREL(%rip), %rsi
	movl	$20862368, %edx                 # imm = 0x13E55A0
	movq	%rbx, %rcx
	xorl	%eax, %eax
	callq	fprintf@PLT
	leal	(%r15,%r15,2), %r15d
	jmp	.LBB0_5
.LBB0_6:                                # %for.end
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Hello! This is a string."
	.size	.L.str, 25

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%c"
	.size	.L.str.1, 3

	.type	LoadResultFormatStrIR,@object   # @LoadResultFormatStrIR
	.data
	.globl	LoadResultFormatStrIR
	.p2align	4, 0x0
LoadResultFormatStrIR:
	.asciz	"load instruction with id: %d\t accesses memory location: %p\n"
	.size	LoadResultFormatStrIR, 60

	.type	StoreResultFormatStrIR,@object  # @StoreResultFormatStrIR
	.globl	StoreResultFormatStrIR
	.p2align	4, 0x0
StoreResultFormatStrIR:
	.asciz	"store instruction with id: %d\t accesses memory location: %p\n"
	.size	StoreResultFormatStrIR, 61

	.type	fileLocationStrIR,@object       # @fileLocationStrIR
	.globl	fileLocationStrIR
	.p2align	4, 0x0
fileLocationStrIR:
	.asciz	"./memoryaccesses.txt"
	.size	fileLocationStrIR, 21

	.type	fileWriteStrIR,@object          # @fileWriteStrIR
	.globl	fileWriteStrIR
fileWriteStrIR:
	.asciz	"w"
	.size	fileWriteStrIR, 2

	.type	fileAppendStrIR,@object         # @fileAppendStrIR
	.globl	fileAppendStrIR
fileAppendStrIR:
	.asciz	"a"
	.size	fileAppendStrIR, 2

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"
	.section	".note.GNU-stack","",@progbits
