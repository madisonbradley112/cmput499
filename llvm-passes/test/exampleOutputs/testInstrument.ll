; ModuleID = '../test/testInputs/testInstrument.ll'
source_filename = "../test/testInputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@LoadResultFormatStrIR = global [60 x i8] c"load instruction with id: %d\09 accesses memory location: %p\0A\00"
@StoreResultFormatStrIR = global [61 x i8] c"store instruction with id: %d\09 accesses memory location: %p\0A\00"
@fileLocationStrIR = global [21 x i8] c"./memoryaccesses.txt\00"
@fileWriteStrIR = global [2 x i8] c"w\00"
@fileAppendStrIR = global [2 x i8] c"a\00"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !10 {
entry:
  %0 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileWriteStrIR)
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %a = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %1 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %2 = call i32 (ptr, ptr, ...) @fprintf(ptr %1, ptr @StoreResultFormatStrIR, i32 27074048, ptr %retval)
  store i32 %argc, ptr %argc.addr, align 4
  %3 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR), !dbg !18
  %4 = call i32 (ptr, ptr, ...) @fprintf(ptr %3, ptr @StoreResultFormatStrIR, i32 27074192, ptr %argc.addr), !dbg !18
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !19, metadata !DIExpression()), !dbg !18
  store ptr %argv, ptr %argv.addr, align 8
  %5 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR), !dbg !20
  %6 = call i32 (ptr, ptr, ...) @fprintf(ptr %5, ptr @StoreResultFormatStrIR, i32 27078272, ptr %argv.addr), !dbg !20
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !21, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata ptr %a, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 7, ptr %a, align 4, !dbg !24
  %7 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR), !dbg !25
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr %7, ptr @StoreResultFormatStrIR, i32 27082160, ptr %a), !dbg !25
  ret i32 0, !dbg !25
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare ptr @fopen(ptr, ptr, ...)

declare i32 @fprintf(ptr, ptr, ...)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "../test/testInputs/input.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/build", checksumkind: CSK_MD5, checksum: "3827d13eba82de87187634399c7da5d5")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocation(line: 4, column: 14, scope: !10)
!19 = !DILocalVariable(name: "argc", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!20 = !DILocation(line: 4, column: 27, scope: !10)
!21 = !DILocalVariable(name: "argv", arg: 2, scope: !10, file: !1, line: 4, type: !14)
!22 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 5, type: !13)
!23 = !DILocation(line: 5, column: 6, scope: !10)
!24 = !DILocation(line: 6, column: 7, scope: !10)
!25 = !DILocation(line: 32, column: 5, scope: !10)
