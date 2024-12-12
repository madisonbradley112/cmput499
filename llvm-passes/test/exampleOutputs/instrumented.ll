; ModuleID = 'test/testInputs/input.ll'
source_filename = "testInputs/input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.arr = private unnamed_addr constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@LoadResultFormatStrIR = global [60 x i8] c"load instruction with id: %d\09 accesses memory location: %p\0A\00"
@StoreResultFormatStrIR = global [61 x i8] c"store instruction with id: %d\09 accesses memory location: %p\0A\00"
@fileLocationStrIR = global [21 x i8] c"./memoryaccesses.txt\00"
@fileWriteStrIR = global [2 x i8] c"w\00"
@fileAppendStrIR = global [2 x i8] c"a\00"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %0 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileWriteStrIR)
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %arr = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %1 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %2 = call i32 (ptr, ptr, ...) @fprintf(ptr %1, ptr @StoreResultFormatStrIR, i32 11489760, ptr %retval)
  store i32 %argc, ptr %argc.addr, align 4
  %3 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %4 = call i32 (ptr, ptr, ...) @fprintf(ptr %3, ptr @StoreResultFormatStrIR, i32 11489904, ptr %argc.addr)
  store ptr %argv, ptr %argv.addr, align 8
  %5 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %6 = call i32 (ptr, ptr, ...) @fprintf(ptr %5, ptr @StoreResultFormatStrIR, i32 11490048, ptr %argv.addr)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %arr, ptr align 16 @__const.main.arr, i64 40, i1 false)
  store i32 0, ptr %i, align 4
  %7 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr %7, ptr @StoreResultFormatStrIR, i32 11490912, ptr %i)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32, ptr %i, align 4
  %10 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr %10, ptr @LoadResultFormatStrIR, i32 11491312, ptr %i)
  %cmp = icmp slt i32 %9, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i32, ptr %i, align 4
  %13 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %14 = call i32 (ptr, ptr, ...) @fprintf(ptr %13, ptr @LoadResultFormatStrIR, i32 11492112, ptr %i)
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [10 x i32], ptr %arr, i64 0, i64 %idxprom
  %15 = load i32, ptr %arrayidx, align 4
  %16 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr %16, ptr @LoadResultFormatStrIR, i32 11493072, ptr %arrayidx)
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %19 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr %19, ptr @LoadResultFormatStrIR, i32 11493952, ptr %i)
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr %i, align 4
  %21 = call ptr (ptr, ptr, ...) @fopen(ptr @fileLocationStrIR, ptr @fileAppendStrIR)
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr %21, ptr @StoreResultFormatStrIR, i32 11494272, ptr %i)
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

declare ptr @fopen(ptr, ptr, ...)

declare i32 @fprintf(ptr, ptr, ...)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
