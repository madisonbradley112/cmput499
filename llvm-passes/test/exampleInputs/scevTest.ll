; ModuleID = 'test/testInputs/input.c'
source_filename = "test/testInputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %a = alloca ptr, align 8
  %ptrVal = alloca i32, align 4
  %t = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata ptr %a, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata ptr %ptrVal, metadata !25, metadata !DIExpression()), !dbg !26
  store ptr %ptrVal, ptr %a, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata ptr %t, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, ptr %t, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata ptr %k, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 7, ptr %k, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata ptr %i, metadata !32, metadata !DIExpression()), !dbg !34
  store i32 0, ptr %i, align 4, !dbg !34
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 10, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %t, align 4, !dbg !40
  %2 = load i32, ptr %k, align 4, !dbg !41
  %add = add nsw i32 %1, %2, !dbg !42
  store i32 %add, ptr %t, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4, !dbg !45
  %inc = add nsw i32 %3, 1, !dbg !45
  store i32 %inc, ptr %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %4 = load i32, ptr %t, align 4, !dbg !50
  %5 = load ptr, ptr %a, align 8, !dbg !51
  store i32 %4, ptr %5, align 4, !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/testInputs/input.c", directory: "/home/madison.bradley/nserc-2024/llvm-passes", checksumkind: CSK_MD5, checksum: "65e399571c11226894a527e051a4780f")
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
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!19 = !DILocation(line: 4, column: 14, scope: !10)
!20 = !DILocalVariable(name: "argv", arg: 2, scope: !10, file: !1, line: 4, type: !14)
!21 = !DILocation(line: 4, column: 27, scope: !10)
!22 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 5, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!24 = !DILocation(line: 5, column: 7, scope: !10)
!25 = !DILocalVariable(name: "ptrVal", scope: !10, file: !1, line: 6, type: !13)
!26 = !DILocation(line: 6, column: 6, scope: !10)
!27 = !DILocation(line: 7, column: 4, scope: !10)
!28 = !DILocalVariable(name: "t", scope: !10, file: !1, line: 9, type: !13)
!29 = !DILocation(line: 9, column: 9, scope: !10)
!30 = !DILocalVariable(name: "k", scope: !10, file: !1, line: 10, type: !13)
!31 = !DILocation(line: 10, column: 6, scope: !10)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 11, type: !13)
!33 = distinct !DILexicalBlock(scope: !10, file: !1, line: 11, column: 2)
!34 = !DILocation(line: 11, column: 11, scope: !33)
!35 = !DILocation(line: 11, column: 7, scope: !33)
!36 = !DILocation(line: 11, column: 18, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 11, column: 2)
!38 = !DILocation(line: 11, column: 20, scope: !37)
!39 = !DILocation(line: 11, column: 2, scope: !33)
!40 = !DILocation(line: 12, column: 7, scope: !37)
!41 = !DILocation(line: 12, column: 11, scope: !37)
!42 = !DILocation(line: 12, column: 9, scope: !37)
!43 = !DILocation(line: 12, column: 5, scope: !37)
!44 = !DILocation(line: 12, column: 3, scope: !37)
!45 = !DILocation(line: 11, column: 27, scope: !37)
!46 = !DILocation(line: 11, column: 2, scope: !37)
!47 = distinct !{!47, !39, !48, !49}
!48 = !DILocation(line: 12, column: 11, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 13, column: 7, scope: !10)
!51 = !DILocation(line: 13, column: 3, scope: !10)
!52 = !DILocation(line: 13, column: 5, scope: !10)
!53 = !DILocation(line: 14, column: 6, scope: !10)
