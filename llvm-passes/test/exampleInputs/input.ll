; ModuleID = '../exampleInputs/input.c'
source_filename = "../exampleInputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Hello! This is a string.\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1, !dbg !7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !24 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %a = alloca ptr, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %ind = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  call void @llvm.dbg.declare(metadata ptr %argc.addr, metadata !31, metadata !DIExpression()), !dbg !32
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %argv.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata ptr %a, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call noalias ptr @malloc(i64 noundef 1000) #4, !dbg !37
  store ptr %call, ptr %a, align 8, !dbg !36
  store ptr @.str, ptr %a, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata ptr %j, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 0, ptr %j, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata ptr %k, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 0, ptr %k, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata ptr %ind, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 0, ptr %ind, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata ptr %i, metadata !45, metadata !DIExpression()), !dbg !47
  store i32 0, ptr %i, align 4, !dbg !47
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !49
  %cmp = icmp slt i32 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4, !dbg !53
  %rem = srem i32 %1, 2, !dbg !56
  %cmp1 = icmp eq i32 %rem, 0, !dbg !57
  br i1 %cmp1, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %for.body
  %2 = load ptr, ptr %a, align 8, !dbg !59
  %3 = load i32, ptr %i, align 4, !dbg !61
  %add = add nsw i32 %3, 3, !dbg !62
  %idxprom = sext i32 %add to i64, !dbg !59
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom, !dbg !59
  %4 = load i8, ptr %arrayidx, align 1, !dbg !59
  %conv = sext i8 %4 to i32, !dbg !59
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %conv), !dbg !63
  br label %if.end, !dbg !64

if.else:                                          ; preds = %for.body
  %5 = load ptr, ptr %a, align 8, !dbg !65
  %6 = load i32, ptr %i, align 4, !dbg !67
  %idxprom3 = sext i32 %6 to i64, !dbg !65
  %arrayidx4 = getelementptr inbounds i8, ptr %5, i64 %idxprom3, !dbg !65
  %7 = load i8, ptr %arrayidx4, align 1, !dbg !65
  %conv5 = sext i8 %7 to i32, !dbg !65
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %conv5), !dbg !68
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %if.end
  %8 = load i32, ptr %i, align 4, !dbg !70
  %inc = add nsw i32 %8, 1, !dbg !70
  store i32 %inc, ptr %i, align 4, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !75
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
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../exampleInputs/input.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/test/unitTests", checksumkind: CSK_MD5, checksum: "001526db26e69737dc8fa9036f8b33dc")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 25)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !13, globals: !15, splitDebugInlining: false, nameTableKind: None)
!13 = !{!14}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{!0, !7}
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 8, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 2}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!24 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 4, type: !25, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !30)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !27, !28}
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!30 = !{}
!31 = !DILocalVariable(name: "argc", arg: 1, scope: !24, file: !2, line: 4, type: !27)
!32 = !DILocation(line: 4, column: 14, scope: !24)
!33 = !DILocalVariable(name: "argv", arg: 2, scope: !24, file: !2, line: 4, type: !28)
!34 = !DILocation(line: 4, column: 27, scope: !24)
!35 = !DILocalVariable(name: "a", scope: !24, file: !2, line: 5, type: !29)
!36 = !DILocation(line: 5, column: 11, scope: !24)
!37 = !DILocation(line: 5, column: 24, scope: !24)
!38 = !DILocation(line: 6, column: 7, scope: !24)
!39 = !DILocalVariable(name: "j", scope: !24, file: !2, line: 8, type: !27)
!40 = !DILocation(line: 8, column: 6, scope: !24)
!41 = !DILocalVariable(name: "k", scope: !24, file: !2, line: 9, type: !27)
!42 = !DILocation(line: 9, column: 6, scope: !24)
!43 = !DILocalVariable(name: "ind", scope: !24, file: !2, line: 10, type: !27)
!44 = !DILocation(line: 10, column: 13, scope: !24)
!45 = !DILocalVariable(name: "i", scope: !46, file: !2, line: 11, type: !27)
!46 = distinct !DILexicalBlock(scope: !24, file: !2, line: 11, column: 5)
!47 = !DILocation(line: 11, column: 14, scope: !46)
!48 = !DILocation(line: 11, column: 10, scope: !46)
!49 = !DILocation(line: 11, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !2, line: 11, column: 5)
!51 = !DILocation(line: 11, column: 23, scope: !50)
!52 = !DILocation(line: 11, column: 5, scope: !46)
!53 = !DILocation(line: 13, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !2, line: 13, column: 13)
!55 = distinct !DILexicalBlock(scope: !50, file: !2, line: 11, column: 34)
!56 = !DILocation(line: 13, column: 15, scope: !54)
!57 = !DILocation(line: 13, column: 19, scope: !54)
!58 = !DILocation(line: 13, column: 13, scope: !55)
!59 = !DILocation(line: 14, column: 26, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !2, line: 13, column: 25)
!61 = !DILocation(line: 14, column: 28, scope: !60)
!62 = !DILocation(line: 14, column: 30, scope: !60)
!63 = !DILocation(line: 14, column: 13, scope: !60)
!64 = !DILocation(line: 15, column: 9, scope: !60)
!65 = !DILocation(line: 16, column: 26, scope: !66)
!66 = distinct !DILexicalBlock(scope: !54, file: !2, line: 15, column: 16)
!67 = !DILocation(line: 16, column: 28, scope: !66)
!68 = !DILocation(line: 16, column: 13, scope: !66)
!69 = !DILocation(line: 18, column: 5, scope: !55)
!70 = !DILocation(line: 11, column: 31, scope: !50)
!71 = !DILocation(line: 11, column: 5, scope: !50)
!72 = distinct !{!72, !52, !73, !74}
!73 = !DILocation(line: 18, column: 5, scope: !46)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 20, column: 5, scope: !24)
