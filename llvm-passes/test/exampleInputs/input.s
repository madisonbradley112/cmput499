	.text
	.file	"input.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	0 "/home/madison.bradley/nserc-2024/llvm-passes" "test/testInputs/input.c" md5 0x557f86a1fcc66df5ca9ba9c75b7b2711
	.loc	0 4 0                           # test/testInputs/input.c:4:0
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -36(%rbp)
	movl	%edi, -32(%rbp)
	movq	%rsi, -48(%rbp)
.Ltmp0:
	.loc	0 5 11 prologue_end             # test/testInputs/input.c:5:11
	movl	$4000, %edi                     # imm = 0xFA0
	callq	malloc@PLT
	leaq	-28(%rbp), %rax
	.loc	0 7 4                           # test/testInputs/input.c:7:4
	movq	%rax, -24(%rbp)
	.loc	0 9 9                           # test/testInputs/input.c:9:9
	movl	$0, -16(%rbp)
	.loc	0 10 6                          # test/testInputs/input.c:10:6
	movl	$0, -12(%rbp)
	.loc	0 11 7                          # test/testInputs/input.c:11:7
	movb	$1, -1(%rbp)
.Ltmp1:
	.loc	0 12 11                         # test/testInputs/input.c:12:11
	movl	$0, -8(%rbp)
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
.Ltmp2:
	.loc	0 16 6                          # test/testInputs/input.c:16:6
	movl	$2, -12(%rbp)
.Ltmp3:
.LBB0_5:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 18 7                          # test/testInputs/input.c:18:7
	movq	-24(%rbp), %rax
	.loc	0 18 9 is_stmt 0                # test/testInputs/input.c:18:9
	movslq	-8(%rbp), %rcx
	.loc	0 18 7                          # test/testInputs/input.c:18:7
	movl	4(%rax,%rcx,4), %edx
	.loc	0 18 5                          # test/testInputs/input.c:18:5
	movl	%edx, -16(%rbp)
	.loc	0 19 7 is_stmt 1                # test/testInputs/input.c:19:7
	movl	8(%rax,%rcx,4), %eax
	.loc	0 19 5 is_stmt 0                # test/testInputs/input.c:19:5
	movl	%eax, -16(%rbp)
	.loc	0 20 9 is_stmt 1                # test/testInputs/input.c:20:9
	leal	3(%rcx), %eax
	.loc	0 20 5 is_stmt 0                # test/testInputs/input.c:20:5
	movl	%eax, -8(%rbp)
.Ltmp4:
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	.loc	0 12 20 is_stmt 1               # test/testInputs/input.c:12:20
	cmpl	$99, -8(%rbp)
.Ltmp5:
	.loc	0 12 2 is_stmt 0                # test/testInputs/input.c:12:2
	jg	.LBB0_6
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
.Ltmp6:
	.loc	0 13 7 is_stmt 1                # test/testInputs/input.c:13:7
	testb	$1, -1(%rbp)
	je	.LBB0_4
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
.Ltmp7:
	.loc	0 14 6                          # test/testInputs/input.c:14:6
	movl	$1, -12(%rbp)
	jmp	.LBB0_5
.Ltmp8:
.LBB0_6:                                # %for.end
	.loc	0 25 6                          # test/testInputs/input.c:25:6
	xorl	%eax, %eax
	.loc	0 25 6 epilogue_begin is_stmt 0 # test/testInputs/input.c:25:6
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp9:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0xa2 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0x6f DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	146                             # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.long	146                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3d:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	80
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.long	150                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x48:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.long	164                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x53:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	100
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.long	146                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x5e:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.long	146                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x69:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	116
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	146                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x74:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	127
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.long	169                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x7f:0x12 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.long	.Ltmp8-.Ltmp1                   # DW_AT_high_pc
	.byte	4                               # Abbrev [4] 0x85:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.byte	14                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.long	146                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x92:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x96:0x5 DW_TAG_pointer_type
	.long	155                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x9b:0x5 DW_TAG_pointer_type
	.long	160                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xa0:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0xa4:0x5 DW_TAG_pointer_type
	.long	146                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xa9:0x4 DW_TAG_base_type
	.byte	13                              # DW_AT_name
	.byte	2                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	64                              # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)" # string offset=0
.Linfo_string1:
	.asciz	"test/testInputs/input.c"       # string offset=105
.Linfo_string2:
	.asciz	"/home/madison.bradley/nserc-2024/llvm-passes" # string offset=129
.Linfo_string3:
	.asciz	"main"                          # string offset=174
.Linfo_string4:
	.asciz	"int"                           # string offset=179
.Linfo_string5:
	.asciz	"argc"                          # string offset=183
.Linfo_string6:
	.asciz	"argv"                          # string offset=188
.Linfo_string7:
	.asciz	"char"                          # string offset=193
.Linfo_string8:
	.asciz	"a"                             # string offset=198
.Linfo_string9:
	.asciz	"ptrVal"                        # string offset=200
.Linfo_string10:
	.asciz	"t"                             # string offset=207
.Linfo_string11:
	.asciz	"j"                             # string offset=209
.Linfo_string12:
	.asciz	"even"                          # string offset=211
.Linfo_string13:
	.asciz	"_Bool"                         # string offset=216
.Linfo_string14:
	.asciz	"i"                             # string offset=222
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Ltmp1
.Ldebug_addr_end0:
	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
