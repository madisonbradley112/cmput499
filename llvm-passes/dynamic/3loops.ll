; ModuleID = '3loops.c'
source_filename = "3loops.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.intArray = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@__const.main.floatArray = private unnamed_addr constant [5 x float] [float 0x3FF19999A0000000, float 0x40019999A0000000, float 0x400A666660000000, float 0x40119999A0000000, float 5.500000e+00], align 16
@.str = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"two\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"three\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"four\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"five\00", align 1
@__const.main.stringArray = private unnamed_addr constant [5 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4], align 16
@.str.5 = private unnamed_addr constant [23 x i8] c"Elements of intArray: \00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"Elements of floatArray: \00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"%.1f \00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"Elements of stringArray: \00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"%s \00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %intArray = alloca [5 x i32], align 16
  %floatArray = alloca [5 x float], align 16
  %stringArray = alloca [5 x ptr], align 16
  %intArraySize = alloca i64, align 8
  %floatArraySize = alloca i64, align 8
  %stringArraySize = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %intArray, ptr align 16 @__const.main.intArray, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %floatArray, ptr align 16 @__const.main.floatArray, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %stringArray, ptr align 16 @__const.main.stringArray, i64 40, i1 false)
  store i64 5, ptr %intArraySize, align 8
  store i64 5, ptr %floatArraySize, align 8
  store i64 5, ptr %stringArraySize, align 8
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %i, align 8
  %1 = load i64, ptr %intArraySize, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds [5 x i32], ptr %intArray, i64 0, i64 %2
  %3 = load i32, ptr %arrayidx, align 4
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i64, ptr %i, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i64 0, ptr %j, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end
  %5 = load i64, ptr %j, align 8
  %6 = load i64, ptr %floatArraySize, align 8
  %cmp4 = icmp ult i64 %5, %6
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i64, ptr %j, align 8
  %arrayidx5 = getelementptr inbounds [5 x float], ptr %floatArray, i64 0, i64 %7
  %8 = load float, ptr %arrayidx5, align 4
  %conv = fpext float %8 to double
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %conv)
  %9 = load i64, ptr %j, align 8
  %inc7 = add i64 %9, 1
  store i64 %inc7, ptr %j, align 8
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %call9 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i64 0, ptr %k, align 8
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc16, %while.end
  %10 = load i64, ptr %k, align 8
  %11 = load i64, ptr %stringArraySize, align 8
  %cmp11 = icmp ult i64 %10, %11
  br i1 %cmp11, label %for.body13, label %for.end18

for.body13:                                       ; preds = %for.cond10
  %12 = load i64, ptr %k, align 8
  %arrayidx14 = getelementptr inbounds [5 x ptr], ptr %stringArray, i64 0, i64 %12
  %13 = load ptr, ptr %arrayidx14, align 8
  %call15 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %13)
  br label %for.inc16

for.inc16:                                        ; preds = %for.body13
  %14 = load i64, ptr %k, align 8
  %inc17 = add i64 %14, 1
  store i64 %inc17, ptr %k, align 8
  br label %for.cond10, !llvm.loop !9

for.end18:                                        ; preds = %for.cond10
  %call19 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
