; ModuleID = '../test/testInputs/input.ll'
source_filename = "../test/testInputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Hello! This is a string.\00", align 1, !dbg !0

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr nocapture noundef readnone %argv) local_unnamed_addr #0 !dbg !22 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata ptr %argv, metadata !31, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata ptr poison, metadata !32, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata ptr @.str, metadata !32, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i32 0, metadata !33, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i32 0, metadata !35, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i32 0, metadata !36, metadata !DIExpression()), !dbg !38
  br label %for.body, !dbg !39

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !36, metadata !DIExpression()), !dbg !38
  %rem10 = and i64 %indvars.iv, 1, !dbg !40
  %cmp1 = icmp eq i64 %rem10, 0, !dbg !40
  %0 = add nuw nsw i64 %indvars.iv, 3, !dbg !44
  %.sink = select i1 %cmp1, i64 %0, i64 %indvars.iv, !dbg !44
  %arrayidx = getelementptr inbounds i8, ptr @.str, i64 %.sink, !dbg !45
  %1 = load i8, ptr %arrayidx, align 1, !dbg !45
  %conv = sext i8 %1 to i32, !dbg !45
  %putchar6 = tail call i32 @putchar(i32 %conv), !dbg !45
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !46
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !36, metadata !DIExpression()), !dbg !38
  %exitcond.not = icmp eq i64 %indvars.iv.next, 100, !dbg !47
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !39, !llvm.loop !48

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !51
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #2

attributes #0 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../test/testInputs/input.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/build", checksumkind: CSK_MD5, checksum: "8509279ba2c4fec004b7302fc06e26f6")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 25)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !8, splitDebugInlining: false, nameTableKind: None)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 26, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 3)
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!22 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 4, type: !23, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !28)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !25, !26}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!28 = !{}
!29 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !2, line: 4, type: !25)
!30 = !DILocation(line: 0, scope: !22)
!31 = !DILocalVariable(name: "argv", arg: 2, scope: !22, file: !2, line: 4, type: !26)
!32 = !DILocalVariable(name: "a", scope: !22, file: !2, line: 5, type: !27)
!33 = !DILocalVariable(name: "j", scope: !22, file: !2, line: 8, type: !25)
!34 = !DILocalVariable(name: "k", scope: !22, file: !2, line: 9, type: !25)
!35 = !DILocalVariable(name: "ind", scope: !22, file: !2, line: 10, type: !25)
!36 = !DILocalVariable(name: "i", scope: !37, file: !2, line: 11, type: !25)
!37 = distinct !DILexicalBlock(scope: !22, file: !2, line: 11, column: 5)
!38 = !DILocation(line: 0, scope: !37)
!39 = !DILocation(line: 11, column: 5, scope: !37)
!40 = !DILocation(line: 25, column: 19, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !2, line: 25, column: 13)
!42 = distinct !DILexicalBlock(scope: !43, file: !2, line: 11, column: 34)
!43 = distinct !DILexicalBlock(scope: !37, file: !2, line: 11, column: 5)
!44 = !DILocation(line: 25, column: 13, scope: !42)
!45 = !DILocation(line: 0, scope: !41)
!46 = !DILocation(line: 11, column: 31, scope: !43)
!47 = !DILocation(line: 11, column: 23, scope: !43)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 30, column: 5, scope: !37)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 32, column: 5, scope: !22)
