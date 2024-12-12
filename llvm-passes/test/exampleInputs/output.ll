; ModuleID = '../test/testInputs/input.c'
source_filename = "../test/testInputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Hello! This is a string.\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1, !dbg !7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !22 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %a = alloca ptr, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %ind = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !29, metadata !DIExpression()), !dbg !30
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata ptr %a, metadata !33, metadata !DIExpression()), !dbg !34
  %call = call noalias ptr @malloc(i64 noundef 1000) #4, !dbg !35
  store ptr %call, ptr %a, align 8, !dbg !34
  store ptr @.str, ptr %a, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata ptr %j, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, ptr %j, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata ptr %k, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 0, ptr %k, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata ptr %i, metadata !41, metadata !DIExpression()), !dbg !43
  store i32 0, ptr %i, align 4, !dbg !43
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !45
  %cmp = icmp slt i32 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata ptr %ind, metadata !49, metadata !DIExpression()), !dbg !51
  %1 = load i32, ptr %i, align 4, !dbg !52
  %rem = srem i32 %1, 2, !dbg !53
  %cmp1 = icmp eq i32 %rem, 0, !dbg !54
  br i1 %cmp1, label %cond.true, label %cond.false, !dbg !52

cond.true:                                        ; preds = %for.body
  %2 = load i32, ptr %i, align 4, !dbg !55
  %add = add nsw i32 %2, 3, !dbg !56
  br label %cond.end, !dbg !52

cond.false:                                       ; preds = %for.body
  %3 = load i32, ptr %i, align 4, !dbg !57
  br label %cond.end, !dbg !52

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %3, %cond.false ], !dbg !52
  store i32 %cond, ptr %ind, align 4, !dbg !58
  %4 = load ptr, ptr %a, align 8, !dbg !59
  %5 = load i32, ptr %ind, align 4, !dbg !60
  %idxprom = sext i32 %5 to i64, !dbg !59
  %arrayidx = getelementptr inbounds i8, ptr %4, i64 %idxprom, !dbg !59
  %6 = load i8, ptr %arrayidx, align 1, !dbg !59
  %conv = sext i8 %6 to i32, !dbg !59
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %conv), !dbg !61
  %7 = load i32, ptr %ind, align 4, !dbg !62
  store i32 %7, ptr %i, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %cond.end
  %8 = load i32, ptr %i, align 4, !dbg !65
  %inc = add nsw i32 %8, 1, !dbg !65
  store i32 %inc, ptr %i, align 4, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !70
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../test/testInputs/input.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/build", checksumkind: CSK_MD5, checksum: "d5f33267087c450f33405a01995b6768")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 25)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !13, splitDebugInlining: false, nameTableKind: None)
!13 = !{!0, !7}
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!22 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 4, type: !23, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !28)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !25, !26}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!28 = !{}
!29 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !2, line: 4, type: !25)
!30 = !DILocation(line: 4, column: 14, scope: !22)
!31 = !DILocalVariable(name: "argv", arg: 2, scope: !22, file: !2, line: 4, type: !26)
!32 = !DILocation(line: 4, column: 27, scope: !22)
!33 = !DILocalVariable(name: "a", scope: !22, file: !2, line: 5, type: !27)
!34 = !DILocation(line: 5, column: 11, scope: !22)
!35 = !DILocation(line: 5, column: 15, scope: !22)
!36 = !DILocation(line: 6, column: 7, scope: !22)
!37 = !DILocalVariable(name: "j", scope: !22, file: !2, line: 8, type: !25)
!38 = !DILocation(line: 8, column: 6, scope: !22)
!39 = !DILocalVariable(name: "k", scope: !22, file: !2, line: 9, type: !25)
!40 = !DILocation(line: 9, column: 6, scope: !22)
!41 = !DILocalVariable(name: "i", scope: !42, file: !2, line: 10, type: !25)
!42 = distinct !DILexicalBlock(scope: !22, file: !2, line: 10, column: 5)
!43 = !DILocation(line: 10, column: 14, scope: !42)
!44 = !DILocation(line: 10, column: 10, scope: !42)
!45 = !DILocation(line: 10, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !2, line: 10, column: 5)
!47 = !DILocation(line: 10, column: 23, scope: !46)
!48 = !DILocation(line: 10, column: 5, scope: !42)
!49 = !DILocalVariable(name: "ind", scope: !50, file: !2, line: 11, type: !25)
!50 = distinct !DILexicalBlock(scope: !46, file: !2, line: 10, column: 34)
!51 = !DILocation(line: 11, column: 13, scope: !50)
!52 = !DILocation(line: 19, column: 16, scope: !50)
!53 = !DILocation(line: 19, column: 18, scope: !50)
!54 = !DILocation(line: 19, column: 22, scope: !50)
!55 = !DILocation(line: 19, column: 28, scope: !50)
!56 = !DILocation(line: 19, column: 30, scope: !50)
!57 = !DILocation(line: 19, column: 35, scope: !50)
!58 = !DILocation(line: 19, column: 13, scope: !50)
!59 = !DILocation(line: 20, column: 22, scope: !50)
!60 = !DILocation(line: 20, column: 24, scope: !50)
!61 = !DILocation(line: 20, column: 9, scope: !50)
!62 = !DILocation(line: 21, column: 13, scope: !50)
!63 = !DILocation(line: 21, column: 11, scope: !50)
!64 = !DILocation(line: 27, column: 5, scope: !50)
!65 = !DILocation(line: 10, column: 31, scope: !46)
!66 = !DILocation(line: 10, column: 5, scope: !46)
!67 = distinct !{!67, !48, !68, !69}
!68 = !DILocation(line: 27, column: 5, scope: !42)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 29, column: 5, scope: !22)
