; ModuleID = './test/exampleInputs/3loops.c'
source_filename = "./test/exampleInputs/3loops.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@__const.main.intArray = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 4
@__const.main.floatArray = private unnamed_addr constant [5 x float] [float 0x3FF19999A0000000, float 0x40019999A0000000, float 0x400A666660000000, float 0x40119999A0000000, float 5.500000e+00], align 4
@.str = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"two\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"three\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"four\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"five\00", align 1
@__const.main.stringArray = private unnamed_addr constant [5 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4], align 8
@.str.5 = private unnamed_addr constant [23 x i8] c"Elements of intArray: \00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"Elements of floatArray: \00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"%.1f \00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"Elements of stringArray: \00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"%s \00", align 1

; Function Attrs: nofree nounwind ssp uwtable(sync)
define i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5)
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body
  %putchar = tail call i32 @putchar(i32 10)
  %call3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8)
  br label %while.body

for.body:                                         ; preds = %entry, %for.body
  %i.029 = phi i64 [ 0, %entry ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds [5 x i32], ptr @__const.main.intArray, i64 0, i64 %i.029
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !6
  %call1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %0)
  %inc = add nuw nsw i64 %i.029, 1
  %exitcond.not = icmp eq i64 %inc, 5
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10

while.body:                                       ; preds = %for.cond.cleanup, %while.body
  %j.030 = phi i64 [ 0, %for.cond.cleanup ], [ %inc7, %while.body ]
  %arrayidx5 = getelementptr inbounds [5 x float], ptr @__const.main.floatArray, i64 0, i64 %j.030
  %1 = load float, ptr %arrayidx5, align 4, !tbaa !13
  %conv = fpext float %1 to double
  %call6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, double noundef %conv)
  %inc7 = add nuw nsw i64 %j.030, 1
  %exitcond32.not = icmp eq i64 %inc7, 5
  br i1 %exitcond32.not, label %while.end, label %while.body, !llvm.loop !15

while.end:                                        ; preds = %while.body
  %putchar27 = tail call i32 @putchar(i32 10)
  %call9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10)
  br label %for.body14

for.cond.cleanup13:                               ; preds = %for.body14
  %putchar28 = tail call i32 @putchar(i32 10)
  ret i32 0

for.body14:                                       ; preds = %while.end, %for.body14
  %k.031 = phi i64 [ 0, %while.end ], [ %inc18, %for.body14 ]
  %arrayidx15 = getelementptr inbounds [5 x ptr], ptr @__const.main.stringArray, i64 0, i64 %k.031
  %2 = load ptr, ptr %arrayidx15, align 8, !tbaa !16
  %call16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, ptr noundef %2)
  %inc18 = add nuw nsw i64 %k.031, 1
  %exitcond33.not = icmp eq i64 %inc18, 5
  br i1 %exitcond33.not, label %for.cond.cleanup13, label %for.body14, !llvm.loop !18
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #2

attributes #0 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nofree nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
!15 = distinct !{!15, !11, !12}
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !8, i64 0}
!18 = distinct !{!18, !11, !12}
