; ModuleID = 'accessInIfStatementStride3.c'
source_filename = "accessInIfStatementStride3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Hello! This is a string.\00", align 1, !dbg !0

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr nocapture noundef readnone %argv) local_unnamed_addr #0 !dbg !24 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata ptr %argv, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata ptr @.str, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata i32 0, metadata !33, metadata !DIExpression()), !dbg !36
  br label %for.body, !dbg !37

for.cond.cleanup:                                 ; preds = %for.inc
  ret i32 0, !dbg !38

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.pre-phi, %for.inc ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !33, metadata !DIExpression()), !dbg !36
  %rem16 = and i64 %indvars.iv, 1, !dbg !39
  %cmp1 = icmp eq i64 %rem16, 0, !dbg !39
  br i1 %cmp1, label %if.then, label %if.else, !dbg !43

if.then:                                          ; preds = %for.body
  %0 = add nuw nsw i64 %indvars.iv, 1, !dbg !44
  %arrayidx = getelementptr inbounds i8, ptr @.str, i64 %0, !dbg !46
  %1 = load i8, ptr %arrayidx, align 1, !dbg !46, !tbaa !47
  %conv = sext i8 %1 to i32, !dbg !46
  %putchar12 = tail call i32 @putchar(i32 %conv), !dbg !50
  br label %for.inc, !dbg !51

if.else:                                          ; preds = %for.body
  %arrayidx4 = getelementptr inbounds i8, ptr @.str, i64 %indvars.iv, !dbg !52
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !52, !tbaa !47
  %conv5 = sext i8 %2 to i32, !dbg !52
  %putchar = tail call i32 @putchar(i32 %conv5), !dbg !54
  %.pre = add nuw nsw i64 %indvars.iv, 1, !dbg !55
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %indvars.iv.next.pre-phi = phi i64 [ %0, %if.then ], [ %.pre, %if.else ], !dbg !55
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.pre-phi, metadata !33, metadata !DIExpression()), !dbg !36
  %exitcond.not = icmp eq i64 %indvars.iv.next.pre-phi, 100, !dbg !56
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !37, !llvm.loop !57
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #2

attributes #0 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree nounwind }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "accessInIfStatementStride3.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/test/unitTests", checksumkind: CSK_MD5, checksum: "65f325c8b00d8257f569c880fc549159")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 25)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !8, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !{!9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(scope: null, file: !2, line: 17, type: !13, isLocal: true, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 3)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 8, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 2}
!22 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!23 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!24 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 11, type: !25, scopeLine: 11, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !29)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !27, !28}
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!29 = !{!30, !31, !32, !33}
!30 = !DILocalVariable(name: "argc", arg: 1, scope: !24, file: !2, line: 11, type: !27)
!31 = !DILocalVariable(name: "argv", arg: 2, scope: !24, file: !2, line: 11, type: !28)
!32 = !DILocalVariable(name: "a", scope: !24, file: !2, line: 12, type: !9)
!33 = !DILocalVariable(name: "i", scope: !34, file: !2, line: 15, type: !27)
!34 = distinct !DILexicalBlock(scope: !24, file: !2, line: 15, column: 5)
!35 = !DILocation(line: 0, scope: !24)
!36 = !DILocation(line: 0, scope: !34)
!37 = !DILocation(line: 15, column: 5, scope: !34)
!38 = !DILocation(line: 23, column: 5, scope: !24)
!39 = !DILocation(line: 16, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !2, line: 16, column: 13)
!41 = distinct !DILexicalBlock(scope: !42, file: !2, line: 15, column: 34)
!42 = distinct !DILexicalBlock(scope: !34, file: !2, line: 15, column: 5)
!43 = !DILocation(line: 16, column: 13, scope: !41)
!44 = !DILocation(line: 17, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !2, line: 16, column: 25)
!46 = !DILocation(line: 17, column: 26, scope: !45)
!47 = !{!48, !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !DILocation(line: 17, column: 13, scope: !45)
!51 = !DILocation(line: 18, column: 9, scope: !45)
!52 = !DILocation(line: 19, column: 26, scope: !53)
!53 = distinct !DILexicalBlock(scope: !40, file: !2, line: 18, column: 16)
!54 = !DILocation(line: 19, column: 13, scope: !53)
!55 = !DILocation(line: 15, column: 31, scope: !42)
!56 = !DILocation(line: 15, column: 23, scope: !42)
!57 = distinct !{!57, !37, !58, !59}
!58 = !DILocation(line: 21, column: 5, scope: !34)
!59 = !{!"llvm.loop.mustprogress"}
