; ModuleID = '../test/testInputs/linpack.c'
source_filename = "../test/testInputs/linpack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [25 x i8] c"Memory required:  %ldK.\0A\00", align 1, !dbg !0
@mempool = internal unnamed_addr global ptr null, align 8, !dbg !7
@.str.3 = private unnamed_addr constant [36 x i8] c"\0A\0ALINPACK benchmark, %s precision.\0A\00", align 1, !dbg !36
@.str.4 = private unnamed_addr constant [7 x i8] c"Double\00", align 1, !dbg !41
@.str.5 = private unnamed_addr constant [32 x i8] c"Machine precision:  %d digits.\0A\00", align 1, !dbg !46
@.str.6 = private unnamed_addr constant [21 x i8] c"Array size %d X %d.\0A\00", align 1, !dbg !51
@.str.11 = private unnamed_addr constant [43 x i8] c"%8ld %6.2f %6.2f%% %6.2f%% %6.2f%%  %9.3f\0A\00", align 1, !dbg !73
@str = private unnamed_addr constant [42 x i8] c"Average rolled and unrolled performance:\0A\00", align 1
@str.12 = private unnamed_addr constant [51 x i8] c"    Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS\00", align 1
@str.13 = private unnamed_addr constant [53 x i8] c"----------------------------------------------------\00", align 1
@str.14 = private unnamed_addr constant [51 x i8] c"Not enough memory available for given array size.\0A\00", align 1

; Function Attrs: alwaysinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !83 {
entry:
  %info.i = alloca i32, align 4, !DIAssignID !93
  call void @llvm.dbg.value(metadata ptr null, metadata !87, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.value(metadata i32 200, metadata !88, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.value(metadata i64 40000, metadata !89, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.value(metadata i64 322400, metadata !92, metadata !DIExpression()), !dbg !94
  %call14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i64 noundef 315), !dbg !95
  call void @llvm.dbg.value(metadata i64 322400, metadata !91, metadata !DIExpression()), !dbg !94
  %call17 = tail call noalias dereferenceable_or_null(322400) ptr @malloc(i64 noundef 322400) #10, !dbg !96
  store ptr %call17, ptr @mempool, align 8, !dbg !98, !tbaa !99
  %cmp18 = icmp eq ptr %call17, null, !dbg !103
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !104

if.then20:                                        ; preds = %entry
  %puts55 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.14), !dbg !105
  br label %cleanup, !dbg !107

if.end22:                                         ; preds = %entry
  %call23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, ptr noundef nonnull @.str.4), !dbg !108
  %call24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef 15), !dbg !109
  %call25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 200, i32 noundef 200), !dbg !110
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !111
  %puts53 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.12), !dbg !112
  %puts54 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.13), !dbg !113
  call void @llvm.dbg.value(metadata i64 1, metadata !90, metadata !DIExpression()), !dbg !94
  br label %while.cond, !dbg !114

while.cond:                                       ; preds = %while.body, %if.end22
  %nreps.0 = phi i64 [ 1, %if.end22 ], [ %mul32, %while.body ], !dbg !94
  call void @llvm.dbg.value(metadata i64 %nreps.0, metadata !90, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.assign(metadata i1 undef, metadata !115, metadata !DIExpression(), metadata !93, metadata ptr %info.i, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %nreps.0, metadata !120, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i32 200, metadata !121, metadata !DIExpression()), !dbg !137
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %info.i) #11, !dbg !139
  call void @llvm.dbg.value(metadata i32 200, metadata !134, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i32 100, metadata !133, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 40000, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double 0x4124F49555555555, metadata !131, metadata !DIExpression()), !dbg !137
  %0 = load ptr, ptr @mempool, align 8, !dbg !140, !tbaa !99
  call void @llvm.dbg.value(metadata ptr %0, metadata !122, metadata !DIExpression()), !dbg !137
  %add.ptr.i = getelementptr inbounds double, ptr %0, i64 40000, !dbg !141
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !123, metadata !DIExpression()), !dbg !137
  %arrayidx.i = getelementptr inbounds double, ptr %0, i64 40200, !dbg !142
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !132, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !127, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !128, metadata !DIExpression()), !dbg !137
  %call.i.i = tail call i64 @clock() #11, !dbg !143
  %conv.i.i = sitofp i64 %call.i.i to double, !dbg !148
  %div.i.i = fdiv double %conv.i.i, 1.000000e+06, !dbg !149
  call void @llvm.dbg.value(metadata double %div.i.i, metadata !129, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 0, metadata !135, metadata !DIExpression()), !dbg !137
  %cmp213.i = icmp sgt i64 %nreps.0, 0, !dbg !150
  br i1 %cmp213.i, label %for.cond1.preheader.i.preheader.i.preheader, label %for.end34.i, !dbg !153

for.cond1.preheader.i.preheader.i.preheader:      ; preds = %while.cond
  %arrayidx85.i = getelementptr inbounds i8, ptr %0, i64 321996
  %arrayidx91.i = getelementptr inbounds double, ptr %0, i64 19899
  br label %for.cond1.preheader.i.preheader.i, !dbg !153

for.cond1.preheader.i.preheader.i:                ; preds = %for.cond1.preheader.i.preheader.i.preheader, %dgesl.exit.i
  %i.0216.i = phi i64 [ %inc.i, %dgesl.exit.i ], [ 0, %for.cond1.preheader.i.preheader.i.preheader ]
  %1 = phi <2 x double> [ %93, %dgesl.exit.i ], [ zeroinitializer, %for.cond1.preheader.i.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %i.0216.i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !127, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !128, metadata !DIExpression()), !dbg !137
  br label %for.cond1.preheader.i.i, !dbg !154

for.cond1.preheader.i.i:                          ; preds = %for.inc17.i.i, %for.cond1.preheader.i.preheader.i
  %indvars.iv96.i.i = phi i64 [ %indvars.iv.next97.i.i, %for.inc17.i.i ], [ 0, %for.cond1.preheader.i.preheader.i ]
  %init.089.i.i = phi i32 [ %.lcssa, %for.inc17.i.i ], [ 1325, %for.cond1.preheader.i.preheader.i ]
  call void @llvm.dbg.value(metadata double poison, metadata !124, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %indvars.iv96.i.i, metadata !167, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i32 %init.089.i.i, metadata !165, metadata !DIExpression()), !dbg !170
  %2 = mul nuw nsw i64 %indvars.iv96.i.i, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !166, metadata !DIExpression()), !dbg !170
  br label %for.body3.i.i, !dbg !171

for.body3.i.i:                                    ; preds = %for.body3.i.i, %for.cond1.preheader.i.i
  %indvars.iv.i.i = phi i64 [ 0, %for.cond1.preheader.i.i ], [ %indvars.iv.next.i.i.1, %for.body3.i.i ]
  %init.187.i.i = phi i32 [ %init.089.i.i, %for.cond1.preheader.i.i ], [ %7, %for.body3.i.i ]
  call void @llvm.dbg.value(metadata double poison, metadata !124, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.i, metadata !166, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i32 %init.187.i.i, metadata !165, metadata !DIExpression()), !dbg !170
  %3 = mul nuw nsw i32 %init.187.i.i, 3125
  %4 = and i32 %3, 65535
  call void @llvm.dbg.value(metadata i32 %3, metadata !165, metadata !DIExpression(DW_OP_constu, 65535, DW_OP_and, DW_OP_stack_value)), !dbg !170
  %addconv.i.i = add nsw i32 %4, -32768, !dbg !174
  %sub.i.i = sitofp i32 %addconv.i.i to double, !dbg !174
  %div.i145.i = fmul double %sub.i.i, 0x3F10000000000000, !dbg !177
  %5 = add nuw nsw i64 %indvars.iv.i.i, %2, !dbg !178
  %arrayidx.i.i = getelementptr inbounds double, ptr %0, i64 %5, !dbg !179
  store double %div.i145.i, ptr %arrayidx.i.i, align 8, !dbg !180, !tbaa !181
  %indvars.iv.next.i.i = or i64 %indvars.iv.i.i, 1, !dbg !183
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i, metadata !166, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata double poison, metadata !124, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i, metadata !166, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i32 %3, metadata !165, metadata !DIExpression(DW_OP_constu, 65535, DW_OP_and, DW_OP_stack_value)), !dbg !170
  %6 = mul nsw i32 %init.187.i.i, 761
  %7 = and i32 %6, 65535
  call void @llvm.dbg.value(metadata i32 %7, metadata !165, metadata !DIExpression()), !dbg !170
  %addconv.i.i.1 = add nsw i32 %7, -32768, !dbg !174
  %sub.i.i.1 = sitofp i32 %addconv.i.i.1 to double, !dbg !174
  %div.i145.i.1 = fmul double %sub.i.i.1, 0x3F10000000000000, !dbg !177
  %8 = add nuw nsw i64 %indvars.iv.next.i.i, %2, !dbg !178
  %arrayidx.i.i.1 = getelementptr inbounds double, ptr %0, i64 %8, !dbg !179
  store double %div.i145.i.1, ptr %arrayidx.i.i.1, align 8, !dbg !180, !tbaa !181
  %indvars.iv.next.i.i.1 = add nuw nsw i64 %indvars.iv.i.i, 2, !dbg !183
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.1, metadata !166, metadata !DIExpression()), !dbg !170
  %exitcond.not.i.i.1 = icmp eq i64 %indvars.iv.next.i.i.1, 100, !dbg !184
  br i1 %exitcond.not.i.i.1, label %for.inc17.i.i, label %for.body3.i.i, !dbg !171, !llvm.loop !185

for.inc17.i.i:                                    ; preds = %for.body3.i.i
  %.lcssa = phi i32 [ %7, %for.body3.i.i ]
  %indvars.iv.next97.i.i = add nuw nsw i64 %indvars.iv96.i.i, 1, !dbg !188
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next97.i.i, metadata !167, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i32 %.lcssa, metadata !165, metadata !DIExpression()), !dbg !170
  %exitcond100.not.i.i = icmp eq i64 %indvars.iv.next97.i.i, 100, !dbg !189
  br i1 %exitcond100.not.i.i, label %for.body23.preheader.i.i, label %for.cond1.preheader.i.i, !dbg !154, !llvm.loop !190

for.body23.preheader.i.i:                         ; preds = %for.inc17.i.i
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(800) %add.ptr.i, i8 0, i64 800, i1 false), !dbg !192, !tbaa !181
  call void @llvm.dbg.value(metadata i64 poison, metadata !166, metadata !DIExpression()), !dbg !170
  br label %for.cond33.preheader.i.i, !dbg !195

for.cond33.preheader.i.i:                         ; preds = %for.inc49.i.i, %for.body23.preheader.i.i
  %indvars.iv109.i.i = phi i64 [ 0, %for.body23.preheader.i.i ], [ %indvars.iv.next110.i.i, %for.inc49.i.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv109.i.i, metadata !167, metadata !DIExpression()), !dbg !170
  %9 = mul nuw nsw i64 %indvars.iv109.i.i, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !166, metadata !DIExpression()), !dbg !170
  br label %vector.body171, !dbg !197

vector.body171:                                   ; preds = %vector.body171, %for.cond33.preheader.i.i
  %index172 = phi i64 [ 0, %for.cond33.preheader.i.i ], [ %index.next175.1, %vector.body171 ], !dbg !200
  %10 = getelementptr inbounds double, ptr %add.ptr.i, i64 %index172, !dbg !202
  %wide.load173 = load <2 x double>, ptr %10, align 8, !dbg !202, !tbaa !181
  %11 = add nuw nsw i64 %index172, %9, !dbg !203
  %12 = getelementptr inbounds double, ptr %0, i64 %11, !dbg !204
  %wide.load174 = load <2 x double>, ptr %12, align 8, !dbg !204, !tbaa !181
  %13 = fadd <2 x double> %wide.load173, %wide.load174, !dbg !205
  store <2 x double> %13, ptr %10, align 8, !dbg !206, !tbaa !181
  %index.next175 = or i64 %index172, 2, !dbg !200
  %14 = getelementptr inbounds double, ptr %add.ptr.i, i64 %index.next175, !dbg !202
  %wide.load173.1 = load <2 x double>, ptr %14, align 8, !dbg !202, !tbaa !181
  %15 = add nuw nsw i64 %index.next175, %9, !dbg !203
  %16 = getelementptr inbounds double, ptr %0, i64 %15, !dbg !204
  %wide.load174.1 = load <2 x double>, ptr %16, align 8, !dbg !204, !tbaa !181
  %17 = fadd <2 x double> %wide.load173.1, %wide.load174.1, !dbg !205
  store <2 x double> %17, ptr %14, align 8, !dbg !206, !tbaa !181
  %index.next175.1 = add nuw nsw i64 %index172, 4, !dbg !200
  %18 = icmp eq i64 %index.next175.1, 100, !dbg !200
  br i1 %18, label %for.inc49.i.i, label %vector.body171, !dbg !200, !llvm.loop !207

for.inc49.i.i:                                    ; preds = %vector.body171
  %indvars.iv.next110.i.i = add nuw nsw i64 %indvars.iv109.i.i, 1, !dbg !211
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next110.i.i, metadata !167, metadata !DIExpression()), !dbg !170
  %exitcond113.not.i.i = icmp eq i64 %indvars.iv.next110.i.i, 100, !dbg !212
  br i1 %exitcond113.not.i.i, label %matgen.exit.i, label %for.cond33.preheader.i.i, !dbg !195, !llvm.loop !213

matgen.exit.i:                                    ; preds = %for.inc49.i.i
  %call.i146.i = tail call i64 @clock() #11, !dbg !215
  call void @llvm.dbg.value(metadata double undef, metadata !125, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata ptr %0, metadata !217, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i32 200, metadata !222, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i32 100, metadata !223, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !224, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata ptr %info.i, metadata !225, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i32 1, metadata !226, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i32 99, metadata !232, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i32 0, metadata !229, metadata !DIExpression()), !dbg !233
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc78.i, %matgen.exit.i
  %19 = phi i32 [ %54, %for.inc78.i ], [ 0, %matgen.exit.i ]
  %indvars.iv446.i = phi i64 [ %indvars.iv.next447.i, %for.inc78.i ], [ 0, %matgen.exit.i ]
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.inc78.i ], [ 1, %matgen.exit.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv446.i, metadata !229, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i64 %indvars.iv446.i, metadata !230, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !233
  %20 = sub nuw nsw i64 99, %indvars.iv446.i, !dbg !235
  %21 = sub nuw nsw i64 100, %indvars.iv446.i, !dbg !235
  %22 = mul nuw nsw i64 %indvars.iv446.i, 201, !dbg !242
  %arrayidx.i56 = getelementptr inbounds double, ptr %0, i64 %22, !dbg !243
  call void @llvm.dbg.value(metadata i64 %21, metadata !244, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata ptr %arrayidx.i56, metadata !249, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i32 1, metadata !250, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata double poison, metadata !251, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i32 1, metadata !252, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i32 0, metadata !254, metadata !DIExpression()), !dbg !255
  %23 = load double, ptr %arrayidx.i56, align 8, !dbg !257, !tbaa !181
  %24 = tail call double @llvm.fabs.f64(double %23), !dbg !260
  call void @llvm.dbg.value(metadata double %24, metadata !251, metadata !DIExpression()), !dbg !255
  br label %for.body17.i.i, !dbg !261

for.body17.i.i:                                   ; preds = %for.body17.i.i, %for.body.i
  %indvars.iv.i.i57 = phi i64 [ 1, %for.body.i ], [ %indvars.iv.next.i.i59, %for.body17.i.i ]
  %itemp.257.i.i = phi i32 [ 0, %for.body.i ], [ %itemp.3.i.i, %for.body17.i.i ]
  %dmax.255.i.i = phi double [ %24, %for.body.i ], [ %dmax.3.i.i, %for.body17.i.i ]
  call void @llvm.dbg.value(metadata i32 %itemp.257.i.i, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.i57, metadata !252, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata double %dmax.255.i.i, metadata !251, metadata !DIExpression()), !dbg !255
  %arrayidx19.i.i58 = getelementptr inbounds double, ptr %arrayidx.i56, i64 %indvars.iv.i.i57, !dbg !263
  %25 = load double, ptr %arrayidx19.i.i58, align 8, !dbg !263, !tbaa !181
  %26 = tail call double @llvm.fabs.f64(double %25), !dbg !266
  %cmp20.i.i = fcmp ogt double %26, %dmax.255.i.i, !dbg !267
  %dmax.3.i.i = select i1 %cmp20.i.i, double %26, double %dmax.255.i.i, !dbg !268
  %27 = trunc i64 %indvars.iv.i.i57 to i32, !dbg !268
  %itemp.3.i.i = select i1 %cmp20.i.i, i32 %27, i32 %itemp.257.i.i, !dbg !268
  call void @llvm.dbg.value(metadata i32 %itemp.3.i.i, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata double %dmax.3.i.i, metadata !251, metadata !DIExpression()), !dbg !255
  %indvars.iv.next.i.i59 = add nuw nsw i64 %indvars.iv.i.i57, 1, !dbg !269
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i59, metadata !252, metadata !DIExpression()), !dbg !255
  %exitcond.not.i.i60 = icmp eq i64 %indvars.iv.next.i.i59, %21, !dbg !270
  br i1 %exitcond.not.i.i60, label %idamax.exit.i, label %for.body17.i.i, !dbg !261, !llvm.loop !271

idamax.exit.i:                                    ; preds = %for.body17.i.i
  %itemp.3.i.i.lcssa = phi i32 [ %itemp.3.i.i, %for.body17.i.i ], !dbg !268
  %28 = sub nuw nsw i64 99, %indvars.iv446.i, !dbg !235
  %indvars.iv.next447.i = add nuw nsw i64 %indvars.iv446.i, 1, !dbg !273
  %29 = mul nuw nsw i64 %indvars.iv446.i, 200, !dbg !274
  %30 = trunc i64 %indvars.iv446.i to i32, !dbg !275
  %add5.i = add nsw i32 %itemp.3.i.i.lcssa, %30, !dbg !275
  call void @llvm.dbg.value(metadata i32 %add5.i, metadata !231, metadata !DIExpression()), !dbg !233
  %arrayidx7.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv446.i, !dbg !276
  store i32 %add5.i, ptr %arrayidx7.i, align 4, !dbg !277, !tbaa !278
  %31 = sext i32 %add5.i to i64, !dbg !280
  %32 = add nsw i64 %29, %31, !dbg !280
  %arrayidx11.i = getelementptr inbounds double, ptr %0, i64 %32, !dbg !282
  %33 = load double, ptr %arrayidx11.i, align 8, !dbg !282, !tbaa !181
  %cmp12.i = fcmp une double %33, 0.000000e+00, !dbg !283
  br i1 %cmp12.i, label %if.then13.i, label %for.inc78.i, !dbg !284

if.then13.i:                                      ; preds = %idamax.exit.i
  %cmp14.not.i = icmp eq i32 %itemp.3.i.i.lcssa, 0, !dbg !285
  br i1 %cmp14.not.i, label %if.end.i61, label %if.then15.i, !dbg !288

if.then15.i:                                      ; preds = %if.then13.i
  call void @llvm.dbg.value(metadata double %33, metadata !227, metadata !DIExpression()), !dbg !233
  store double %23, ptr %arrayidx11.i, align 8, !dbg !289, !tbaa !181
  store double %33, ptr %arrayidx.i56, align 8, !dbg !291, !tbaa !181
  br label %if.end.i61, !dbg !292

if.end.i61:                                       ; preds = %if.then15.i, %if.then13.i
  %34 = phi double [ %33, %if.then15.i ], [ %23, %if.then13.i ], !dbg !293
  %div.i = fdiv double -1.000000e+00, %34, !dbg !294
  call void @llvm.dbg.value(metadata double %div.i, metadata !227, metadata !DIExpression()), !dbg !233
  %35 = sub nuw nsw i64 99, %indvars.iv446.i, !dbg !295
  %36 = add nuw nsw i64 %22, 1, !dbg !296
  %arrayidx42.i = getelementptr inbounds double, ptr %0, i64 %36, !dbg !297
  call void @llvm.dbg.value(metadata i64 %35, metadata !298, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.value(metadata double %div.i, metadata !303, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.value(metadata ptr %arrayidx42.i, metadata !304, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.value(metadata i32 1, metadata !305, metadata !DIExpression()), !dbg !308
  %min.iters.check154 = icmp ult i64 %20, 2, !dbg !310
  br i1 %min.iters.check154, label %for.body10.i.i.preheader, label %vector.ph155, !dbg !310

vector.ph155:                                     ; preds = %if.end.i61
  %n.vec157 = and i64 %20, -2, !dbg !310
  %broadcast.splatinsert163 = insertelement <2 x double> poison, double %div.i, i64 0, !dbg !310
  %broadcast.splat164 = shufflevector <2 x double> %broadcast.splatinsert163, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !310
  br label %vector.body160, !dbg !310

vector.body160:                                   ; preds = %vector.body160, %vector.ph155
  %index161 = phi i64 [ 0, %vector.ph155 ], [ %index.next165, %vector.body160 ], !dbg !312
  %37 = getelementptr inbounds double, ptr %arrayidx42.i, i64 %index161, !dbg !314
  %wide.load162 = load <2 x double>, ptr %37, align 8, !dbg !314, !tbaa !181
  %38 = fmul <2 x double> %broadcast.splat164, %wide.load162, !dbg !315
  store <2 x double> %38, ptr %37, align 8, !dbg !316, !tbaa !181
  %index.next165 = add nuw i64 %index161, 2, !dbg !312
  %39 = icmp eq i64 %index.next165, %n.vec157, !dbg !312
  br i1 %39, label %middle.block152, label %vector.body160, !dbg !312, !llvm.loop !317

middle.block152:                                  ; preds = %vector.body160
  %cmp.n159 = icmp eq i64 %20, %n.vec157, !dbg !310
  br i1 %cmp.n159, label %for.body45.i.preheader, label %for.body10.i.i.preheader, !dbg !310

for.body10.i.i.preheader:                         ; preds = %if.end.i61, %middle.block152
  %indvars.iv.i392.i.ph = phi i64 [ 0, %if.end.i61 ], [ %n.vec157, %middle.block152 ]
  br label %for.body10.i.i, !dbg !310

for.body10.i.i:                                   ; preds = %for.body10.i.i.preheader, %for.body10.i.i
  %indvars.iv.i392.i = phi i64 [ %indvars.iv.next.i393.i, %for.body10.i.i ], [ %indvars.iv.i392.i.ph, %for.body10.i.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i392.i, metadata !306, metadata !DIExpression()), !dbg !308
  %arrayidx12.i.i = getelementptr inbounds double, ptr %arrayidx42.i, i64 %indvars.iv.i392.i, !dbg !314
  %40 = load double, ptr %arrayidx12.i.i, align 8, !dbg !314, !tbaa !181
  %mul13.i.i = fmul double %div.i, %40, !dbg !315
  store double %mul13.i.i, ptr %arrayidx12.i.i, align 8, !dbg !316, !tbaa !181
  %indvars.iv.next.i393.i = add nuw nsw i64 %indvars.iv.i392.i, 1, !dbg !312
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i393.i, metadata !306, metadata !DIExpression()), !dbg !308
  %exitcond.not.i394.i = icmp eq i64 %indvars.iv.next.i393.i, %35, !dbg !319
  br i1 %exitcond.not.i394.i, label %for.body45.i.preheader, label %for.body10.i.i, !dbg !310, !llvm.loop !320

for.body45.i.preheader:                           ; preds = %for.body10.i.i, %middle.block152
  %min.iters.check139 = icmp ult i64 %28, 2
  %n.vec142 = and i64 %28, -2
  %cmp.n144 = icmp eq i64 %28, %n.vec142
  br label %for.body45.i, !dbg !321

for.body45.i:                                     ; preds = %for.body45.i.preheader, %daxpy_r.exit.i
  %indvars.iv439.i = phi i64 [ %indvars.iv.next440.i, %daxpy_r.exit.i ], [ %indvars.iv.i, %for.body45.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv439.i, metadata !228, metadata !DIExpression()), !dbg !233
  %41 = mul nuw nsw i64 %indvars.iv439.i, 200, !dbg !323
  %42 = add nsw i64 %41, %31, !dbg !326
  %arrayidx49.i = getelementptr inbounds double, ptr %0, i64 %42, !dbg !327
  %43 = load double, ptr %arrayidx49.i, align 8, !dbg !327, !tbaa !181
  call void @llvm.dbg.value(metadata double %43, metadata !227, metadata !DIExpression()), !dbg !233
  br i1 %cmp14.not.i, label %if.end64.i, label %if.then51.i, !dbg !328

if.then51.i:                                      ; preds = %for.body45.i
  %44 = add nuw nsw i64 %41, %indvars.iv446.i, !dbg !329
  %arrayidx55.i = getelementptr inbounds double, ptr %0, i64 %44, !dbg !332
  %45 = load double, ptr %arrayidx55.i, align 8, !dbg !332, !tbaa !181
  store double %45, ptr %arrayidx49.i, align 8, !dbg !333, !tbaa !181
  store double %43, ptr %arrayidx55.i, align 8, !dbg !334, !tbaa !181
  br label %if.end64.i, !dbg !335

if.end64.i:                                       ; preds = %if.then51.i, %for.body45.i
  %46 = add nuw nsw i64 %41, %indvars.iv.next447.i, !dbg !336
  %arrayidx76.i = getelementptr inbounds double, ptr %0, i64 %46, !dbg !337
  call void @llvm.dbg.value(metadata i64 %35, metadata !338, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata double %43, metadata !343, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata ptr %arrayidx42.i, metadata !344, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i32 1, metadata !345, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata ptr %arrayidx76.i, metadata !346, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.value(metadata i32 1, metadata !347, metadata !DIExpression()), !dbg !351
  %cmp1.i.i = fcmp oeq double %43, 0.000000e+00
  br i1 %cmp1.i.i, label %daxpy_r.exit.i, label %for.body29.i.i.preheader, !dbg !353

for.body29.i.i.preheader:                         ; preds = %if.end64.i
  br i1 %min.iters.check139, label %for.body29.i.i.preheader176, label %vector.ph140, !dbg !354

vector.ph140:                                     ; preds = %for.body29.i.i.preheader
  %broadcast.splatinsert149 = insertelement <2 x double> poison, double %43, i64 0, !dbg !354
  %broadcast.splat150 = shufflevector <2 x double> %broadcast.splatinsert149, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !354
  br label %vector.body145, !dbg !354

vector.body145:                                   ; preds = %vector.body145, %vector.ph140
  %index146 = phi i64 [ 0, %vector.ph140 ], [ %index.next151, %vector.body145 ], !dbg !356
  %47 = getelementptr inbounds double, ptr %arrayidx76.i, i64 %index146, !dbg !358
  %wide.load147 = load <2 x double>, ptr %47, align 8, !dbg !358, !tbaa !181
  %48 = getelementptr inbounds double, ptr %arrayidx42.i, i64 %index146, !dbg !359
  %wide.load148 = load <2 x double>, ptr %48, align 8, !dbg !359, !tbaa !181
  %49 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat150, <2 x double> %wide.load148, <2 x double> %wide.load147), !dbg !360
  store <2 x double> %49, ptr %47, align 8, !dbg !361, !tbaa !181
  %index.next151 = add nuw i64 %index146, 2, !dbg !356
  %50 = icmp eq i64 %index.next151, %n.vec142, !dbg !356
  br i1 %50, label %middle.block137, label %vector.body145, !dbg !356, !llvm.loop !362

middle.block137:                                  ; preds = %vector.body145
  br i1 %cmp.n144, label %daxpy_r.exit.i, label %for.body29.i.i.preheader176, !dbg !354

for.body29.i.i.preheader176:                      ; preds = %for.body29.i.i.preheader, %middle.block137
  %indvars.iv.i397.i.ph = phi i64 [ 0, %for.body29.i.i.preheader ], [ %n.vec142, %middle.block137 ]
  br label %for.body29.i.i, !dbg !354

for.body29.i.i:                                   ; preds = %for.body29.i.i.preheader176, %for.body29.i.i
  %indvars.iv.i397.i = phi i64 [ %indvars.iv.next.i398.i, %for.body29.i.i ], [ %indvars.iv.i397.i.ph, %for.body29.i.i.preheader176 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i397.i, metadata !348, metadata !DIExpression()), !dbg !351
  %arrayidx31.i.i = getelementptr inbounds double, ptr %arrayidx76.i, i64 %indvars.iv.i397.i, !dbg !358
  %51 = load double, ptr %arrayidx31.i.i, align 8, !dbg !358, !tbaa !181
  %arrayidx33.i.i = getelementptr inbounds double, ptr %arrayidx42.i, i64 %indvars.iv.i397.i, !dbg !359
  %52 = load double, ptr %arrayidx33.i.i, align 8, !dbg !359, !tbaa !181
  %53 = tail call double @llvm.fmuladd.f64(double %43, double %52, double %51), !dbg !360
  store double %53, ptr %arrayidx31.i.i, align 8, !dbg !361, !tbaa !181
  %indvars.iv.next.i398.i = add nuw nsw i64 %indvars.iv.i397.i, 1, !dbg !356
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i398.i, metadata !348, metadata !DIExpression()), !dbg !351
  %exitcond.not.i399.i = icmp eq i64 %indvars.iv.next.i398.i, %35, !dbg !364
  br i1 %exitcond.not.i399.i, label %daxpy_r.exit.i, label %for.body29.i.i, !dbg !354, !llvm.loop !365

daxpy_r.exit.i:                                   ; preds = %for.body29.i.i, %middle.block137, %if.end64.i
  %indvars.iv.next440.i = add nuw nsw i64 %indvars.iv439.i, 1, !dbg !366
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next440.i, metadata !228, metadata !DIExpression()), !dbg !233
  %exitcond.not.i62 = icmp eq i64 %indvars.iv.next440.i, 100, !dbg !367
  br i1 %exitcond.not.i62, label %for.inc78.i, label %for.body45.i, !dbg !321, !llvm.loop !368

for.inc78.i:                                      ; preds = %daxpy_r.exit.i, %idamax.exit.i
  %54 = phi i32 [ %30, %idamax.exit.i ], [ %19, %daxpy_r.exit.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next447.i, metadata !229, metadata !DIExpression()), !dbg !233
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !370
  %exitcond455.not.i = icmp eq i64 %indvars.iv.next447.i, 99, !dbg !371
  br i1 %exitcond455.not.i, label %if.end81.i, label %for.body.i, !dbg !370, !llvm.loop !372

if.end81.i:                                       ; preds = %for.inc78.i
  %.lcssa190 = phi i32 [ %54, %for.inc78.i ]
  store i32 99, ptr %arrayidx85.i, align 4, !dbg !374, !tbaa !278
  %55 = load double, ptr %arrayidx91.i, align 8, !dbg !375, !tbaa !181
  %call.i149.i = tail call i64 @clock() #11, !dbg !377
  %conv.i150.i = sitofp i64 %call.i149.i to double, !dbg !379
  call void @llvm.dbg.value(metadata double undef, metadata !128, metadata !DIExpression()), !dbg !137
  %call.i152.i = tail call i64 @clock() #11, !dbg !380
  call void @llvm.dbg.value(metadata double undef, metadata !125, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata ptr %0, metadata !382, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata i32 200, metadata !387, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata i32 100, metadata !388, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !389, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !390, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata i32 0, metadata !391, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata i32 1, metadata !392, metadata !DIExpression()), !dbg !398
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %daxpy_r.exit.i.i, %if.end81.i
  %indvars.iv.i155.i = phi i64 [ %indvars.iv.next.i157.i, %daxpy_r.exit.i.i ], [ 0, %if.end81.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i155.i, metadata !394, metadata !DIExpression()), !dbg !398
  %56 = sub nuw nsw i64 99, %indvars.iv.i155.i, !dbg !400
  %arrayidx.i156.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv.i155.i, !dbg !400
  %57 = load i32, ptr %arrayidx.i156.i, align 4, !dbg !400, !tbaa !278
  call void @llvm.dbg.value(metadata i32 %57, metadata !396, metadata !DIExpression()), !dbg !398
  %idxprom5.i.i = sext i32 %57 to i64, !dbg !409
  %arrayidx6.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %idxprom5.i.i, !dbg !409
  %58 = load double, ptr %arrayidx6.i.i, align 8, !dbg !409, !tbaa !181
  call void @llvm.dbg.value(metadata double %58, metadata !393, metadata !DIExpression()), !dbg !398
  %59 = zext i32 %57 to i64, !dbg !410
  %cmp7.not.i.i = icmp eq i64 %indvars.iv.i155.i, %59, !dbg !410
  br i1 %cmp7.not.i.i, label %if.end.i.i, label %if.then8.i.i, !dbg !412

if.then8.i.i:                                     ; preds = %for.body.i.i
  %arrayidx10.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.i155.i, !dbg !413
  %60 = load double, ptr %arrayidx10.i.i, align 8, !dbg !413, !tbaa !181
  store double %60, ptr %arrayidx6.i.i, align 8, !dbg !415, !tbaa !181
  store double %58, ptr %arrayidx10.i.i, align 8, !dbg !416, !tbaa !181
  br label %if.end.i.i, !dbg !417

if.end.i.i:                                       ; preds = %if.then8.i.i, %for.body.i.i
  %indvars.iv.next.i157.i = add nuw nsw i64 %indvars.iv.i155.i, 1, !dbg !418
  %61 = mul nuw nsw i64 %indvars.iv.i155.i, 201, !dbg !419
  %62 = add nuw nsw i64 %61, 1, !dbg !420
  %arrayidx19.i.i = getelementptr inbounds double, ptr %0, i64 %62, !dbg !421
  %arrayidx22.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next.i157.i, !dbg !422
  call void @llvm.dbg.value(metadata !DIArgList(i32 99, i64 %indvars.iv.i155.i), metadata !338, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !423
  call void @llvm.dbg.value(metadata double %58, metadata !343, metadata !DIExpression()), !dbg !423
  call void @llvm.dbg.value(metadata ptr %arrayidx19.i.i, metadata !344, metadata !DIExpression()), !dbg !423
  call void @llvm.dbg.value(metadata i32 1, metadata !345, metadata !DIExpression()), !dbg !423
  call void @llvm.dbg.value(metadata ptr %arrayidx22.i.i, metadata !346, metadata !DIExpression()), !dbg !423
  call void @llvm.dbg.value(metadata i32 1, metadata !347, metadata !DIExpression()), !dbg !423
  %cmp1.i.i.i = fcmp oeq double %58, 0.000000e+00
  br i1 %cmp1.i.i.i, label %daxpy_r.exit.i.i, label %for.body29.preheader.i.i.i, !dbg !425

for.body29.preheader.i.i.i:                       ; preds = %if.end.i.i
  %63 = sub nuw nsw i64 99, %indvars.iv.i155.i, !dbg !426
  call void @llvm.dbg.value(metadata i64 %63, metadata !338, metadata !DIExpression()), !dbg !423
  %min.iters.check124 = icmp ult i64 %56, 2, !dbg !427
  br i1 %min.iters.check124, label %for.body29.i.i.i.preheader, label %vector.ph125, !dbg !427

vector.ph125:                                     ; preds = %for.body29.preheader.i.i.i
  %n.vec127 = and i64 %56, -2, !dbg !427
  %broadcast.splatinsert134 = insertelement <2 x double> poison, double %58, i64 0, !dbg !427
  %broadcast.splat135 = shufflevector <2 x double> %broadcast.splatinsert134, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !427
  br label %vector.body130, !dbg !427

vector.body130:                                   ; preds = %vector.body130, %vector.ph125
  %index131 = phi i64 [ 0, %vector.ph125 ], [ %index.next136, %vector.body130 ], !dbg !428
  %64 = getelementptr inbounds double, ptr %arrayidx22.i.i, i64 %index131, !dbg !429
  %wide.load132 = load <2 x double>, ptr %64, align 8, !dbg !429, !tbaa !181
  %65 = getelementptr inbounds double, ptr %arrayidx19.i.i, i64 %index131, !dbg !430
  %wide.load133 = load <2 x double>, ptr %65, align 8, !dbg !430, !tbaa !181
  %66 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat135, <2 x double> %wide.load133, <2 x double> %wide.load132), !dbg !431
  store <2 x double> %66, ptr %64, align 8, !dbg !432, !tbaa !181
  %index.next136 = add nuw i64 %index131, 2, !dbg !428
  %67 = icmp eq i64 %index.next136, %n.vec127, !dbg !428
  br i1 %67, label %middle.block122, label %vector.body130, !dbg !428, !llvm.loop !433

middle.block122:                                  ; preds = %vector.body130
  %cmp.n129 = icmp eq i64 %56, %n.vec127, !dbg !427
  br i1 %cmp.n129, label %daxpy_r.exit.i.i, label %for.body29.i.i.i.preheader, !dbg !427

for.body29.i.i.i.preheader:                       ; preds = %for.body29.preheader.i.i.i, %middle.block122
  %indvars.iv.i.i.i.ph = phi i64 [ 0, %for.body29.preheader.i.i.i ], [ %n.vec127, %middle.block122 ]
  br label %for.body29.i.i.i, !dbg !427

for.body29.i.i.i:                                 ; preds = %for.body29.i.i.i.preheader, %for.body29.i.i.i
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i, %for.body29.i.i.i ], [ %indvars.iv.i.i.i.ph, %for.body29.i.i.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.i.i, metadata !348, metadata !DIExpression()), !dbg !423
  %arrayidx31.i.i.i = getelementptr inbounds double, ptr %arrayidx22.i.i, i64 %indvars.iv.i.i.i, !dbg !429
  %68 = load double, ptr %arrayidx31.i.i.i, align 8, !dbg !429, !tbaa !181
  %arrayidx33.i.i.i = getelementptr inbounds double, ptr %arrayidx19.i.i, i64 %indvars.iv.i.i.i, !dbg !430
  %69 = load double, ptr %arrayidx33.i.i.i, align 8, !dbg !430, !tbaa !181
  %70 = tail call double @llvm.fmuladd.f64(double %58, double %69, double %68), !dbg !431
  store double %70, ptr %arrayidx31.i.i.i, align 8, !dbg !432, !tbaa !181
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1, !dbg !428
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.i, metadata !348, metadata !DIExpression()), !dbg !423
  %exitcond.not.i.i.i = icmp eq i64 %indvars.iv.next.i.i.i, %63, !dbg !435
  br i1 %exitcond.not.i.i.i, label %daxpy_r.exit.i.i, label %for.body29.i.i.i, !dbg !427, !llvm.loop !436

daxpy_r.exit.i.i:                                 ; preds = %for.body29.i.i.i, %middle.block122, %if.end.i.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i157.i, metadata !394, metadata !DIExpression()), !dbg !398
  %exitcond.not.i158.i = icmp eq i64 %indvars.iv.next.i157.i, 99, !dbg !437
  br i1 %exitcond.not.i158.i, label %for.body26.i.preheader.i, label %for.body.i.i, !dbg !438, !llvm.loop !439

for.body26.i.preheader.i:                         ; preds = %daxpy_r.exit.i.i
  %div.i151.i = fdiv double %conv.i150.i, 1.000000e+06, !dbg !441
  br label %for.body26.i.i, !dbg !442

for.body26.i.i:                                   ; preds = %daxpy_r.exit430.i.i, %for.body26.i.preheader.i
  %indvars.iv481.i.i = phi i64 [ %indvars.iv.next482.i.i, %daxpy_r.exit430.i.i ], [ 0, %for.body26.i.preheader.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv481.i.i, metadata !395, metadata !DIExpression()), !dbg !398
  %71 = sub nuw nsw i64 99, %indvars.iv481.i.i, !dbg !444
  %indvars.iv.next482.i.i = add nuw nsw i64 %indvars.iv481.i.i, 1, !dbg !444
  %72 = sub nuw nsw i64 99, %indvars.iv481.i.i, !dbg !447
  call void @llvm.dbg.value(metadata i64 %72, metadata !394, metadata !DIExpression()), !dbg !398
  %arrayidx30.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %72, !dbg !448
  %73 = load double, ptr %arrayidx30.i.i, align 8, !dbg !448, !tbaa !181
  %74 = mul nuw nsw i64 %72, 200, !dbg !449
  %75 = mul nuw nsw i64 %72, 201, !dbg !450
  %arrayidx34.i.i = getelementptr inbounds double, ptr %0, i64 %75, !dbg !451
  %76 = load double, ptr %arrayidx34.i.i, align 8, !dbg !451, !tbaa !181
  %div.i159.i = fdiv double %73, %76, !dbg !452
  store double %div.i159.i, ptr %arrayidx30.i.i, align 8, !dbg !453, !tbaa !181
  %fneg.i.i = fneg double %div.i159.i, !dbg !454
  call void @llvm.dbg.value(metadata double %fneg.i.i, metadata !393, metadata !DIExpression()), !dbg !398
  %arrayidx42.i160.i = getelementptr inbounds double, ptr %0, i64 %74, !dbg !455
  call void @llvm.dbg.value(metadata i64 %72, metadata !338, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.value(metadata double %fneg.i.i, metadata !343, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.value(metadata ptr %arrayidx42.i160.i, metadata !344, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.value(metadata i32 1, metadata !345, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !346, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.value(metadata i32 1, metadata !347, metadata !DIExpression()), !dbg !456
  %cmp.i419.i.i = icmp eq i64 %indvars.iv481.i.i, 99, !dbg !458
  %cmp1.i420.i.i = fcmp oeq double %div.i159.i, 0.000000e+00
  %or.cond.i421.i.i = or i1 %cmp.i419.i.i, %cmp1.i420.i.i, !dbg !460
  br i1 %or.cond.i421.i.i, label %daxpy_r.exit430.i.i, label %for.body29.i424.i.i.preheader, !dbg !460

for.body29.i424.i.i.preheader:                    ; preds = %for.body26.i.i
  %min.iters.check105 = icmp ult i64 %71, 4, !dbg !461
  br i1 %min.iters.check105, label %for.body29.i424.i.i.preheader177, label %vector.ph106, !dbg !461

vector.ph106:                                     ; preds = %for.body29.i424.i.i.preheader
  %n.vec108 = and i64 %71, -4, !dbg !461
  %broadcast.splatinsert117 = insertelement <2 x double> poison, double %fneg.i.i, i64 0, !dbg !461
  %broadcast.splat118 = shufflevector <2 x double> %broadcast.splatinsert117, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !461
  %broadcast.splatinsert119 = insertelement <2 x double> poison, double %fneg.i.i, i64 0, !dbg !461
  %broadcast.splat120 = shufflevector <2 x double> %broadcast.splatinsert119, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !461
  br label %vector.body111, !dbg !461

vector.body111:                                   ; preds = %vector.body111, %vector.ph106
  %index112 = phi i64 [ 0, %vector.ph106 ], [ %index.next121, %vector.body111 ], !dbg !462
  %77 = getelementptr inbounds double, ptr %add.ptr.i, i64 %index112, !dbg !463
  %wide.load113 = load <2 x double>, ptr %77, align 8, !dbg !463, !tbaa !181
  %78 = getelementptr inbounds double, ptr %77, i64 2, !dbg !463
  %wide.load114 = load <2 x double>, ptr %78, align 8, !dbg !463, !tbaa !181
  %79 = getelementptr inbounds double, ptr %arrayidx42.i160.i, i64 %index112, !dbg !464
  %wide.load115 = load <2 x double>, ptr %79, align 8, !dbg !464, !tbaa !181
  %80 = getelementptr inbounds double, ptr %79, i64 2, !dbg !464
  %wide.load116 = load <2 x double>, ptr %80, align 8, !dbg !464, !tbaa !181
  %81 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat118, <2 x double> %wide.load115, <2 x double> %wide.load113), !dbg !465
  %82 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat120, <2 x double> %wide.load116, <2 x double> %wide.load114), !dbg !465
  store <2 x double> %81, ptr %77, align 8, !dbg !466, !tbaa !181
  store <2 x double> %82, ptr %78, align 8, !dbg !466, !tbaa !181
  %index.next121 = add nuw i64 %index112, 4, !dbg !462
  %83 = icmp eq i64 %index.next121, %n.vec108, !dbg !462
  br i1 %83, label %middle.block103, label %vector.body111, !dbg !462, !llvm.loop !467

middle.block103:                                  ; preds = %vector.body111
  %cmp.n110 = icmp eq i64 %71, %n.vec108, !dbg !461
  br i1 %cmp.n110, label %daxpy_r.exit430.i.i, label %for.body29.i424.i.i.preheader177, !dbg !461

for.body29.i424.i.i.preheader177:                 ; preds = %for.body29.i424.i.i.preheader, %middle.block103
  %indvars.iv.i425.i.i.ph = phi i64 [ 0, %for.body29.i424.i.i.preheader ], [ %n.vec108, %middle.block103 ]
  br label %for.body29.i424.i.i, !dbg !461

for.body29.i424.i.i:                              ; preds = %for.body29.i424.i.i.preheader177, %for.body29.i424.i.i
  %indvars.iv.i425.i.i = phi i64 [ %indvars.iv.next.i428.i.i, %for.body29.i424.i.i ], [ %indvars.iv.i425.i.i.ph, %for.body29.i424.i.i.preheader177 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i425.i.i, metadata !348, metadata !DIExpression()), !dbg !456
  %arrayidx31.i426.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.i425.i.i, !dbg !463
  %84 = load double, ptr %arrayidx31.i426.i.i, align 8, !dbg !463, !tbaa !181
  %arrayidx33.i427.i.i = getelementptr inbounds double, ptr %arrayidx42.i160.i, i64 %indvars.iv.i425.i.i, !dbg !464
  %85 = load double, ptr %arrayidx33.i427.i.i, align 8, !dbg !464, !tbaa !181
  %86 = tail call double @llvm.fmuladd.f64(double %fneg.i.i, double %85, double %84), !dbg !465
  store double %86, ptr %arrayidx31.i426.i.i, align 8, !dbg !466, !tbaa !181
  %indvars.iv.next.i428.i.i = add nuw nsw i64 %indvars.iv.i425.i.i, 1, !dbg !462
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i428.i.i, metadata !348, metadata !DIExpression()), !dbg !456
  %exitcond.not.i429.i.i = icmp eq i64 %indvars.iv.next.i428.i.i, %72, !dbg !469
  br i1 %exitcond.not.i429.i.i, label %daxpy_r.exit430.i.i, label %for.body29.i424.i.i, !dbg !461, !llvm.loop !470

daxpy_r.exit430.i.i:                              ; preds = %for.body29.i424.i.i, %middle.block103, %for.body26.i.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next482.i.i, metadata !395, metadata !DIExpression()), !dbg !398
  %exitcond487.not.i.i = icmp eq i64 %indvars.iv.next482.i.i, 100, !dbg !471
  br i1 %exitcond487.not.i.i, label %dgesl.exit.i, label %for.body26.i.i, !dbg !442, !llvm.loop !472

dgesl.exit.i:                                     ; preds = %daxpy_r.exit430.i.i
  %conv.i147.i = sitofp i64 %call.i146.i to double, !dbg !474
  %conv.i153.i = sitofp i64 %call.i152.i to double, !dbg !475
  %87 = insertelement <2 x double> poison, double %conv.i153.i, i64 0, !dbg !476
  %88 = insertelement <2 x double> %87, double %conv.i147.i, i64 1, !dbg !476
  %89 = fdiv <2 x double> %88, <double 1.000000e+06, double 1.000000e+06>, !dbg !477
  %call.i161.i = tail call i64 @clock() #11, !dbg !478
  %conv.i162.i = sitofp i64 %call.i161.i to double, !dbg !480
  %div.i163.i = fdiv double %conv.i162.i, 1.000000e+06, !dbg !481
  %90 = insertelement <2 x double> poison, double %div.i163.i, i64 0, !dbg !482
  %91 = insertelement <2 x double> %90, double %div.i151.i, i64 1, !dbg !482
  %92 = fsub <2 x double> %91, %89, !dbg !483
  %93 = fadd <2 x double> %1, %92, !dbg !484
  call void @llvm.dbg.value(metadata double undef, metadata !127, metadata !DIExpression()), !dbg !137
  %inc.i = add nuw nsw i64 %i.0216.i, 1, !dbg !485
  call void @llvm.dbg.value(metadata i64 %inc.i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !128, metadata !DIExpression()), !dbg !137
  %exitcond.not.i = icmp eq i64 %inc.i, %nreps.0, !dbg !150
  br i1 %exitcond.not.i, label %for.cond1.preheader.i164.preheader.i.preheader, label %for.cond1.preheader.i.preheader.i, !dbg !153, !llvm.loop !486

for.cond1.preheader.i164.preheader.i.preheader:   ; preds = %dgesl.exit.i
  %.lcssa192 = phi <2 x double> [ %93, %dgesl.exit.i ], !dbg !484
  %.lcssa191 = phi double [ %55, %dgesl.exit.i ], !dbg !375
  %.lcssa190.lcssa = phi i32 [ %.lcssa190, %dgesl.exit.i ]
  %cmp92.i.le = fcmp oeq double %.lcssa191, 0.000000e+00
  %.lcssa6668.le = select i1 %cmp92.i.le, i32 99, i32 %.lcssa190.lcssa
  store i32 %.lcssa6668.le, ptr %info.i, align 4, !tbaa !278
  %arrayidx33.i449.i.i.1 = getelementptr inbounds double, ptr %0, i64 40001
  %arrayidx33.i449.i.i.2 = getelementptr inbounds double, ptr %0, i64 40002
  br label %for.cond1.preheader.i164.preheader.i, !dbg !488

for.cond1.preheader.i164.preheader.i:             ; preds = %for.cond1.preheader.i164.preheader.i.preheader, %dgesl.exit204.i
  %i.1221.i = phi i64 [ %inc33.i, %dgesl.exit204.i ], [ 0, %for.cond1.preheader.i164.preheader.i.preheader ]
  %94 = phi <2 x double> [ %524, %dgesl.exit204.i ], [ %.lcssa192, %for.cond1.preheader.i164.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %i.1221.i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !127, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !128, metadata !DIExpression()), !dbg !137
  br label %for.cond1.preheader.i164.i, !dbg !490

for.cond1.preheader.i164.i:                       ; preds = %for.inc17.i178.i, %for.cond1.preheader.i164.preheader.i
  %indvars.iv96.i165.i = phi i64 [ %indvars.iv.next97.i179.i, %for.inc17.i178.i ], [ 0, %for.cond1.preheader.i164.preheader.i ]
  %init.089.i166.i = phi i32 [ %.lcssa193, %for.inc17.i178.i ], [ 1325, %for.cond1.preheader.i164.preheader.i ]
  call void @llvm.dbg.value(metadata double poison, metadata !124, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %indvars.iv96.i165.i, metadata !167, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata i32 %init.089.i166.i, metadata !165, metadata !DIExpression()), !dbg !494
  %95 = mul nuw nsw i64 %indvars.iv96.i165.i, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !166, metadata !DIExpression()), !dbg !494
  br label %for.body3.i167.i, !dbg !495

for.body3.i167.i:                                 ; preds = %for.body3.i167.i, %for.cond1.preheader.i164.i
  %indvars.iv.i168.i = phi i64 [ 0, %for.cond1.preheader.i164.i ], [ %indvars.iv.next.i176.i.1, %for.body3.i167.i ]
  %init.187.i169.i = phi i32 [ %init.089.i166.i, %for.cond1.preheader.i164.i ], [ %100, %for.body3.i167.i ]
  call void @llvm.dbg.value(metadata double poison, metadata !124, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i168.i, metadata !166, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata i32 %init.187.i169.i, metadata !165, metadata !DIExpression()), !dbg !494
  %96 = mul nuw nsw i32 %init.187.i169.i, 3125
  %97 = and i32 %96, 65535
  call void @llvm.dbg.value(metadata i32 %96, metadata !165, metadata !DIExpression(DW_OP_constu, 65535, DW_OP_and, DW_OP_stack_value)), !dbg !494
  %addconv.i170.i = add nsw i32 %97, -32768, !dbg !496
  %sub.i171.i = sitofp i32 %addconv.i170.i to double, !dbg !496
  %div.i172.i = fmul double %sub.i171.i, 0x3F10000000000000, !dbg !497
  %98 = add nuw nsw i64 %indvars.iv.i168.i, %95, !dbg !498
  %arrayidx.i173.i = getelementptr inbounds double, ptr %0, i64 %98, !dbg !499
  store double %div.i172.i, ptr %arrayidx.i173.i, align 8, !dbg !500, !tbaa !181
  %indvars.iv.next.i176.i = or i64 %indvars.iv.i168.i, 1, !dbg !501
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i176.i, metadata !166, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata double poison, metadata !124, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i176.i, metadata !166, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata i32 %96, metadata !165, metadata !DIExpression(DW_OP_constu, 65535, DW_OP_and, DW_OP_stack_value)), !dbg !494
  %99 = mul nsw i32 %init.187.i169.i, 761
  %100 = and i32 %99, 65535
  call void @llvm.dbg.value(metadata i32 %100, metadata !165, metadata !DIExpression()), !dbg !494
  %addconv.i170.i.1 = add nsw i32 %100, -32768, !dbg !496
  %sub.i171.i.1 = sitofp i32 %addconv.i170.i.1 to double, !dbg !496
  %div.i172.i.1 = fmul double %sub.i171.i.1, 0x3F10000000000000, !dbg !497
  %101 = add nuw nsw i64 %indvars.iv.next.i176.i, %95, !dbg !498
  %arrayidx.i173.i.1 = getelementptr inbounds double, ptr %0, i64 %101, !dbg !499
  store double %div.i172.i.1, ptr %arrayidx.i173.i.1, align 8, !dbg !500, !tbaa !181
  %indvars.iv.next.i176.i.1 = add nuw nsw i64 %indvars.iv.i168.i, 2, !dbg !501
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i176.i.1, metadata !166, metadata !DIExpression()), !dbg !494
  %exitcond.not.i177.i.1 = icmp eq i64 %indvars.iv.next.i176.i.1, 100, !dbg !502
  br i1 %exitcond.not.i177.i.1, label %for.inc17.i178.i, label %for.body3.i167.i, !dbg !495, !llvm.loop !503

for.inc17.i178.i:                                 ; preds = %for.body3.i167.i
  %.lcssa193 = phi i32 [ %100, %for.body3.i167.i ]
  %indvars.iv.next97.i179.i = add nuw nsw i64 %indvars.iv96.i165.i, 1, !dbg !505
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next97.i179.i, metadata !167, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata i32 %.lcssa193, metadata !165, metadata !DIExpression()), !dbg !494
  %exitcond100.not.i180.i = icmp eq i64 %indvars.iv.next97.i179.i, 100, !dbg !506
  br i1 %exitcond100.not.i180.i, label %for.body23.preheader.i181.i, label %for.cond1.preheader.i164.i, !dbg !490, !llvm.loop !507

for.body23.preheader.i181.i:                      ; preds = %for.inc17.i178.i
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(800) %add.ptr.i, i8 0, i64 800, i1 false), !dbg !509, !tbaa !181
  call void @llvm.dbg.value(metadata i64 poison, metadata !166, metadata !DIExpression()), !dbg !494
  br label %for.cond33.preheader.i182.i, !dbg !510

for.cond33.preheader.i182.i:                      ; preds = %for.inc49.i191.i, %for.body23.preheader.i181.i
  %indvars.iv109.i183.i = phi i64 [ 0, %for.body23.preheader.i181.i ], [ %indvars.iv.next110.i192.i, %for.inc49.i191.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv109.i183.i, metadata !167, metadata !DIExpression()), !dbg !494
  %102 = mul nuw nsw i64 %indvars.iv109.i183.i, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !166, metadata !DIExpression()), !dbg !494
  br label %vector.body99, !dbg !511

vector.body99:                                    ; preds = %vector.body99, %for.cond33.preheader.i182.i
  %index100 = phi i64 [ 0, %for.cond33.preheader.i182.i ], [ %index.next102.1, %vector.body99 ], !dbg !512
  %103 = getelementptr inbounds double, ptr %add.ptr.i, i64 %index100, !dbg !513
  %wide.load = load <2 x double>, ptr %103, align 8, !dbg !513, !tbaa !181
  %104 = add nuw nsw i64 %index100, %102, !dbg !514
  %105 = getelementptr inbounds double, ptr %0, i64 %104, !dbg !515
  %wide.load101 = load <2 x double>, ptr %105, align 8, !dbg !515, !tbaa !181
  %106 = fadd <2 x double> %wide.load, %wide.load101, !dbg !516
  store <2 x double> %106, ptr %103, align 8, !dbg !517, !tbaa !181
  %index.next102 = or i64 %index100, 2, !dbg !512
  %107 = getelementptr inbounds double, ptr %add.ptr.i, i64 %index.next102, !dbg !513
  %wide.load.1 = load <2 x double>, ptr %107, align 8, !dbg !513, !tbaa !181
  %108 = add nuw nsw i64 %index.next102, %102, !dbg !514
  %109 = getelementptr inbounds double, ptr %0, i64 %108, !dbg !515
  %wide.load101.1 = load <2 x double>, ptr %109, align 8, !dbg !515, !tbaa !181
  %110 = fadd <2 x double> %wide.load.1, %wide.load101.1, !dbg !516
  store <2 x double> %110, ptr %107, align 8, !dbg !517, !tbaa !181
  %index.next102.1 = add nuw nsw i64 %index100, 4, !dbg !512
  %111 = icmp eq i64 %index.next102.1, 100, !dbg !512
  br i1 %111, label %for.inc49.i191.i, label %vector.body99, !dbg !512, !llvm.loop !518

for.inc49.i191.i:                                 ; preds = %vector.body99
  %indvars.iv.next110.i192.i = add nuw nsw i64 %indvars.iv109.i183.i, 1, !dbg !520
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next110.i192.i, metadata !167, metadata !DIExpression()), !dbg !494
  %exitcond113.not.i193.i = icmp eq i64 %indvars.iv.next110.i192.i, 100, !dbg !521
  br i1 %exitcond113.not.i193.i, label %matgen.exit194.i, label %for.cond33.preheader.i182.i, !dbg !510, !llvm.loop !522

matgen.exit194.i:                                 ; preds = %for.inc49.i191.i
  %call.i195.i = tail call i64 @clock() #11, !dbg !524
  call void @llvm.dbg.value(metadata double %div.i197.i, metadata !125, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata ptr %0, metadata !217, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i32 200, metadata !222, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i32 100, metadata !223, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !224, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata ptr %info.i, metadata !225, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i32 0, metadata !226, metadata !DIExpression()), !dbg !526
  store i32 0, ptr %info.i, align 4, !dbg !528, !tbaa !278
  call void @llvm.dbg.value(metadata i32 99, metadata !232, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i32 0, metadata !229, metadata !DIExpression()), !dbg !526
  br label %for.body102.i

for.body102.i:                                    ; preds = %for.inc189.i, %matgen.exit194.i
  %indvars.iv466.i = phi i64 [ %indvars.iv.next467.i, %for.inc189.i ], [ 0, %matgen.exit194.i ]
  %indvars.iv456.i = phi i64 [ %indvars.iv.next457.i, %for.inc189.i ], [ 1, %matgen.exit194.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv466.i, metadata !229, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i64 %indvars.iv466.i, metadata !230, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !526
  %112 = sub nuw nsw i64 99, %indvars.iv466.i, !dbg !529
  %113 = sub nuw nsw i64 99, %indvars.iv466.i, !dbg !529
  %114 = urem i64 %113, 5, !dbg !529
  %115 = add nuw nsw i64 %114, 5, !dbg !529
  %smax29.i = call i64 @llvm.smax.i64(i64 %113, i64 %115), !dbg !529
  %116 = icmp slt i64 %115, %113, !dbg !529
  %umin30.neg.i = sext i1 %116 to i64, !dbg !529
  %117 = add i64 %smax29.i, %umin30.neg.i, !dbg !529
  %118 = sub i64 %117, %115, !dbg !529
  %119 = udiv i64 %118, 5, !dbg !529
  %120 = sub nuw nsw i64 99, %indvars.iv466.i, !dbg !529
  %121 = trunc i64 %indvars.iv466.i to i32, !dbg !529
  %122 = udiv i64 %120, 5, !dbg !529
  %123 = trunc i64 %122 to i32, !dbg !529
  %.neg.i = mul i32 %123, -5, !dbg !529
  %reass.sub.i = sub i32 %.neg.i, %121, !dbg !529
  %124 = add i32 %reass.sub.i, 104, !dbg !529
  %125 = sext i32 %124 to i64, !dbg !529
  %smax.i = call i64 @llvm.smax.i64(i64 %120, i64 %125), !dbg !529
  %126 = icmp sgt i64 %120, %125, !dbg !529
  %umin.i = zext i1 %126 to i64, !dbg !529
  %127 = add nsw i64 %umin.i, %125, !dbg !529
  %128 = sub i64 %smax.i, %127, !dbg !529
  %129 = udiv i64 %128, 5, !dbg !529
  %130 = sub nuw nsw i64 99, %indvars.iv466.i, !dbg !529
  %131 = and i64 %indvars.iv466.i, 3, !dbg !529
  %132 = or i64 %indvars.iv466.i, -4, !dbg !529
  %133 = xor i64 %131, 7, !dbg !529
  %umax.i = call i64 @llvm.umax.i64(i64 %130, i64 %133), !dbg !529
  %134 = add i64 %132, %umax.i, !dbg !529
  %135 = lshr i64 %134, 2, !dbg !529
  %136 = sub nuw nsw i64 100, %indvars.iv466.i, !dbg !529
  %137 = mul nuw nsw i64 %indvars.iv466.i, 201, !dbg !535
  %arrayidx108.i = getelementptr inbounds double, ptr %0, i64 %137, !dbg !536
  call void @llvm.dbg.value(metadata i64 %136, metadata !244, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata ptr %arrayidx108.i, metadata !249, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata i32 1, metadata !250, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata double poison, metadata !251, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata i32 1, metadata !252, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata i32 0, metadata !254, metadata !DIExpression()), !dbg !537
  %138 = load double, ptr %arrayidx108.i, align 8, !dbg !539, !tbaa !181
  %139 = call double @llvm.fabs.f64(double %138), !dbg !540
  call void @llvm.dbg.value(metadata double %139, metadata !251, metadata !DIExpression()), !dbg !537
  br label %for.body17.i405.i, !dbg !541

for.body17.i405.i:                                ; preds = %for.body17.i405.i, %for.body102.i
  %indvars.iv.i406.i = phi i64 [ 1, %for.body102.i ], [ %indvars.iv.next.i413.i, %for.body17.i405.i ]
  %itemp.257.i407.i = phi i32 [ 0, %for.body102.i ], [ %itemp.3.i412.i, %for.body17.i405.i ]
  %dmax.255.i408.i = phi double [ %139, %for.body102.i ], [ %dmax.3.i411.i, %for.body17.i405.i ]
  call void @llvm.dbg.value(metadata i32 %itemp.257.i407.i, metadata !254, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i406.i, metadata !252, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata double %dmax.255.i408.i, metadata !251, metadata !DIExpression()), !dbg !537
  %arrayidx19.i409.i = getelementptr inbounds double, ptr %arrayidx108.i, i64 %indvars.iv.i406.i, !dbg !542
  %140 = load double, ptr %arrayidx19.i409.i, align 8, !dbg !542, !tbaa !181
  %141 = call double @llvm.fabs.f64(double %140), !dbg !543
  %cmp20.i410.i = fcmp ogt double %141, %dmax.255.i408.i, !dbg !544
  %dmax.3.i411.i = select i1 %cmp20.i410.i, double %141, double %dmax.255.i408.i, !dbg !545
  %142 = trunc i64 %indvars.iv.i406.i to i32, !dbg !545
  %itemp.3.i412.i = select i1 %cmp20.i410.i, i32 %142, i32 %itemp.257.i407.i, !dbg !545
  call void @llvm.dbg.value(metadata i32 %itemp.3.i412.i, metadata !254, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata double %dmax.3.i411.i, metadata !251, metadata !DIExpression()), !dbg !537
  %indvars.iv.next.i413.i = add nuw nsw i64 %indvars.iv.i406.i, 1, !dbg !546
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i413.i, metadata !252, metadata !DIExpression()), !dbg !537
  %exitcond.not.i414.i = icmp eq i64 %indvars.iv.next.i413.i, %136, !dbg !547
  br i1 %exitcond.not.i414.i, label %idamax.exit416.i, label %for.body17.i405.i, !dbg !541, !llvm.loop !548

idamax.exit416.i:                                 ; preds = %for.body17.i405.i
  %itemp.3.i412.i.lcssa = phi i32 [ %itemp.3.i412.i, %for.body17.i405.i ], !dbg !545
  %143 = urem i64 %112, 5, !dbg !529
  %144 = select i1 %116, i64 2, i64 1, !dbg !529
  %145 = add nuw nsw i64 %144, %119, !dbg !529
  %146 = add nuw nsw i64 %129, %umin.i, !dbg !529
  %147 = add nuw nsw i64 %135, 1, !dbg !529
  %indvars.iv.next467.i = add nuw nsw i64 %indvars.iv466.i, 1, !dbg !550
  %148 = mul nuw nsw i64 %indvars.iv466.i, 200, !dbg !551
  %149 = trunc i64 %indvars.iv466.i to i32, !dbg !552
  %add110.i = add nsw i32 %itemp.3.i412.i.lcssa, %149, !dbg !552
  call void @llvm.dbg.value(metadata i32 %add110.i, metadata !231, metadata !DIExpression()), !dbg !526
  %arrayidx112.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv466.i, !dbg !553
  store i32 %add110.i, ptr %arrayidx112.i, align 4, !dbg !554, !tbaa !278
  %150 = sext i32 %add110.i to i64, !dbg !555
  %151 = add nsw i64 %148, %150, !dbg !555
  %arrayidx116.i = getelementptr inbounds double, ptr %0, i64 %151, !dbg !557
  %152 = load double, ptr %arrayidx116.i, align 8, !dbg !557, !tbaa !181
  %cmp117.i = fcmp une double %152, 0.000000e+00, !dbg !558
  br i1 %cmp117.i, label %if.then118.i, label %if.else187.i, !dbg !559

if.then118.i:                                     ; preds = %idamax.exit416.i
  %cmp119.not.i = icmp eq i32 %itemp.3.i412.i.lcssa, 0, !dbg !560
  br i1 %cmp119.not.i, label %if.end137.i, label %if.then120.i, !dbg !563

if.then120.i:                                     ; preds = %if.then118.i
  call void @llvm.dbg.value(metadata double %152, metadata !227, metadata !DIExpression()), !dbg !526
  store double %138, ptr %arrayidx116.i, align 8, !dbg !564, !tbaa !181
  store double %152, ptr %arrayidx108.i, align 8, !dbg !566, !tbaa !181
  br label %if.end137.i, !dbg !567

if.end137.i:                                      ; preds = %if.then120.i, %if.then118.i
  %153 = phi double [ %152, %if.then120.i ], [ %138, %if.then118.i ], !dbg !568
  %div142.i = fdiv double -1.000000e+00, %153, !dbg !569
  call void @llvm.dbg.value(metadata double %div142.i, metadata !227, metadata !DIExpression()), !dbg !526
  %154 = sub nuw nsw i64 99, %indvars.iv466.i, !dbg !570
  %155 = add nuw nsw i64 %137, 1, !dbg !571
  %arrayidx149.i = getelementptr inbounds double, ptr %0, i64 %155, !dbg !572
  call void @llvm.dbg.value(metadata i64 %154, metadata !573, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.value(metadata double %div142.i, metadata !576, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.value(metadata ptr %arrayidx149.i, metadata !577, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.value(metadata i32 1, metadata !578, metadata !DIExpression()), !dbg !582
  %rem.i.lhs.trunc.i = trunc i64 %154 to i8
  %rem.i476.i = urem i8 %rem.i.lhs.trunc.i, 5
  call void @llvm.dbg.value(metadata i8 %rem.i476.i, metadata !580, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !582
  %cmp8.not.i.i = icmp eq i8 %rem.i476.i, 0, !dbg !584
  br i1 %cmp8.not.i.i, label %for.body26.preheader.i.i, label %for.body12.preheader.i.i, !dbg !586

for.body12.preheader.i.i:                         ; preds = %if.end137.i
  %wide.trip.count.i418.i = zext i8 %rem.i476.i to i64, !dbg !587
  %min.iters.check49.i = icmp ult i64 %143, 4, !dbg !591
  br i1 %min.iters.check49.i, label %for.body12.i.preheader.i, label %vector.ph50.i, !dbg !591

vector.ph50.i:                                    ; preds = %for.body12.preheader.i.i
  %n.vec52.i = and i64 %143, 4, !dbg !591
  %broadcast.splatinsert59.i = insertelement <2 x double> poison, double %div142.i, i64 0, !dbg !591
  %broadcast.splat60.i = shufflevector <2 x double> %broadcast.splatinsert59.i, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !591
  %broadcast.splatinsert61.i = insertelement <2 x double> poison, double %div142.i, i64 0, !dbg !591
  %broadcast.splat62.i = shufflevector <2 x double> %broadcast.splatinsert61.i, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !591
  br label %vector.body55.i, !dbg !591

vector.body55.i:                                  ; preds = %vector.body55.i, %vector.ph50.i
  %index56.i = phi i64 [ 0, %vector.ph50.i ], [ %index.next63.i, %vector.body55.i ], !dbg !592
  %156 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %index56.i, !dbg !593
  %wide.load57.i = load <2 x double>, ptr %156, align 8, !dbg !593, !tbaa !181
  %157 = getelementptr inbounds double, ptr %156, i64 2, !dbg !593
  %wide.load58.i = load <2 x double>, ptr %157, align 8, !dbg !593, !tbaa !181
  %158 = fmul <2 x double> %broadcast.splat60.i, %wide.load57.i, !dbg !594
  %159 = fmul <2 x double> %broadcast.splat62.i, %wide.load58.i, !dbg !594
  store <2 x double> %158, ptr %156, align 8, !dbg !595, !tbaa !181
  store <2 x double> %159, ptr %157, align 8, !dbg !595, !tbaa !181
  %index.next63.i = add nuw i64 %index56.i, 4, !dbg !592
  %160 = icmp eq i64 %index.next63.i, %n.vec52.i, !dbg !592
  br i1 %160, label %middle.block47.i, label %vector.body55.i, !dbg !592, !llvm.loop !596

middle.block47.i:                                 ; preds = %vector.body55.i
  %cmp.n54.i = icmp eq i64 %143, %n.vec52.i, !dbg !591
  br i1 %cmp.n54.i, label %for.end19.i.i, label %for.body12.i.preheader.i, !dbg !591

for.body12.i.preheader.i:                         ; preds = %middle.block47.i, %for.body12.preheader.i.i
  %indvars.iv.i419.ph.i = phi i64 [ 0, %for.body12.preheader.i.i ], [ %n.vec52.i, %middle.block47.i ]
  br label %for.body12.i.i, !dbg !591

for.body12.i.i:                                   ; preds = %for.body12.i.i, %for.body12.i.preheader.i
  %indvars.iv.i419.i = phi i64 [ %indvars.iv.next.i420.i, %for.body12.i.i ], [ %indvars.iv.i419.ph.i, %for.body12.i.preheader.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i419.i, metadata !579, metadata !DIExpression()), !dbg !582
  %arrayidx14.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv.i419.i, !dbg !593
  %161 = load double, ptr %arrayidx14.i.i, align 8, !dbg !593, !tbaa !181
  %mul15.i.i = fmul double %div142.i, %161, !dbg !594
  store double %mul15.i.i, ptr %arrayidx14.i.i, align 8, !dbg !595, !tbaa !181
  %indvars.iv.next.i420.i = add nuw nsw i64 %indvars.iv.i419.i, 1, !dbg !592
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i420.i, metadata !579, metadata !DIExpression()), !dbg !582
  %exitcond.not.i421.i = icmp eq i64 %indvars.iv.next.i420.i, %wide.trip.count.i418.i, !dbg !587
  br i1 %exitcond.not.i421.i, label %for.end19.i.i, label %for.body12.i.i, !dbg !591, !llvm.loop !598

for.end19.i.i:                                    ; preds = %for.body12.i.i, %middle.block47.i
  %cmp20.i422.i = icmp ult i64 %indvars.iv466.i, 95, !dbg !599
  %162 = zext i8 %rem.i476.i to i64
  %cmp25112.i.i = icmp sgt i64 %154, %162
  %or.cond.i423.i = and i1 %cmp20.i422.i, %cmp25112.i.i, !dbg !601
  call void @llvm.dbg.value(metadata i64 %162, metadata !579, metadata !DIExpression()), !dbg !582
  br i1 %or.cond.i423.i, label %for.body26.preheader.i.i, label %for.body152.lr.ph.i, !dbg !601

for.body26.preheader.i.i:                         ; preds = %for.end19.i.i, %if.end137.i
  %.pre-phi.i = phi i64 [ %wide.trip.count.i418.i, %for.end19.i.i ], [ 0, %if.end137.i ], !dbg !602
  %min.iters.check33.i = icmp ult i64 %145, 14, !dbg !602
  br i1 %min.iters.check33.i, label %for.body26.i.preheader.i188, label %vector.scevcheck.i, !dbg !602

vector.scevcheck.i:                               ; preds = %for.body26.preheader.i.i
  %163 = trunc i64 %146 to i32, !dbg !602
  %mul.i = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %163, i32 5), !dbg !602
  %mul.result.i = extractvalue { i32, i1 } %mul.i, 0, !dbg !602
  %mul.overflow.i = extractvalue { i32, i1 } %mul.i, 1, !dbg !602
  %164 = add i32 %124, %mul.result.i, !dbg !602
  %165 = icmp slt i32 %164, %124, !dbg !602
  %166 = or i1 %165, %mul.overflow.i, !dbg !602
  %167 = icmp ugt i64 %146, 4294967295, !dbg !602
  %168 = or i1 %166, %167, !dbg !602
  br i1 %168, label %for.body26.i.preheader.i188, label %vector.ph34.i

vector.ph34.i:                                    ; preds = %vector.scevcheck.i
  %n.vec36.i = and i64 %145, 9223372036854775806, !dbg !602
  %169 = mul i64 %n.vec36.i, 5, !dbg !602
  %broadcast.splatinsert43.i = insertelement <2 x double> poison, double %div142.i, i64 0, !dbg !602
  %broadcast.splat44.i = shufflevector <2 x double> %broadcast.splatinsert43.i, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !602
  br label %vector.body40.i, !dbg !602

vector.body40.i:                                  ; preds = %vector.body40.i, %vector.ph34.i
  %index41.i = phi i64 [ 0, %vector.ph34.i ], [ %index.next46.i, %vector.body40.i ]
  %170 = mul i64 %index41.i, 5, !dbg !602
  %offset.idx42.i = add i64 %.pre-phi.i, %170, !dbg !602
  %171 = add i64 %offset.idx42.i, 5, !dbg !602
  %172 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %offset.idx42.i, !dbg !604
  %173 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %171, !dbg !604
  %174 = load double, ptr %172, align 8, !dbg !604, !tbaa !181
  %175 = load double, ptr %173, align 8, !dbg !604, !tbaa !181
  %176 = insertelement <2 x double> poison, double %174, i64 0, !dbg !602
  %177 = insertelement <2 x double> %176, double %175, i64 1, !dbg !602
  %178 = fmul <2 x double> %broadcast.splat44.i, %177, !dbg !602
  %179 = add nuw nsw i64 %offset.idx42.i, 1, !dbg !607
  %180 = add i64 %offset.idx42.i, 6, !dbg !607
  %181 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %179, !dbg !608
  %182 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %180, !dbg !608
  %183 = load double, ptr %181, align 8, !dbg !608, !tbaa !181
  %184 = load double, ptr %182, align 8, !dbg !608, !tbaa !181
  %185 = insertelement <2 x double> poison, double %183, i64 0, !dbg !602
  %186 = insertelement <2 x double> %185, double %184, i64 1, !dbg !602
  %187 = fmul <2 x double> %broadcast.splat44.i, %186, !dbg !602
  %188 = add nuw nsw i64 %offset.idx42.i, 2, !dbg !609
  %189 = add i64 %offset.idx42.i, 7, !dbg !609
  %190 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %188, !dbg !610
  %191 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %189, !dbg !610
  %192 = load double, ptr %190, align 8, !dbg !610, !tbaa !181
  %193 = load double, ptr %191, align 8, !dbg !610, !tbaa !181
  %194 = insertelement <2 x double> poison, double %192, i64 0, !dbg !602
  %195 = insertelement <2 x double> %194, double %193, i64 1, !dbg !602
  %196 = fmul <2 x double> %broadcast.splat44.i, %195, !dbg !602
  %197 = add nuw nsw i64 %offset.idx42.i, 3, !dbg !611
  %198 = add i64 %offset.idx42.i, 8, !dbg !611
  %199 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %197, !dbg !612
  %200 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %198, !dbg !612
  %201 = load double, ptr %199, align 8, !dbg !612, !tbaa !181
  %202 = load double, ptr %200, align 8, !dbg !612, !tbaa !181
  %203 = insertelement <2 x double> poison, double %201, i64 0, !dbg !602
  %204 = insertelement <2 x double> %203, double %202, i64 1, !dbg !602
  %205 = fmul <2 x double> %broadcast.splat44.i, %204, !dbg !602
  %206 = add nuw nsw i64 %offset.idx42.i, 4, !dbg !613
  %207 = add i64 %offset.idx42.i, 9, !dbg !613
  %208 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %206, !dbg !614
  %209 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %207, !dbg !614
  %210 = load double, ptr %208, align 8, !dbg !614, !tbaa !181
  %211 = load double, ptr %209, align 8, !dbg !614, !tbaa !181
  %212 = insertelement <2 x double> poison, double %210, i64 0, !dbg !602
  %213 = insertelement <2 x double> %212, double %211, i64 1, !dbg !602
  %214 = fmul <2 x double> %broadcast.splat44.i, %213, !dbg !602
  %215 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %offset.idx42.i, !dbg !614
  %216 = shufflevector <2 x double> %178, <2 x double> %187, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !615
  %217 = shufflevector <2 x double> %196, <2 x double> %205, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !615
  %218 = shufflevector <4 x double> %216, <4 x double> %217, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, !dbg !615
  %219 = shufflevector <2 x double> %214, <2 x double> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !615
  %interleaved.vec45.i = shufflevector <8 x double> %218, <8 x double> %219, <10 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 1, i32 3, i32 5, i32 7, i32 9>, !dbg !615
  store <10 x double> %interleaved.vec45.i, ptr %215, align 8, !dbg !615, !tbaa !181
  %index.next46.i = add nuw i64 %index41.i, 2
  %220 = icmp eq i64 %index.next46.i, %n.vec36.i
  br i1 %220, label %middle.block31.i, label %vector.body40.i, !llvm.loop !616

middle.block31.i:                                 ; preds = %vector.body40.i
  %ind.end37.i = add i64 %.pre-phi.i, %169, !dbg !602
  %cmp.n39.i = icmp eq i64 %145, %n.vec36.i, !dbg !602
  br i1 %cmp.n39.i, label %for.body152.lr.ph.i, label %for.body26.i.preheader.i188, !dbg !602

for.body26.i.preheader.i188:                      ; preds = %middle.block31.i, %vector.scevcheck.i, %for.body26.preheader.i.i
  %indvars.iv115.i.ph.i = phi i64 [ %.pre-phi.i, %vector.scevcheck.i ], [ %.pre-phi.i, %for.body26.preheader.i.i ], [ %ind.end37.i, %middle.block31.i ]
  %221 = insertelement <2 x double> poison, double %div142.i, i64 0
  %222 = shufflevector <2 x double> %221, <2 x double> poison, <2 x i32> zeroinitializer
  br label %for.body26.i.i189, !dbg !602

for.body26.i.i189:                                ; preds = %for.body26.i.i189, %for.body26.i.preheader.i188
  %indvars.iv115.i.i = phi i64 [ %indvars.iv.next116.i.i, %for.body26.i.i189 ], [ %indvars.iv115.i.ph.i, %for.body26.i.preheader.i188 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv115.i.i, metadata !579, metadata !DIExpression()), !dbg !582
  %arrayidx28.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv115.i.i, !dbg !604
  %223 = load <2 x double>, ptr %arrayidx28.i.i, align 8, !dbg !604, !tbaa !181
  %224 = fmul <2 x double> %222, %223, !dbg !618
  store <2 x double> %224, ptr %arrayidx28.i.i, align 8, !dbg !619, !tbaa !181
  %225 = add nuw nsw i64 %indvars.iv115.i.i, 2, !dbg !609
  %arrayidx41.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %225, !dbg !610
  %226 = load <2 x double>, ptr %arrayidx41.i.i, align 8, !dbg !610, !tbaa !181
  %227 = fmul <2 x double> %222, %226, !dbg !620
  store <2 x double> %227, ptr %arrayidx41.i.i, align 8, !dbg !621, !tbaa !181
  %228 = add nuw nsw i64 %indvars.iv115.i.i, 4, !dbg !613
  %arrayidx55.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %228, !dbg !614
  %229 = load double, ptr %arrayidx55.i.i, align 8, !dbg !614, !tbaa !181
  %mul56.i.i = fmul double %div142.i, %229, !dbg !622
  store double %mul56.i.i, ptr %arrayidx55.i.i, align 8, !dbg !615, !tbaa !181
  %indvars.iv.next116.i.i = add nuw nsw i64 %indvars.iv115.i.i, 5, !dbg !623
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next116.i.i, metadata !579, metadata !DIExpression()), !dbg !582
  %sext.i = shl i64 %indvars.iv.next116.i.i, 32, !dbg !624
  %230 = ashr exact i64 %sext.i, 32, !dbg !624
  %cmp25.i.i = icmp sgt i64 %154, %230, !dbg !624
  br i1 %cmp25.i.i, label %for.body26.i.i189, label %for.body152.lr.ph.i, !dbg !602, !llvm.loop !625

for.body152.lr.ph.i:                              ; preds = %for.body26.i.i189, %middle.block31.i, %for.end19.i.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next467.i, metadata !228, metadata !DIExpression()), !dbg !526
  %rem.i427477.i = and i64 %154, 3
  %cmp27.not.i.i = icmp eq i64 %rem.i427477.i, 0
  %wide.trip.count.i428.i = and i64 %154, 3
  %cmp47152.i.i = icmp ult i64 %indvars.iv466.i, 96
  %cmp47152.old.i.i = icmp ult i64 %indvars.iv466.i, 96
  %exitcond.not.i432.i = icmp eq i64 %wide.trip.count.i428.i, 1
  %arrayidx35.i.1.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 1
  %exitcond.not.i432.1.i = icmp eq i64 %wide.trip.count.i428.i, 2
  %arrayidx35.i.2.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 2
  %min.iters.check18.i = icmp ult i64 %134, 4
  %n.vec21.i = and i64 %147, 9223372036854775806
  %231 = shl i64 %n.vec21.i, 2
  %ind.end.i = or i64 %wide.trip.count.i428.i, %231
  %cmp.n23.i = icmp eq i64 %147, %n.vec21.i
  br label %for.body152.i, !dbg !626

for.body152.i:                                    ; preds = %daxpy_ur.exit.i, %for.body152.lr.ph.i
  %indvars.iv458.i = phi i64 [ %indvars.iv456.i, %for.body152.lr.ph.i ], [ %indvars.iv.next459.i, %daxpy_ur.exit.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv458.i, metadata !228, metadata !DIExpression()), !dbg !526
  %232 = mul nuw nsw i64 %indvars.iv458.i, 200, !dbg !628
  %233 = add nsw i64 %232, %150, !dbg !631
  %arrayidx156.i = getelementptr inbounds double, ptr %0, i64 %233, !dbg !632
  %234 = load double, ptr %arrayidx156.i, align 8, !dbg !632, !tbaa !181
  call void @llvm.dbg.value(metadata double %234, metadata !227, metadata !DIExpression()), !dbg !526
  br i1 %cmp119.not.i, label %if.end171.i, label %if.then158.i, !dbg !633

if.then158.i:                                     ; preds = %for.body152.i
  %235 = add nuw nsw i64 %232, %indvars.iv466.i, !dbg !634
  %arrayidx162.i = getelementptr inbounds double, ptr %0, i64 %235, !dbg !637
  %236 = load double, ptr %arrayidx162.i, align 8, !dbg !637, !tbaa !181
  store double %236, ptr %arrayidx156.i, align 8, !dbg !638, !tbaa !181
  store double %234, ptr %arrayidx162.i, align 8, !dbg !639, !tbaa !181
  br label %if.end171.i, !dbg !640

if.end171.i:                                      ; preds = %if.then158.i, %for.body152.i
  %237 = add nuw nsw i64 %indvars.iv.next467.i, %232, !dbg !641
  %arrayidx183.i = getelementptr inbounds double, ptr %0, i64 %237, !dbg !642
  call void @llvm.dbg.value(metadata i64 %154, metadata !643, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.value(metadata double %234, metadata !646, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.value(metadata ptr %arrayidx149.i, metadata !647, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.value(metadata i32 1, metadata !648, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.value(metadata ptr %arrayidx183.i, metadata !649, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.value(metadata i32 1, metadata !650, metadata !DIExpression()), !dbg !655
  %cmp1.i425.i = fcmp oeq double %234, 0.000000e+00
  br i1 %cmp1.i425.i, label %daxpy_ur.exit.i, label %if.end26.i.i, !dbg !657

if.end26.i.i:                                     ; preds = %if.end171.i
  call void @llvm.dbg.value(metadata i64 %154, metadata !654, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !655
  br i1 %cmp27.not.i.i, label %if.end45.i.i, label %for.body31.i.i, !dbg !658

for.body31.i.i:                                   ; preds = %if.end26.i.i
  call void @llvm.dbg.value(metadata i64 0, metadata !651, metadata !DIExpression()), !dbg !655
  %238 = load double, ptr %arrayidx183.i, align 8, !dbg !659, !tbaa !181
  %239 = load double, ptr %arrayidx149.i, align 8, !dbg !664, !tbaa !181
  %240 = call double @llvm.fmuladd.f64(double %234, double %239, double %238), !dbg !665
  store double %240, ptr %arrayidx183.i, align 8, !dbg !666, !tbaa !181
  call void @llvm.dbg.value(metadata i64 1, metadata !651, metadata !DIExpression()), !dbg !655
  br i1 %exitcond.not.i432.i, label %for.end41.i.i, label %for.body31.i.1.i, !dbg !667, !llvm.loop !668

for.body31.i.1.i:                                 ; preds = %for.body31.i.i
  call void @llvm.dbg.value(metadata i64 1, metadata !651, metadata !DIExpression()), !dbg !655
  %arrayidx33.i430.1.i = getelementptr inbounds double, ptr %arrayidx183.i, i64 1, !dbg !659
  %241 = load double, ptr %arrayidx33.i430.1.i, align 8, !dbg !659, !tbaa !181
  %242 = load double, ptr %arrayidx35.i.1.i, align 8, !dbg !664, !tbaa !181
  %243 = call double @llvm.fmuladd.f64(double %234, double %242, double %241), !dbg !665
  store double %243, ptr %arrayidx33.i430.1.i, align 8, !dbg !666, !tbaa !181
  call void @llvm.dbg.value(metadata i64 2, metadata !651, metadata !DIExpression()), !dbg !655
  br i1 %exitcond.not.i432.1.i, label %for.end41.i.i, label %for.body31.i.2.i, !dbg !667, !llvm.loop !670

for.body31.i.2.i:                                 ; preds = %for.body31.i.1.i
  call void @llvm.dbg.value(metadata i64 2, metadata !651, metadata !DIExpression()), !dbg !655
  %arrayidx33.i430.2.i = getelementptr inbounds double, ptr %arrayidx183.i, i64 2, !dbg !659
  %244 = load double, ptr %arrayidx33.i430.2.i, align 8, !dbg !659, !tbaa !181
  %245 = load double, ptr %arrayidx35.i.2.i, align 8, !dbg !664, !tbaa !181
  %246 = call double @llvm.fmuladd.f64(double %234, double %245, double %244), !dbg !665
  store double %246, ptr %arrayidx33.i430.2.i, align 8, !dbg !666, !tbaa !181
  call void @llvm.dbg.value(metadata i64 3, metadata !651, metadata !DIExpression()), !dbg !655
  br label %for.end41.i.i

for.end41.i.i:                                    ; preds = %for.body31.i.2.i, %for.body31.i.1.i, %for.body31.i.i
  call void @llvm.dbg.value(metadata i64 %154, metadata !651, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !655
  br i1 %cmp47152.i.i, label %for.body48.preheader.i.i, label %daxpy_ur.exit.i, !dbg !671

if.end45.i.i:                                     ; preds = %if.end26.i.i
  call void @llvm.dbg.value(metadata i64 %154, metadata !651, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !655
  br i1 %cmp47152.old.i.i, label %for.body48.preheader.i.i, label %daxpy_ur.exit.i, !dbg !672

for.body48.preheader.i.i:                         ; preds = %if.end45.i.i, %for.end41.i.i
  br i1 %min.iters.check18.i, label %for.body48.i.preheader.i, label %vector.ph19.i, !dbg !672

vector.ph19.i:                                    ; preds = %for.body48.preheader.i.i
  %broadcast.splatinsert26.i = insertelement <2 x double> poison, double %234, i64 0, !dbg !672
  %broadcast.splat27.i = shufflevector <2 x double> %broadcast.splatinsert26.i, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !672
  br label %vector.body24.i, !dbg !672

vector.body24.i:                                  ; preds = %vector.body24.i, %vector.ph19.i
  %index25.i = phi i64 [ 0, %vector.ph19.i ], [ %index.next28.i, %vector.body24.i ]
  %247 = shl i64 %index25.i, 2, !dbg !672
  %offset.idx.i = or i64 %wide.trip.count.i428.i, %247, !dbg !672
  %248 = or i64 %offset.idx.i, 4, !dbg !672
  %249 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %offset.idx.i, !dbg !674
  %250 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %248, !dbg !674
  %251 = load double, ptr %249, align 8, !dbg !674, !tbaa !181
  %252 = load double, ptr %250, align 8, !dbg !674, !tbaa !181
  %253 = insertelement <2 x double> poison, double %251, i64 0, !dbg !677
  %254 = insertelement <2 x double> %253, double %252, i64 1, !dbg !677
  %255 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %offset.idx.i, !dbg !677
  %256 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %248, !dbg !677
  %257 = load double, ptr %255, align 8, !dbg !677, !tbaa !181
  %258 = load double, ptr %256, align 8, !dbg !677, !tbaa !181
  %259 = insertelement <2 x double> poison, double %257, i64 0, !dbg !672
  %260 = insertelement <2 x double> %259, double %258, i64 1, !dbg !672
  %261 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat27.i, <2 x double> %260, <2 x double> %254), !dbg !672
  %262 = add nuw nsw i64 %offset.idx.i, 1, !dbg !678
  %263 = add i64 %offset.idx.i, 5, !dbg !678
  %264 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %262, !dbg !679
  %265 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %263, !dbg !679
  %266 = load double, ptr %264, align 8, !dbg !679, !tbaa !181
  %267 = load double, ptr %265, align 8, !dbg !679, !tbaa !181
  %268 = insertelement <2 x double> poison, double %266, i64 0, !dbg !680
  %269 = insertelement <2 x double> %268, double %267, i64 1, !dbg !680
  %270 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %262, !dbg !680
  %271 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %263, !dbg !680
  %272 = load double, ptr %270, align 8, !dbg !680, !tbaa !181
  %273 = load double, ptr %271, align 8, !dbg !680, !tbaa !181
  %274 = insertelement <2 x double> poison, double %272, i64 0, !dbg !672
  %275 = insertelement <2 x double> %274, double %273, i64 1, !dbg !672
  %276 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat27.i, <2 x double> %275, <2 x double> %269), !dbg !672
  %277 = add nuw nsw i64 %offset.idx.i, 2, !dbg !681
  %278 = add i64 %offset.idx.i, 6, !dbg !681
  %279 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %277, !dbg !682
  %280 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %278, !dbg !682
  %281 = load double, ptr %279, align 8, !dbg !682, !tbaa !181
  %282 = load double, ptr %280, align 8, !dbg !682, !tbaa !181
  %283 = insertelement <2 x double> poison, double %281, i64 0, !dbg !683
  %284 = insertelement <2 x double> %283, double %282, i64 1, !dbg !683
  %285 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %277, !dbg !683
  %286 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %278, !dbg !683
  %287 = load double, ptr %285, align 8, !dbg !683, !tbaa !181
  %288 = load double, ptr %286, align 8, !dbg !683, !tbaa !181
  %289 = insertelement <2 x double> poison, double %287, i64 0, !dbg !672
  %290 = insertelement <2 x double> %289, double %288, i64 1, !dbg !672
  %291 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat27.i, <2 x double> %290, <2 x double> %284), !dbg !672
  %292 = add nuw nsw i64 %offset.idx.i, 3, !dbg !684
  %293 = add i64 %offset.idx.i, 7, !dbg !684
  %294 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %292, !dbg !685
  %295 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %293, !dbg !685
  %296 = load double, ptr %294, align 8, !dbg !685, !tbaa !181
  %297 = load double, ptr %295, align 8, !dbg !685, !tbaa !181
  %298 = insertelement <2 x double> poison, double %296, i64 0, !dbg !686
  %299 = insertelement <2 x double> %298, double %297, i64 1, !dbg !686
  %300 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %292, !dbg !686
  %301 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %293, !dbg !686
  %302 = load double, ptr %300, align 8, !dbg !686, !tbaa !181
  %303 = load double, ptr %301, align 8, !dbg !686, !tbaa !181
  %304 = insertelement <2 x double> poison, double %302, i64 0, !dbg !672
  %305 = insertelement <2 x double> %304, double %303, i64 1, !dbg !672
  %306 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat27.i, <2 x double> %305, <2 x double> %299), !dbg !672
  %307 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %offset.idx.i, !dbg !685
  %308 = shufflevector <2 x double> %261, <2 x double> %276, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !687
  %309 = shufflevector <2 x double> %291, <2 x double> %306, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !687
  %interleaved.vec.i = shufflevector <4 x double> %308, <4 x double> %309, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>, !dbg !687
  store <8 x double> %interleaved.vec.i, ptr %307, align 8, !dbg !687, !tbaa !181
  %index.next28.i = add nuw i64 %index25.i, 2
  %310 = icmp eq i64 %index.next28.i, %n.vec21.i
  br i1 %310, label %middle.block16.i, label %vector.body24.i, !llvm.loop !688

middle.block16.i:                                 ; preds = %vector.body24.i
  br i1 %cmp.n23.i, label %daxpy_ur.exit.i, label %for.body48.i.preheader.i, !dbg !672

for.body48.i.preheader.i:                         ; preds = %middle.block16.i, %for.body48.preheader.i.i
  %indvars.iv156.i.ph.i = phi i64 [ %wide.trip.count.i428.i, %for.body48.preheader.i.i ], [ %ind.end.i, %middle.block16.i ]
  br label %for.body48.i.i, !dbg !672

for.body48.i.i:                                   ; preds = %for.body48.i.i, %for.body48.i.preheader.i
  %indvars.iv156.i.i = phi i64 [ %indvars.iv.next157.i.i, %for.body48.i.i ], [ %indvars.iv156.i.ph.i, %for.body48.i.preheader.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv156.i.i, metadata !651, metadata !DIExpression()), !dbg !655
  %arrayidx50.i.i = getelementptr inbounds double, ptr %arrayidx183.i, i64 %indvars.iv156.i.i, !dbg !674
  %311 = load double, ptr %arrayidx50.i.i, align 8, !dbg !674, !tbaa !181
  %arrayidx52.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv156.i.i, !dbg !677
  %312 = load double, ptr %arrayidx52.i.i, align 8, !dbg !677, !tbaa !181
  %313 = call double @llvm.fmuladd.f64(double %234, double %312, double %311), !dbg !690
  store double %313, ptr %arrayidx50.i.i, align 8, !dbg !691, !tbaa !181
  %314 = add nuw nsw i64 %indvars.iv156.i.i, 1, !dbg !678
  %arrayidx58.i.i = getelementptr inbounds double, ptr %arrayidx183.i, i64 %314, !dbg !679
  %315 = load double, ptr %arrayidx58.i.i, align 8, !dbg !679, !tbaa !181
  %arrayidx61.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %314, !dbg !680
  %316 = load double, ptr %arrayidx61.i.i, align 8, !dbg !680, !tbaa !181
  %317 = call double @llvm.fmuladd.f64(double %234, double %316, double %315), !dbg !692
  store double %317, ptr %arrayidx58.i.i, align 8, !dbg !693, !tbaa !181
  %318 = add nuw nsw i64 %indvars.iv156.i.i, 2, !dbg !681
  %arrayidx68.i.i = getelementptr inbounds double, ptr %arrayidx183.i, i64 %318, !dbg !682
  %319 = load double, ptr %arrayidx68.i.i, align 8, !dbg !682, !tbaa !181
  %arrayidx71.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %318, !dbg !683
  %320 = load double, ptr %arrayidx71.i.i, align 8, !dbg !683, !tbaa !181
  %321 = call double @llvm.fmuladd.f64(double %234, double %320, double %319), !dbg !694
  store double %321, ptr %arrayidx68.i.i, align 8, !dbg !695, !tbaa !181
  %322 = add nuw nsw i64 %indvars.iv156.i.i, 3, !dbg !684
  %arrayidx78.i.i = getelementptr inbounds double, ptr %arrayidx183.i, i64 %322, !dbg !685
  %323 = load double, ptr %arrayidx78.i.i, align 8, !dbg !685, !tbaa !181
  %arrayidx81.i.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %322, !dbg !686
  %324 = load double, ptr %arrayidx81.i.i, align 8, !dbg !686, !tbaa !181
  %325 = call double @llvm.fmuladd.f64(double %234, double %324, double %323), !dbg !696
  store double %325, ptr %arrayidx78.i.i, align 8, !dbg !687, !tbaa !181
  %indvars.iv.next157.i.i = add nuw nsw i64 %indvars.iv156.i.i, 4, !dbg !697
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next157.i.i, metadata !651, metadata !DIExpression()), !dbg !655
  %cmp47.i.i = icmp ult i64 %indvars.iv.next157.i.i, %154, !dbg !698
  br i1 %cmp47.i.i, label %for.body48.i.i, label %daxpy_ur.exit.i, !dbg !672, !llvm.loop !699

daxpy_ur.exit.i:                                  ; preds = %for.body48.i.i, %middle.block16.i, %if.end45.i.i, %for.end41.i.i, %if.end171.i
  %indvars.iv.next459.i = add nuw nsw i64 %indvars.iv458.i, 1, !dbg !700
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next459.i, metadata !228, metadata !DIExpression()), !dbg !526
  %exitcond465.not.i = icmp eq i64 %indvars.iv.next459.i, 100, !dbg !701
  br i1 %exitcond465.not.i, label %for.inc189.i, label %for.body152.i, !dbg !626, !llvm.loop !702

if.else187.i:                                     ; preds = %idamax.exit416.i
  store i32 %149, ptr %info.i, align 4, !dbg !704, !tbaa !278
  br label %for.inc189.i

for.inc189.i:                                     ; preds = %daxpy_ur.exit.i, %if.else187.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next467.i, metadata !229, metadata !DIExpression()), !dbg !526
  %indvars.iv.next457.i = add nuw nsw i64 %indvars.iv456.i, 1, !dbg !705
  %exitcond475.not.i = icmp eq i64 %indvars.iv.next467.i, 99, !dbg !706
  br i1 %exitcond475.not.i, label %if.end192.i, label %for.body102.i, !dbg !705, !llvm.loop !707

if.end192.i:                                      ; preds = %for.inc189.i
  %conv.i196.i = sitofp i64 %call.i195.i to double, !dbg !709
  %arrayidx196.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 99, !dbg !710
  store i32 99, ptr %arrayidx196.i, align 4, !dbg !711, !tbaa !278
  %arrayidx202.i = getelementptr inbounds double, ptr %0, i64 19899, !dbg !712
  %326 = load double, ptr %arrayidx202.i, align 8, !dbg !712, !tbaa !181
  %cmp203.i = fcmp oeq double %326, 0.000000e+00, !dbg !714
  br i1 %cmp203.i, label %if.end207.sink.split.i, label %dgefa.exit, !dbg !715

if.end207.sink.split.i:                           ; preds = %if.end192.i
  store i32 99, ptr %info.i, align 4, !dbg !528, !tbaa !278
  br label %dgefa.exit, !dbg !716

dgefa.exit:                                       ; preds = %if.end192.i, %if.end207.sink.split.i
  %call.i198.i = tail call i64 @clock() #11, !dbg !717
  %conv.i199.i = sitofp i64 %call.i198.i to double, !dbg !719
  call void @llvm.dbg.value(metadata double undef, metadata !128, metadata !DIExpression()), !dbg !137
  %call.i201.i = tail call i64 @clock() #11, !dbg !720
  call void @llvm.dbg.value(metadata double %div.i203.i, metadata !125, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata ptr %0, metadata !382, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata i32 200, metadata !387, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata i32 100, metadata !388, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !389, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !390, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata i32 0, metadata !391, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.value(metadata i32 0, metadata !392, metadata !DIExpression()), !dbg !722
  br label %for.body117.i.i

for.body117.i.i:                                  ; preds = %daxpy_ur.exit.i.i, %dgefa.exit
  %indvars.iv488.i.i = phi i64 [ %indvars.iv.next489.i.i, %daxpy_ur.exit.i.i ], [ 0, %dgefa.exit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv488.i.i, metadata !394, metadata !DIExpression()), !dbg !722
  %327 = sub nuw nsw i64 99, %indvars.iv488.i.i, !dbg !724
  %328 = and i64 %indvars.iv488.i.i, 3, !dbg !724
  %329 = or i64 %indvars.iv488.i.i, -4, !dbg !724
  %330 = xor i64 %328, 7, !dbg !724
  %umax77 = tail call i64 @llvm.umax.i64(i64 %327, i64 %330), !dbg !724
  %331 = add i64 %329, %umax77, !dbg !724
  %332 = lshr i64 %331, 2, !dbg !724
  %333 = add nuw nsw i64 %332, 1, !dbg !724
  %arrayidx119.i.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv488.i.i, !dbg !724
  %334 = load i32, ptr %arrayidx119.i.i, align 4, !dbg !724, !tbaa !278
  call void @llvm.dbg.value(metadata i32 %334, metadata !396, metadata !DIExpression()), !dbg !722
  %idxprom120.i.i = sext i32 %334 to i64, !dbg !732
  %arrayidx121.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %idxprom120.i.i, !dbg !732
  %335 = load double, ptr %arrayidx121.i.i, align 8, !dbg !732, !tbaa !181
  call void @llvm.dbg.value(metadata double %335, metadata !393, metadata !DIExpression()), !dbg !722
  %336 = zext i32 %334 to i64, !dbg !733
  %cmp122.not.i.i = icmp eq i64 %indvars.iv488.i.i, %336, !dbg !733
  br i1 %cmp122.not.i.i, label %if.end130.i.i, label %if.then123.i.i, !dbg !735

if.then123.i.i:                                   ; preds = %for.body117.i.i
  %arrayidx125.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv488.i.i, !dbg !736
  %337 = load double, ptr %arrayidx125.i.i, align 8, !dbg !736, !tbaa !181
  store double %337, ptr %arrayidx121.i.i, align 8, !dbg !738, !tbaa !181
  store double %335, ptr %arrayidx125.i.i, align 8, !dbg !739, !tbaa !181
  br label %if.end130.i.i, !dbg !740

if.end130.i.i:                                    ; preds = %if.then123.i.i, %for.body117.i.i
  %indvars.iv.next489.i.i = add nuw nsw i64 %indvars.iv488.i.i, 1, !dbg !741
  %338 = sub nuw nsw i64 99, %indvars.iv488.i.i, !dbg !742
  %339 = mul nuw nsw i64 %indvars.iv488.i.i, 201, !dbg !743
  %340 = add nuw nsw i64 %339, 1, !dbg !744
  %arrayidx137.i.i = getelementptr inbounds double, ptr %0, i64 %340, !dbg !745
  %arrayidx140.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next489.i.i, !dbg !746
  call void @llvm.dbg.value(metadata i64 %338, metadata !643, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.value(metadata double %335, metadata !646, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.value(metadata ptr %arrayidx137.i.i, metadata !647, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.value(metadata i32 1, metadata !648, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.value(metadata ptr %arrayidx140.i.i, metadata !649, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.value(metadata i32 1, metadata !650, metadata !DIExpression()), !dbg !747
  %cmp1.i432.i.i = fcmp oeq double %335, 0.000000e+00
  br i1 %cmp1.i432.i.i, label %daxpy_ur.exit.i.i, label %if.end26.i.i.i, !dbg !749

if.end26.i.i.i:                                   ; preds = %if.end130.i.i
  call void @llvm.dbg.value(metadata i64 %338, metadata !654, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !747
  %rem.i504.i.i = and i64 %338, 3, !dbg !750
  %cmp27.not.i.i.i = icmp eq i64 %rem.i504.i.i, 0, !dbg !750
  br i1 %cmp27.not.i.i.i, label %if.end45.i.i.i, label %for.body31.i.i.i, !dbg !751

for.body31.i.i.i:                                 ; preds = %if.end26.i.i.i
  call void @llvm.dbg.value(metadata i64 0, metadata !651, metadata !DIExpression()), !dbg !747
  %341 = load double, ptr %arrayidx140.i.i, align 8, !dbg !752, !tbaa !181
  %342 = load double, ptr %arrayidx137.i.i, align 8, !dbg !753, !tbaa !181
  %343 = tail call double @llvm.fmuladd.f64(double %335, double %342, double %341), !dbg !754
  store double %343, ptr %arrayidx140.i.i, align 8, !dbg !755, !tbaa !181
  call void @llvm.dbg.value(metadata i64 1, metadata !651, metadata !DIExpression()), !dbg !747
  %exitcond.not.i438.i.i = icmp eq i64 %rem.i504.i.i, 1, !dbg !756
  br i1 %exitcond.not.i438.i.i, label %for.end41.i.i.i, label %for.body31.i.i.i.1, !dbg !757, !llvm.loop !758

for.body31.i.i.i.1:                               ; preds = %for.body31.i.i.i
  call void @llvm.dbg.value(metadata i64 1, metadata !651, metadata !DIExpression()), !dbg !747
  %arrayidx33.i436.i.i.1 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 1, !dbg !752
  %344 = load double, ptr %arrayidx33.i436.i.i.1, align 8, !dbg !752, !tbaa !181
  %arrayidx35.i.i.i.1 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 1, !dbg !753
  %345 = load double, ptr %arrayidx35.i.i.i.1, align 8, !dbg !753, !tbaa !181
  %346 = tail call double @llvm.fmuladd.f64(double %335, double %345, double %344), !dbg !754
  store double %346, ptr %arrayidx33.i436.i.i.1, align 8, !dbg !755, !tbaa !181
  call void @llvm.dbg.value(metadata i64 2, metadata !651, metadata !DIExpression()), !dbg !747
  %exitcond.not.i438.i.i.1 = icmp eq i64 %rem.i504.i.i, 2, !dbg !756
  br i1 %exitcond.not.i438.i.i.1, label %for.end41.i.i.i, label %for.body31.i.i.i.2, !dbg !757, !llvm.loop !758

for.body31.i.i.i.2:                               ; preds = %for.body31.i.i.i.1
  call void @llvm.dbg.value(metadata i64 2, metadata !651, metadata !DIExpression()), !dbg !747
  %arrayidx33.i436.i.i.2 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 2, !dbg !752
  %347 = load double, ptr %arrayidx33.i436.i.i.2, align 8, !dbg !752, !tbaa !181
  %arrayidx35.i.i.i.2 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 2, !dbg !753
  %348 = load double, ptr %arrayidx35.i.i.i.2, align 8, !dbg !753, !tbaa !181
  %349 = tail call double @llvm.fmuladd.f64(double %335, double %348, double %347), !dbg !754
  store double %349, ptr %arrayidx33.i436.i.i.2, align 8, !dbg !755, !tbaa !181
  call void @llvm.dbg.value(metadata i64 3, metadata !651, metadata !DIExpression()), !dbg !747
  br label %for.end41.i.i.i

for.end41.i.i.i:                                  ; preds = %for.body31.i.i.i.2, %for.body31.i.i.i.1, %for.body31.i.i.i
  %cmp47152.i.i.i = icmp ult i64 %indvars.iv488.i.i, 96
  call void @llvm.dbg.value(metadata i64 %338, metadata !651, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !747
  br i1 %cmp47152.i.i.i, label %for.body48.preheader.i.i.i, label %daxpy_ur.exit.i.i, !dbg !760

if.end45.i.i.i:                                   ; preds = %if.end26.i.i.i
  call void @llvm.dbg.value(metadata i64 %338, metadata !651, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !747
  %cmp47152.old.i.i.i = icmp ult i64 %indvars.iv488.i.i, 96, !dbg !761
  br i1 %cmp47152.old.i.i.i, label %for.body48.preheader.i.i.i, label %daxpy_ur.exit.i.i, !dbg !762

for.body48.preheader.i.i.i:                       ; preds = %if.end45.i.i.i, %for.end41.i.i.i
  %min.iters.check80 = icmp ult i64 %331, 4, !dbg !762
  br i1 %min.iters.check80, label %for.body48.i.i.i.preheader, label %vector.ph81, !dbg !762

vector.ph81:                                      ; preds = %for.body48.preheader.i.i.i
  %n.vec83 = and i64 %333, 9223372036854775806, !dbg !762
  %350 = shl i64 %n.vec83, 2, !dbg !762
  %broadcast.splatinsert90 = insertelement <2 x double> poison, double %335, i64 0, !dbg !762
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !762
  br label %vector.body87, !dbg !762

vector.body87:                                    ; preds = %vector.body87, %vector.ph81
  %index88 = phi i64 [ 0, %vector.ph81 ], [ %index.next93, %vector.body87 ]
  %351 = shl i64 %index88, 2, !dbg !762
  %offset.idx89 = or i64 %rem.i504.i.i, %351, !dbg !762
  %352 = or i64 %offset.idx89, 4, !dbg !762
  %353 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %offset.idx89, !dbg !763
  %354 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %352, !dbg !763
  %355 = load double, ptr %353, align 8, !dbg !763, !tbaa !181
  %356 = load double, ptr %354, align 8, !dbg !763, !tbaa !181
  %357 = insertelement <2 x double> poison, double %355, i64 0, !dbg !764
  %358 = insertelement <2 x double> %357, double %356, i64 1, !dbg !764
  %359 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %offset.idx89, !dbg !764
  %360 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %352, !dbg !764
  %361 = load double, ptr %359, align 8, !dbg !764, !tbaa !181
  %362 = load double, ptr %360, align 8, !dbg !764, !tbaa !181
  %363 = insertelement <2 x double> poison, double %361, i64 0, !dbg !762
  %364 = insertelement <2 x double> %363, double %362, i64 1, !dbg !762
  %365 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat91, <2 x double> %364, <2 x double> %358), !dbg !762
  %366 = add nuw nsw i64 %offset.idx89, 1, !dbg !765
  %367 = add i64 %offset.idx89, 5, !dbg !765
  %368 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %366, !dbg !766
  %369 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %367, !dbg !766
  %370 = load double, ptr %368, align 8, !dbg !766, !tbaa !181
  %371 = load double, ptr %369, align 8, !dbg !766, !tbaa !181
  %372 = insertelement <2 x double> poison, double %370, i64 0, !dbg !767
  %373 = insertelement <2 x double> %372, double %371, i64 1, !dbg !767
  %374 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %366, !dbg !767
  %375 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %367, !dbg !767
  %376 = load double, ptr %374, align 8, !dbg !767, !tbaa !181
  %377 = load double, ptr %375, align 8, !dbg !767, !tbaa !181
  %378 = insertelement <2 x double> poison, double %376, i64 0, !dbg !762
  %379 = insertelement <2 x double> %378, double %377, i64 1, !dbg !762
  %380 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat91, <2 x double> %379, <2 x double> %373), !dbg !762
  %381 = add nuw nsw i64 %offset.idx89, 2, !dbg !768
  %382 = add i64 %offset.idx89, 6, !dbg !768
  %383 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %381, !dbg !769
  %384 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %382, !dbg !769
  %385 = load double, ptr %383, align 8, !dbg !769, !tbaa !181
  %386 = load double, ptr %384, align 8, !dbg !769, !tbaa !181
  %387 = insertelement <2 x double> poison, double %385, i64 0, !dbg !770
  %388 = insertelement <2 x double> %387, double %386, i64 1, !dbg !770
  %389 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %381, !dbg !770
  %390 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %382, !dbg !770
  %391 = load double, ptr %389, align 8, !dbg !770, !tbaa !181
  %392 = load double, ptr %390, align 8, !dbg !770, !tbaa !181
  %393 = insertelement <2 x double> poison, double %391, i64 0, !dbg !762
  %394 = insertelement <2 x double> %393, double %392, i64 1, !dbg !762
  %395 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat91, <2 x double> %394, <2 x double> %388), !dbg !762
  %396 = add nuw nsw i64 %offset.idx89, 3, !dbg !771
  %397 = add i64 %offset.idx89, 7, !dbg !771
  %398 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %396, !dbg !772
  %399 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %397, !dbg !772
  %400 = load double, ptr %398, align 8, !dbg !772, !tbaa !181
  %401 = load double, ptr %399, align 8, !dbg !772, !tbaa !181
  %402 = insertelement <2 x double> poison, double %400, i64 0, !dbg !773
  %403 = insertelement <2 x double> %402, double %401, i64 1, !dbg !773
  %404 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %396, !dbg !773
  %405 = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %397, !dbg !773
  %406 = load double, ptr %404, align 8, !dbg !773, !tbaa !181
  %407 = load double, ptr %405, align 8, !dbg !773, !tbaa !181
  %408 = insertelement <2 x double> poison, double %406, i64 0, !dbg !762
  %409 = insertelement <2 x double> %408, double %407, i64 1, !dbg !762
  %410 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat91, <2 x double> %409, <2 x double> %403), !dbg !762
  %411 = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %offset.idx89, !dbg !772
  %412 = shufflevector <2 x double> %365, <2 x double> %380, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !774
  %413 = shufflevector <2 x double> %395, <2 x double> %410, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !774
  %interleaved.vec92 = shufflevector <4 x double> %412, <4 x double> %413, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>, !dbg !774
  store <8 x double> %interleaved.vec92, ptr %411, align 8, !dbg !774, !tbaa !181
  %index.next93 = add nuw i64 %index88, 2
  %414 = icmp eq i64 %index.next93, %n.vec83
  br i1 %414, label %middle.block78, label %vector.body87, !llvm.loop !775

middle.block78:                                   ; preds = %vector.body87
  %ind.end84 = or i64 %rem.i504.i.i, %350, !dbg !762
  %cmp.n86 = icmp eq i64 %333, %n.vec83, !dbg !762
  br i1 %cmp.n86, label %daxpy_ur.exit.i.i, label %for.body48.i.i.i.preheader, !dbg !762

for.body48.i.i.i.preheader:                       ; preds = %for.body48.preheader.i.i.i, %middle.block78
  %indvars.iv156.i.i.i.ph = phi i64 [ %rem.i504.i.i, %for.body48.preheader.i.i.i ], [ %ind.end84, %middle.block78 ]
  %415 = insertelement <2 x double> poison, double %335, i64 0
  %416 = shufflevector <2 x double> %415, <2 x double> poison, <2 x i32> zeroinitializer
  br label %for.body48.i.i.i, !dbg !762

for.body48.i.i.i:                                 ; preds = %for.body48.i.i.i.preheader, %for.body48.i.i.i
  %indvars.iv156.i.i.i = phi i64 [ %indvars.iv.next157.i.i.i, %for.body48.i.i.i ], [ %indvars.iv156.i.i.i.ph, %for.body48.i.i.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv156.i.i.i, metadata !651, metadata !DIExpression()), !dbg !747
  %arrayidx50.i.i.i = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %indvars.iv156.i.i.i, !dbg !763
  %arrayidx52.i.i.i = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %indvars.iv156.i.i.i, !dbg !764
  %417 = load <2 x double>, ptr %arrayidx50.i.i.i, align 8, !dbg !763, !tbaa !181
  %418 = load <2 x double>, ptr %arrayidx52.i.i.i, align 8, !dbg !764, !tbaa !181
  %419 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %416, <2 x double> %418, <2 x double> %417), !dbg !777
  store <2 x double> %419, ptr %arrayidx50.i.i.i, align 8, !dbg !778, !tbaa !181
  %420 = add nuw nsw i64 %indvars.iv156.i.i.i, 2, !dbg !768
  %arrayidx68.i.i.i = getelementptr inbounds double, ptr %arrayidx140.i.i, i64 %420, !dbg !769
  %arrayidx71.i.i.i = getelementptr inbounds double, ptr %arrayidx137.i.i, i64 %420, !dbg !770
  %421 = load <2 x double>, ptr %arrayidx68.i.i.i, align 8, !dbg !769, !tbaa !181
  %422 = load <2 x double>, ptr %arrayidx71.i.i.i, align 8, !dbg !770, !tbaa !181
  %423 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %416, <2 x double> %422, <2 x double> %421), !dbg !779
  store <2 x double> %423, ptr %arrayidx68.i.i.i, align 8, !dbg !780, !tbaa !181
  %indvars.iv.next157.i.i.i = add nuw nsw i64 %indvars.iv156.i.i.i, 4, !dbg !781
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next157.i.i.i, metadata !651, metadata !DIExpression()), !dbg !747
  %cmp47.i.i.i = icmp ult i64 %indvars.iv.next157.i.i.i, %338, !dbg !761
  br i1 %cmp47.i.i.i, label %for.body48.i.i.i, label %daxpy_ur.exit.i.i, !dbg !762, !llvm.loop !782

daxpy_ur.exit.i.i:                                ; preds = %for.body48.i.i.i, %middle.block78, %if.end45.i.i.i, %for.end41.i.i.i, %if.end130.i.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next489.i.i, metadata !394, metadata !DIExpression()), !dbg !722
  %exitcond494.not.i.i = icmp eq i64 %indvars.iv.next489.i.i, 99, !dbg !783
  br i1 %exitcond494.not.i.i, label %for.body147.i.preheader.i, label %for.body117.i.i, !dbg !784, !llvm.loop !785

for.body147.i.preheader.i:                        ; preds = %daxpy_ur.exit.i.i
  %div.i197.i = fdiv double %conv.i196.i, 1.000000e+06, !dbg !787
  br label %for.body147.i.i, !dbg !788

for.body147.i.i:                                  ; preds = %daxpy_ur.exit470.i.i, %for.body147.i.preheader.i
  %indvars.iv495.i.i = phi i64 [ %indvars.iv.next496.i.i, %daxpy_ur.exit470.i.i ], [ 0, %for.body147.i.preheader.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv495.i.i, metadata !395, metadata !DIExpression()), !dbg !722
  %424 = sub nuw nsw i64 99, %indvars.iv495.i.i, !dbg !790
  %425 = and i64 %indvars.iv495.i.i, 3, !dbg !790
  %426 = or i64 %indvars.iv495.i.i, -4, !dbg !790
  %427 = xor i64 %425, 7, !dbg !790
  %umax = tail call i64 @llvm.umax.i64(i64 %424, i64 %427), !dbg !790
  %428 = add i64 %426, %umax, !dbg !790
  %429 = lshr i64 %428, 2, !dbg !790
  %430 = add nuw nsw i64 %429, 1, !dbg !790
  %indvars.iv.next496.i.i = add nuw nsw i64 %indvars.iv495.i.i, 1, !dbg !790
  %431 = sub nuw nsw i64 99, %indvars.iv495.i.i, !dbg !793
  call void @llvm.dbg.value(metadata i64 %431, metadata !394, metadata !DIExpression()), !dbg !722
  %arrayidx151.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %431, !dbg !794
  %432 = load double, ptr %arrayidx151.i.i, align 8, !dbg !794, !tbaa !181
  %433 = mul nuw nsw i64 %431, 200, !dbg !795
  %434 = mul nuw nsw i64 %431, 201, !dbg !796
  %arrayidx155.i.i = getelementptr inbounds double, ptr %0, i64 %434, !dbg !797
  %435 = load double, ptr %arrayidx155.i.i, align 8, !dbg !797, !tbaa !181
  %div156.i.i = fdiv double %432, %435, !dbg !798
  store double %div156.i.i, ptr %arrayidx151.i.i, align 8, !dbg !799, !tbaa !181
  %fneg161.i.i = fneg double %div156.i.i, !dbg !800
  call void @llvm.dbg.value(metadata double %fneg161.i.i, metadata !393, metadata !DIExpression()), !dbg !722
  %arrayidx165.i.i = getelementptr inbounds double, ptr %0, i64 %433, !dbg !801
  call void @llvm.dbg.value(metadata i64 %431, metadata !643, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata double %fneg161.i.i, metadata !646, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata ptr %arrayidx165.i.i, metadata !647, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata i32 1, metadata !648, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !649, metadata !DIExpression()), !dbg !802
  call void @llvm.dbg.value(metadata i32 1, metadata !650, metadata !DIExpression()), !dbg !802
  %cmp.i439.i.i = icmp eq i64 %indvars.iv495.i.i, 99, !dbg !804
  %cmp1.i440.i.i = fcmp oeq double %div156.i.i, 0.000000e+00
  %or.cond.i441.i.i = or i1 %cmp.i439.i.i, %cmp1.i440.i.i, !dbg !806
  br i1 %or.cond.i441.i.i, label %daxpy_ur.exit470.i.i, label %if.end26.i442.i.i, !dbg !806

if.end26.i442.i.i:                                ; preds = %for.body147.i.i
  call void @llvm.dbg.value(metadata i64 %431, metadata !654, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !802
  %rem.i443505.i.i = and i64 %431, 3, !dbg !807
  %cmp27.not.i444.i.i = icmp eq i64 %rem.i443505.i.i, 0, !dbg !807
  br i1 %cmp27.not.i444.i.i, label %if.end45.i468.i.i, label %for.body31.i447.i.i, !dbg !808

for.body31.i447.i.i:                              ; preds = %if.end26.i442.i.i
  call void @llvm.dbg.value(metadata i64 0, metadata !651, metadata !DIExpression()), !dbg !802
  %436 = load double, ptr %add.ptr.i, align 8, !dbg !809, !tbaa !181
  %437 = load double, ptr %arrayidx165.i.i, align 8, !dbg !810, !tbaa !181
  %438 = tail call double @llvm.fmuladd.f64(double %fneg161.i.i, double %437, double %436), !dbg !811
  store double %438, ptr %add.ptr.i, align 8, !dbg !812, !tbaa !181
  call void @llvm.dbg.value(metadata i64 1, metadata !651, metadata !DIExpression()), !dbg !802
  %exitcond.not.i452.i.i = icmp eq i64 %rem.i443505.i.i, 1, !dbg !813
  br i1 %exitcond.not.i452.i.i, label %for.end41.i453.i.i, label %for.body31.i447.i.i.1, !dbg !814, !llvm.loop !815

for.body31.i447.i.i.1:                            ; preds = %for.body31.i447.i.i
  call void @llvm.dbg.value(metadata i64 1, metadata !651, metadata !DIExpression()), !dbg !802
  %439 = load double, ptr %arrayidx33.i449.i.i.1, align 8, !dbg !809, !tbaa !181
  %arrayidx35.i450.i.i.1 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 1, !dbg !810
  %440 = load double, ptr %arrayidx35.i450.i.i.1, align 8, !dbg !810, !tbaa !181
  %441 = tail call double @llvm.fmuladd.f64(double %fneg161.i.i, double %440, double %439), !dbg !811
  store double %441, ptr %arrayidx33.i449.i.i.1, align 8, !dbg !812, !tbaa !181
  call void @llvm.dbg.value(metadata i64 2, metadata !651, metadata !DIExpression()), !dbg !802
  %exitcond.not.i452.i.i.1 = icmp eq i64 %rem.i443505.i.i, 2, !dbg !813
  br i1 %exitcond.not.i452.i.i.1, label %for.end41.i453.i.i, label %for.body31.i447.i.i.2, !dbg !814, !llvm.loop !815

for.body31.i447.i.i.2:                            ; preds = %for.body31.i447.i.i.1
  call void @llvm.dbg.value(metadata i64 2, metadata !651, metadata !DIExpression()), !dbg !802
  %442 = load double, ptr %arrayidx33.i449.i.i.2, align 8, !dbg !809, !tbaa !181
  %arrayidx35.i450.i.i.2 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 2, !dbg !810
  %443 = load double, ptr %arrayidx35.i450.i.i.2, align 8, !dbg !810, !tbaa !181
  %444 = tail call double @llvm.fmuladd.f64(double %fneg161.i.i, double %443, double %442), !dbg !811
  store double %444, ptr %arrayidx33.i449.i.i.2, align 8, !dbg !812, !tbaa !181
  call void @llvm.dbg.value(metadata i64 3, metadata !651, metadata !DIExpression()), !dbg !802
  br label %for.end41.i453.i.i

for.end41.i453.i.i:                               ; preds = %for.body31.i447.i.i.2, %for.body31.i447.i.i.1, %for.body31.i447.i.i
  %cmp47152.i454.i.i = icmp ult i64 %indvars.iv495.i.i, 96
  call void @llvm.dbg.value(metadata i64 %431, metadata !651, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !802
  br i1 %cmp47152.i454.i.i, label %for.body48.preheader.i455.i.i, label %daxpy_ur.exit470.i.i, !dbg !817

if.end45.i468.i.i:                                ; preds = %if.end26.i442.i.i
  call void @llvm.dbg.value(metadata i64 %431, metadata !651, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !802
  %cmp47152.old.i469.i.i = icmp ult i64 %indvars.iv495.i.i, 96, !dbg !818
  br i1 %cmp47152.old.i469.i.i, label %for.body48.preheader.i455.i.i, label %daxpy_ur.exit470.i.i, !dbg !819

for.body48.preheader.i455.i.i:                    ; preds = %if.end45.i468.i.i, %for.end41.i453.i.i
  %min.iters.check = icmp ult i64 %428, 4, !dbg !819
  br i1 %min.iters.check, label %for.body48.i456.i.i.preheader, label %vector.ph, !dbg !819

vector.ph:                                        ; preds = %for.body48.preheader.i455.i.i
  %n.vec = and i64 %430, 9223372036854775806, !dbg !819
  %445 = shl i64 %n.vec, 2, !dbg !819
  %broadcast.splatinsert = insertelement <2 x double> poison, double %fneg161.i.i, i64 0, !dbg !819
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !819
  br label %vector.body, !dbg !819

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %446 = shl i64 %index, 2, !dbg !819
  %offset.idx = or i64 %rem.i443505.i.i, %446, !dbg !819
  %447 = or i64 %offset.idx, 4, !dbg !819
  %448 = getelementptr inbounds double, ptr %add.ptr.i, i64 %offset.idx, !dbg !820
  %449 = getelementptr inbounds double, ptr %add.ptr.i, i64 %447, !dbg !820
  %450 = load double, ptr %448, align 8, !dbg !820, !tbaa !181
  %451 = load double, ptr %449, align 8, !dbg !820, !tbaa !181
  %452 = insertelement <2 x double> poison, double %450, i64 0, !dbg !821
  %453 = insertelement <2 x double> %452, double %451, i64 1, !dbg !821
  %454 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %offset.idx, !dbg !821
  %455 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %447, !dbg !821
  %456 = load double, ptr %454, align 8, !dbg !821, !tbaa !181
  %457 = load double, ptr %455, align 8, !dbg !821, !tbaa !181
  %458 = insertelement <2 x double> poison, double %456, i64 0, !dbg !819
  %459 = insertelement <2 x double> %458, double %457, i64 1, !dbg !819
  %460 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat, <2 x double> %459, <2 x double> %453), !dbg !819
  %461 = add nuw nsw i64 %offset.idx, 1, !dbg !822
  %462 = add i64 %offset.idx, 5, !dbg !822
  %463 = getelementptr inbounds double, ptr %add.ptr.i, i64 %461, !dbg !823
  %464 = getelementptr inbounds double, ptr %add.ptr.i, i64 %462, !dbg !823
  %465 = load double, ptr %463, align 8, !dbg !823, !tbaa !181
  %466 = load double, ptr %464, align 8, !dbg !823, !tbaa !181
  %467 = insertelement <2 x double> poison, double %465, i64 0, !dbg !824
  %468 = insertelement <2 x double> %467, double %466, i64 1, !dbg !824
  %469 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %461, !dbg !824
  %470 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %462, !dbg !824
  %471 = load double, ptr %469, align 8, !dbg !824, !tbaa !181
  %472 = load double, ptr %470, align 8, !dbg !824, !tbaa !181
  %473 = insertelement <2 x double> poison, double %471, i64 0, !dbg !819
  %474 = insertelement <2 x double> %473, double %472, i64 1, !dbg !819
  %475 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat, <2 x double> %474, <2 x double> %468), !dbg !819
  %476 = add nuw nsw i64 %offset.idx, 2, !dbg !825
  %477 = add i64 %offset.idx, 6, !dbg !825
  %478 = getelementptr inbounds double, ptr %add.ptr.i, i64 %476, !dbg !826
  %479 = getelementptr inbounds double, ptr %add.ptr.i, i64 %477, !dbg !826
  %480 = load double, ptr %478, align 8, !dbg !826, !tbaa !181
  %481 = load double, ptr %479, align 8, !dbg !826, !tbaa !181
  %482 = insertelement <2 x double> poison, double %480, i64 0, !dbg !827
  %483 = insertelement <2 x double> %482, double %481, i64 1, !dbg !827
  %484 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %476, !dbg !827
  %485 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %477, !dbg !827
  %486 = load double, ptr %484, align 8, !dbg !827, !tbaa !181
  %487 = load double, ptr %485, align 8, !dbg !827, !tbaa !181
  %488 = insertelement <2 x double> poison, double %486, i64 0, !dbg !819
  %489 = insertelement <2 x double> %488, double %487, i64 1, !dbg !819
  %490 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat, <2 x double> %489, <2 x double> %483), !dbg !819
  %491 = add nuw nsw i64 %offset.idx, 3, !dbg !828
  %492 = add i64 %offset.idx, 7, !dbg !828
  %493 = getelementptr inbounds double, ptr %add.ptr.i, i64 %491, !dbg !829
  %494 = getelementptr inbounds double, ptr %add.ptr.i, i64 %492, !dbg !829
  %495 = load double, ptr %493, align 8, !dbg !829, !tbaa !181
  %496 = load double, ptr %494, align 8, !dbg !829, !tbaa !181
  %497 = insertelement <2 x double> poison, double %495, i64 0, !dbg !830
  %498 = insertelement <2 x double> %497, double %496, i64 1, !dbg !830
  %499 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %491, !dbg !830
  %500 = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %492, !dbg !830
  %501 = load double, ptr %499, align 8, !dbg !830, !tbaa !181
  %502 = load double, ptr %500, align 8, !dbg !830, !tbaa !181
  %503 = insertelement <2 x double> poison, double %501, i64 0, !dbg !819
  %504 = insertelement <2 x double> %503, double %502, i64 1, !dbg !819
  %505 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat, <2 x double> %504, <2 x double> %498), !dbg !819
  %506 = getelementptr inbounds double, ptr %add.ptr.i, i64 %offset.idx, !dbg !829
  %507 = shufflevector <2 x double> %460, <2 x double> %475, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !831
  %508 = shufflevector <2 x double> %490, <2 x double> %505, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !831
  %interleaved.vec = shufflevector <4 x double> %507, <4 x double> %508, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>, !dbg !831
  store <8 x double> %interleaved.vec, ptr %506, align 8, !dbg !831, !tbaa !181
  %index.next = add nuw i64 %index, 2
  %509 = icmp eq i64 %index.next, %n.vec
  br i1 %509, label %middle.block, label %vector.body, !llvm.loop !832

middle.block:                                     ; preds = %vector.body
  %ind.end = or i64 %rem.i443505.i.i, %445, !dbg !819
  %cmp.n = icmp eq i64 %430, %n.vec, !dbg !819
  br i1 %cmp.n, label %daxpy_ur.exit470.i.i, label %for.body48.i456.i.i.preheader, !dbg !819

for.body48.i456.i.i.preheader:                    ; preds = %for.body48.preheader.i455.i.i, %middle.block
  %indvars.iv156.i457.i.i.ph = phi i64 [ %rem.i443505.i.i, %for.body48.preheader.i455.i.i ], [ %ind.end, %middle.block ]
  %510 = insertelement <2 x double> poison, double %fneg161.i.i, i64 0
  %511 = shufflevector <2 x double> %510, <2 x double> poison, <2 x i32> zeroinitializer
  br label %for.body48.i456.i.i, !dbg !819

for.body48.i456.i.i:                              ; preds = %for.body48.i456.i.i.preheader, %for.body48.i456.i.i
  %indvars.iv156.i457.i.i = phi i64 [ %indvars.iv.next157.i466.i.i, %for.body48.i456.i.i ], [ %indvars.iv156.i457.i.i.ph, %for.body48.i456.i.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv156.i457.i.i, metadata !651, metadata !DIExpression()), !dbg !802
  %arrayidx50.i458.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv156.i457.i.i, !dbg !820
  %arrayidx52.i459.i.i = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %indvars.iv156.i457.i.i, !dbg !821
  %512 = load <2 x double>, ptr %arrayidx50.i458.i.i, align 8, !dbg !820, !tbaa !181
  %513 = load <2 x double>, ptr %arrayidx52.i459.i.i, align 8, !dbg !821, !tbaa !181
  %514 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %511, <2 x double> %513, <2 x double> %512), !dbg !834
  store <2 x double> %514, ptr %arrayidx50.i458.i.i, align 8, !dbg !835, !tbaa !181
  %515 = add nuw nsw i64 %indvars.iv156.i457.i.i, 2, !dbg !825
  %arrayidx68.i462.i.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %515, !dbg !826
  %arrayidx71.i463.i.i = getelementptr inbounds double, ptr %arrayidx165.i.i, i64 %515, !dbg !827
  %516 = load <2 x double>, ptr %arrayidx68.i462.i.i, align 8, !dbg !826, !tbaa !181
  %517 = load <2 x double>, ptr %arrayidx71.i463.i.i, align 8, !dbg !827, !tbaa !181
  %518 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %511, <2 x double> %517, <2 x double> %516), !dbg !836
  store <2 x double> %518, ptr %arrayidx68.i462.i.i, align 8, !dbg !837, !tbaa !181
  %indvars.iv.next157.i466.i.i = add nuw nsw i64 %indvars.iv156.i457.i.i, 4, !dbg !838
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next157.i466.i.i, metadata !651, metadata !DIExpression()), !dbg !802
  %cmp47.i467.i.i = icmp ult i64 %indvars.iv.next157.i466.i.i, %431, !dbg !818
  br i1 %cmp47.i467.i.i, label %for.body48.i456.i.i, label %daxpy_ur.exit470.i.i, !dbg !819, !llvm.loop !839

daxpy_ur.exit470.i.i:                             ; preds = %for.body48.i456.i.i, %middle.block, %if.end45.i468.i.i, %for.end41.i453.i.i, %for.body147.i.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next496.i.i, metadata !395, metadata !DIExpression()), !dbg !722
  %exitcond501.not.i.i = icmp eq i64 %indvars.iv.next496.i.i, 100, !dbg !840
  br i1 %exitcond501.not.i.i, label %dgesl.exit204.i, label %for.body147.i.i, !dbg !788, !llvm.loop !841

dgesl.exit204.i:                                  ; preds = %daxpy_ur.exit470.i.i
  %div.i200.i = fdiv double %conv.i199.i, 1.000000e+06, !dbg !843
  %conv.i202.i = sitofp i64 %call.i201.i to double, !dbg !844
  %div.i203.i = fdiv double %conv.i202.i, 1.000000e+06, !dbg !845
  %call.i205.i = tail call i64 @clock() #11, !dbg !846
  %conv.i206.i = sitofp i64 %call.i205.i to double, !dbg !848
  %div.i207.i = fdiv double %conv.i206.i, 1.000000e+06, !dbg !849
  %519 = insertelement <2 x double> poison, double %div.i207.i, i64 0, !dbg !850
  %520 = insertelement <2 x double> %519, double %div.i200.i, i64 1, !dbg !850
  %521 = insertelement <2 x double> poison, double %div.i203.i, i64 0, !dbg !850
  %522 = insertelement <2 x double> %521, double %div.i197.i, i64 1, !dbg !850
  %523 = fsub <2 x double> %520, %522, !dbg !851
  %524 = fadd <2 x double> %94, %523, !dbg !852
  call void @llvm.dbg.value(metadata double undef, metadata !127, metadata !DIExpression()), !dbg !137
  %inc33.i = add nuw nsw i64 %i.1221.i, 1, !dbg !853
  call void @llvm.dbg.value(metadata i64 %inc33.i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !128, metadata !DIExpression()), !dbg !137
  %exitcond225.not.i = icmp eq i64 %inc33.i, %nreps.0, !dbg !854
  br i1 %exitcond225.not.i, label %for.end34.i, label %for.cond1.preheader.i164.preheader.i, !dbg !488, !llvm.loop !855

for.end34.i:                                      ; preds = %dgesl.exit204.i, %while.cond
  %525 = phi <2 x double> [ zeroinitializer, %while.cond ], [ %524, %dgesl.exit204.i ], !dbg !137
  %call.i208.i = tail call i64 @clock() #11, !dbg !857
  %conv.i209.i = sitofp i64 %call.i208.i to double, !dbg !859
  %div.i210.i = fdiv double %conv.i209.i, 1.000000e+06, !dbg !860
  %sub36.i = fsub double %div.i210.i, %div.i.i, !dbg !861
  call void @llvm.dbg.value(metadata double %sub36.i, metadata !129, metadata !DIExpression()), !dbg !137
  %cmp37.i = fcmp olt double %sub36.i, 5.000000e-01, !dbg !862
  br i1 %cmp37.i, label %linpack.exit.thread, label %lor.lhs.false.i, !dbg !864

lor.lhs.false.i:                                  ; preds = %for.end34.i
  %526 = extractelement <2 x double> %525, i64 0, !dbg !865
  %527 = extractelement <2 x double> %525, i64 1, !dbg !865
  %add39.i = fadd double %527, %526, !dbg !865
  %cmp40.i = fcmp olt double %add39.i, 2.000000e-01, !dbg !866
  br i1 %cmp40.i, label %linpack.exit.thread, label %linpack.exit, !dbg !867

linpack.exit.thread:                              ; preds = %lor.lhs.false.i, %for.end34.i
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %info.i) #11, !dbg !868
  br label %while.body, !dbg !114

linpack.exit:                                     ; preds = %lor.lhs.false.i
  %conv42.i = sitofp i64 %nreps.0 to double, !dbg !869
  %mul43.i = fmul double %conv42.i, 2.000000e+00, !dbg !870
  %mul44.i = fmul double %mul43.i, 0x4124F49555555555, !dbg !871
  %mul46.i = fmul double %add39.i, 1.000000e+03, !dbg !872
  %div47.i = fdiv double %mul44.i, %mul46.i, !dbg !873
  call void @llvm.dbg.value(metadata double %div47.i, metadata !126, metadata !DIExpression()), !dbg !137
  %sub48.i = fsub double %sub36.i, %527, !dbg !874
  %sub49.i = fsub double %sub48.i, %526, !dbg !875
  call void @llvm.dbg.value(metadata double %sub49.i, metadata !130, metadata !DIExpression()), !dbg !137
  %528 = fcmp olt <2 x double> %525, zeroinitializer, !dbg !876
  %529 = fmul double %527, 1.000000e+02, !dbg !878
  call void @llvm.dbg.value(metadata double poison, metadata !128, metadata !DIExpression()), !dbg !137
  %530 = fmul double %526, 1.000000e+02, !dbg !879
  call void @llvm.dbg.value(metadata double poison, metadata !127, metadata !DIExpression()), !dbg !137
  %cmp58.i = fcmp olt double %sub49.i, 0.000000e+00, !dbg !880
  %531 = fmul double %sub49.i, 1.000000e+02, !dbg !882
  call void @llvm.dbg.value(metadata double poison, metadata !130, metadata !DIExpression()), !dbg !137
  %532 = extractelement <2 x i1> %528, i64 1, !dbg !878
  %mul62.i = select i1 %532, double 0.000000e+00, double %529, !dbg !878
  %div63.i = fdiv double %mul62.i, %sub36.i, !dbg !883
  %533 = extractelement <2 x i1> %528, i64 0, !dbg !879
  %mul64.i = select i1 %533, double 0.000000e+00, double %530, !dbg !879
  %div65.i = fdiv double %mul64.i, %sub36.i, !dbg !884
  %mul66.i = select i1 %cmp58.i, double 0.000000e+00, double %531, !dbg !882
  %div67.i = fdiv double %mul66.i, %sub36.i, !dbg !885
  %call68.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i64 noundef %nreps.0, double noundef %sub36.i, double noundef %div63.i, double noundef %div65.i, double noundef %div67.i, double noundef %div47.i), !dbg !886
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %info.i) #11, !dbg !868
  %cmp30 = fcmp olt double %sub36.i, 1.000000e+01, !dbg !887
  br i1 %cmp30, label %while.body, label %while.end, !dbg !114

while.body:                                       ; preds = %linpack.exit.thread, %linpack.exit
  %mul32 = shl nsw i64 %nreps.0, 1, !dbg !888
  call void @llvm.dbg.value(metadata i64 %mul32, metadata !90, metadata !DIExpression()), !dbg !94
  br label %while.cond, !dbg !114, !llvm.loop !889

while.end:                                        ; preds = %linpack.exit
  %534 = load ptr, ptr @mempool, align 8, !dbg !891, !tbaa !99
  tail call void @free(ptr noundef %534) #11, !dbg !892
  %putchar = tail call i32 @putchar(i32 10), !dbg !893
  br label %cleanup, !dbg !894

cleanup:                                          ; preds = %while.end, %if.then20
  %retval.0 = phi i32 [ 2, %if.then20 ], [ 0, %while.end ]
  ret i32 %retval.0, !dbg !894
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: alwaysinline nofree nounwind
declare !dbg !895 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: alwaysinline mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !902 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !906 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #5

; Function Attrs: alwaysinline nounwind
declare !dbg !909 i64 @clock() local_unnamed_addr #6

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #5

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #5

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #7

; Function Attrs: alwaysinline nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #8

; Function Attrs: alwaysinline nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #9

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #7

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #7

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #7

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #7

attributes #0 = { alwaysinline nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { alwaysinline nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { alwaysinline mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { alwaysinline mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { alwaysinline nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { alwaysinline nofree nounwind }
attributes #9 = { alwaysinline nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!9}
!llvm.module.flags = !{!75, !76, !77, !78, !79, !80, !81}
!llvm.ident = !{!82}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 90, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../test/testInputs/linpack.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/build", checksumkind: CSK_MD5, checksum: "a7264ed25255195eda2cf2d086f7387a")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 25)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "mempool", scope: !9, file: !2, line: 64, type: !11, isLocal: true, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !10, globals: !25, splitDebugInlining: false, nameTableKind: None)
!10 = !{!11, !12, !13, !16, !17, !19, !22, !20, !23, !21}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !14, line: 46, baseType: !15)
!14 = !DIFile(filename: "llvm/llvm-17/lib/clang/17/include/stddef.h", directory: "/home/madison.bradley", checksumkind: CSK_MD5, checksum: "d1776268f398bd1ca997c840ad581432")
!15 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "REAL", file: !2, line: 48, baseType: !21)
!21 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !24, line: 156, baseType: !12)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "f6304b1a6dcfc6bee76e9a51043b5090")
!25 = !{!26, !0, !31, !36, !41, !46, !51, !56, !61, !63, !68, !7, !73}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !2, line: 85, type: !28, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 12)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !2, line: 94, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 416, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 52)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !2, line: 97, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 288, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 36)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(scope: null, file: !2, line: 97, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 7)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(scope: null, file: !2, line: 98, type: !48, isLocal: true, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 32)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !2, line: 99, type: !53, isLocal: true, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 21)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !2, line: 100, type: !58, isLocal: true, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 344, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 43)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(scope: null, file: !2, line: 101, type: !33, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(scope: null, file: !2, line: 102, type: !65, isLocal: true, isDefinition: true)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 432, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 54)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(scope: null, file: !2, line: 107, type: !70, isLocal: true, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 2)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !2, line: 160, type: !58, isLocal: true, isDefinition: true)
!75 = !{i32 7, !"Dwarf Version", i32 5}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 8, !"PIC Level", i32 2}
!79 = !{i32 7, !"PIE Level", i32 2}
!80 = !{i32 7, !"uwtable", i32 2}
!81 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!82 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!83 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 67, type: !84, scopeLine: 68, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !86)
!84 = !DISubroutineType(types: !85)
!85 = !{!16}
!86 = !{!87, !88, !89, !90, !91, !92}
!87 = !DILocalVariable(name: "arsize_input", scope: !83, file: !2, line: 69, type: !18)
!88 = !DILocalVariable(name: "arsize", scope: !83, file: !2, line: 70, type: !16)
!89 = !DILocalVariable(name: "arsize2d", scope: !83, file: !2, line: 71, type: !12)
!90 = !DILocalVariable(name: "nreps", scope: !83, file: !2, line: 71, type: !12)
!91 = !DILocalVariable(name: "malloc_arg", scope: !83, file: !2, line: 72, type: !13)
!92 = !DILocalVariable(name: "memreq", scope: !83, file: !2, line: 72, type: !13)
!93 = distinct !DIAssignID()
!94 = !DILocation(line: 0, scope: !83)
!95 = !DILocation(line: 90, column: 9, scope: !83)
!96 = !DILocation(line: 92, column: 44, scope: !97)
!97 = distinct !DILexicalBlock(scope: !83, file: !2, line: 92, column: 13)
!98 = !DILocation(line: 92, column: 43, scope: !97)
!99 = !{!100, !100, i64 0}
!100 = !{!"any pointer", !101, i64 0}
!101 = !{!"omnipotent char", !102, i64 0}
!102 = !{!"Simple C/C++ TBAA"}
!103 = !DILocation(line: 92, column: 63, scope: !97)
!104 = !DILocation(line: 92, column: 13, scope: !83)
!105 = !DILocation(line: 94, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !97, file: !2, line: 93, column: 13)
!107 = !DILocation(line: 95, column: 13, scope: !106)
!108 = !DILocation(line: 97, column: 9, scope: !83)
!109 = !DILocation(line: 98, column: 9, scope: !83)
!110 = !DILocation(line: 99, column: 9, scope: !83)
!111 = !DILocation(line: 100, column: 9, scope: !83)
!112 = !DILocation(line: 101, column: 9, scope: !83)
!113 = !DILocation(line: 102, column: 9, scope: !83)
!114 = !DILocation(line: 104, column: 9, scope: !83)
!115 = !DILocalVariable(name: "info", scope: !116, file: !2, line: 116, type: !16)
!116 = distinct !DISubprogram(name: "linpack", scope: !2, file: !2, line: 111, type: !117, scopeLine: 113, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !119)
!117 = !DISubroutineType(types: !118)
!118 = !{!20, !12, !16}
!119 = !{!120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !115, !134, !135, !136}
!120 = !DILocalVariable(name: "nreps", arg: 1, scope: !116, file: !2, line: 111, type: !12)
!121 = !DILocalVariable(name: "arsize", arg: 2, scope: !116, file: !2, line: 111, type: !16)
!122 = !DILocalVariable(name: "a", scope: !116, file: !2, line: 114, type: !19)
!123 = !DILocalVariable(name: "b", scope: !116, file: !2, line: 114, type: !19)
!124 = !DILocalVariable(name: "norma", scope: !116, file: !2, line: 115, type: !20)
!125 = !DILocalVariable(name: "t1", scope: !116, file: !2, line: 115, type: !20)
!126 = !DILocalVariable(name: "kflops", scope: !116, file: !2, line: 115, type: !20)
!127 = !DILocalVariable(name: "tdgesl", scope: !116, file: !2, line: 115, type: !20)
!128 = !DILocalVariable(name: "tdgefa", scope: !116, file: !2, line: 115, type: !20)
!129 = !DILocalVariable(name: "totalt", scope: !116, file: !2, line: 115, type: !20)
!130 = !DILocalVariable(name: "toverhead", scope: !116, file: !2, line: 115, type: !20)
!131 = !DILocalVariable(name: "ops", scope: !116, file: !2, line: 115, type: !20)
!132 = !DILocalVariable(name: "ipvt", scope: !116, file: !2, line: 116, type: !22)
!133 = !DILocalVariable(name: "n", scope: !116, file: !2, line: 116, type: !16)
!134 = !DILocalVariable(name: "lda", scope: !116, file: !2, line: 116, type: !16)
!135 = !DILocalVariable(name: "i", scope: !116, file: !2, line: 117, type: !12)
!136 = !DILocalVariable(name: "arsize2d", scope: !116, file: !2, line: 117, type: !12)
!137 = !DILocation(line: 0, scope: !116, inlinedAt: !138)
!138 = distinct !DILocation(line: 104, column: 16, scope: !83)
!139 = !DILocation(line: 116, column: 5, scope: !116, inlinedAt: !138)
!140 = !DILocation(line: 123, column: 15, scope: !116, inlinedAt: !138)
!141 = !DILocation(line: 124, column: 8, scope: !116, inlinedAt: !138)
!142 = !DILocation(line: 125, column: 18, scope: !116, inlinedAt: !138)
!143 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !147)
!144 = distinct !DISubprogram(name: "second", scope: !2, file: !2, line: 871, type: !145, scopeLine: 873, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9)
!145 = !DISubroutineType(types: !146)
!146 = !{!20}
!147 = distinct !DILocation(line: 128, column: 12, scope: !116, inlinedAt: !138)
!148 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !147)
!149 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !147)
!150 = !DILocation(line: 129, column: 15, scope: !151, inlinedAt: !138)
!151 = distinct !DILexicalBlock(scope: !152, file: !2, line: 129, column: 5)
!152 = distinct !DILexicalBlock(scope: !116, file: !2, line: 129, column: 5)
!153 = !DILocation(line: 129, column: 5, scope: !152, inlinedAt: !138)
!154 = !DILocation(line: 180, column: 5, scope: !155, inlinedAt: !168)
!155 = distinct !DILexicalBlock(scope: !156, file: !2, line: 180, column: 5)
!156 = distinct !DISubprogram(name: "matgen", scope: !2, file: !2, line: 173, type: !157, scopeLine: 175, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !159)
!157 = !DISubroutineType(types: !158)
!158 = !{null, !19, !16, !16, !19, !19}
!159 = !{!160, !161, !162, !163, !164, !165, !166, !167}
!160 = !DILocalVariable(name: "a", arg: 1, scope: !156, file: !2, line: 173, type: !19)
!161 = !DILocalVariable(name: "lda", arg: 2, scope: !156, file: !2, line: 173, type: !16)
!162 = !DILocalVariable(name: "n", arg: 3, scope: !156, file: !2, line: 173, type: !16)
!163 = !DILocalVariable(name: "b", arg: 4, scope: !156, file: !2, line: 173, type: !19)
!164 = !DILocalVariable(name: "norma", arg: 5, scope: !156, file: !2, line: 173, type: !19)
!165 = !DILocalVariable(name: "init", scope: !156, file: !2, line: 176, type: !16)
!166 = !DILocalVariable(name: "i", scope: !156, file: !2, line: 176, type: !16)
!167 = !DILocalVariable(name: "j", scope: !156, file: !2, line: 176, type: !16)
!168 = distinct !DILocation(line: 131, column: 9, scope: !169, inlinedAt: !138)
!169 = distinct !DILexicalBlock(scope: !151, file: !2, line: 130, column: 9)
!170 = !DILocation(line: 0, scope: !156, inlinedAt: !168)
!171 = !DILocation(line: 181, column: 9, scope: !172, inlinedAt: !168)
!172 = distinct !DILexicalBlock(scope: !173, file: !2, line: 181, column: 9)
!173 = distinct !DILexicalBlock(scope: !155, file: !2, line: 180, column: 5)
!174 = !DILocation(line: 184, column: 32, scope: !175, inlinedAt: !168)
!175 = distinct !DILexicalBlock(scope: !176, file: !2, line: 182, column: 13)
!176 = distinct !DILexicalBlock(scope: !172, file: !2, line: 181, column: 9)
!177 = !DILocation(line: 184, column: 42, scope: !175, inlinedAt: !168)
!178 = !DILocation(line: 184, column: 20, scope: !175, inlinedAt: !168)
!179 = !DILocation(line: 184, column: 13, scope: !175, inlinedAt: !168)
!180 = !DILocation(line: 184, column: 24, scope: !175, inlinedAt: !168)
!181 = !{!182, !182, i64 0}
!182 = !{!"double", !101, i64 0}
!183 = !DILocation(line: 181, column: 29, scope: !176, inlinedAt: !168)
!184 = !DILocation(line: 181, column: 23, scope: !176, inlinedAt: !168)
!185 = distinct !{!185, !171, !186, !187}
!186 = !DILocation(line: 186, column: 13, scope: !172, inlinedAt: !168)
!187 = !{!"llvm.loop.mustprogress"}
!188 = !DILocation(line: 180, column: 25, scope: !173, inlinedAt: !168)
!189 = !DILocation(line: 180, column: 19, scope: !173, inlinedAt: !168)
!190 = distinct !{!190, !154, !191, !187}
!191 = !DILocation(line: 186, column: 13, scope: !155, inlinedAt: !168)
!192 = !DILocation(line: 188, column: 14, scope: !193, inlinedAt: !168)
!193 = distinct !DILexicalBlock(scope: !194, file: !2, line: 187, column: 5)
!194 = distinct !DILexicalBlock(scope: !156, file: !2, line: 187, column: 5)
!195 = !DILocation(line: 189, column: 5, scope: !196, inlinedAt: !168)
!196 = distinct !DILexicalBlock(scope: !156, file: !2, line: 189, column: 5)
!197 = !DILocation(line: 190, column: 9, scope: !198, inlinedAt: !168)
!198 = distinct !DILexicalBlock(scope: !199, file: !2, line: 190, column: 9)
!199 = distinct !DILexicalBlock(scope: !196, file: !2, line: 189, column: 5)
!200 = !DILocation(line: 190, column: 29, scope: !201, inlinedAt: !168)
!201 = distinct !DILexicalBlock(scope: !198, file: !2, line: 190, column: 9)
!202 = !DILocation(line: 191, column: 20, scope: !201, inlinedAt: !168)
!203 = !DILocation(line: 191, column: 34, scope: !201, inlinedAt: !168)
!204 = !DILocation(line: 191, column: 27, scope: !201, inlinedAt: !168)
!205 = !DILocation(line: 191, column: 25, scope: !201, inlinedAt: !168)
!206 = !DILocation(line: 191, column: 18, scope: !201, inlinedAt: !168)
!207 = distinct !{!207, !197, !208, !187, !209, !210}
!208 = !DILocation(line: 191, column: 36, scope: !198, inlinedAt: !168)
!209 = !{!"llvm.loop.isvectorized", i32 1}
!210 = !{!"llvm.loop.unroll.runtime.disable"}
!211 = !DILocation(line: 189, column: 25, scope: !199, inlinedAt: !168)
!212 = !DILocation(line: 189, column: 19, scope: !199, inlinedAt: !168)
!213 = distinct !{!213, !195, !214, !187}
!214 = !DILocation(line: 191, column: 36, scope: !196, inlinedAt: !168)
!215 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !216)
!216 = distinct !DILocation(line: 132, column: 14, scope: !169, inlinedAt: !138)
!217 = !DILocalVariable(name: "a", arg: 1, scope: !218, file: !2, line: 246, type: !19)
!218 = distinct !DISubprogram(name: "dgefa", scope: !2, file: !2, line: 246, type: !219, scopeLine: 248, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !221)
!219 = !DISubroutineType(cc: DW_CC_nocall, types: !220)
!220 = !{null, !19, !16, !16, !22, !22, !16}
!221 = !{!217, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232}
!222 = !DILocalVariable(name: "lda", arg: 2, scope: !218, file: !2, line: 246, type: !16)
!223 = !DILocalVariable(name: "n", arg: 3, scope: !218, file: !2, line: 246, type: !16)
!224 = !DILocalVariable(name: "ipvt", arg: 4, scope: !218, file: !2, line: 246, type: !22)
!225 = !DILocalVariable(name: "info", arg: 5, scope: !218, file: !2, line: 246, type: !22)
!226 = !DILocalVariable(name: "roll", arg: 6, scope: !218, file: !2, line: 246, type: !16)
!227 = !DILocalVariable(name: "t", scope: !218, file: !2, line: 249, type: !20)
!228 = !DILocalVariable(name: "j", scope: !218, file: !2, line: 250, type: !16)
!229 = !DILocalVariable(name: "k", scope: !218, file: !2, line: 250, type: !16)
!230 = !DILocalVariable(name: "kp1", scope: !218, file: !2, line: 250, type: !16)
!231 = !DILocalVariable(name: "l", scope: !218, file: !2, line: 250, type: !16)
!232 = !DILocalVariable(name: "nm1", scope: !218, file: !2, line: 250, type: !16)
!233 = !DILocation(line: 0, scope: !218, inlinedAt: !234)
!234 = distinct !DILocation(line: 133, column: 9, scope: !169, inlinedAt: !138)
!235 = !DILocation(line: 265, column: 29, scope: !236, inlinedAt: !234)
!236 = distinct !DILexicalBlock(scope: !237, file: !2, line: 260, column: 17)
!237 = distinct !DILexicalBlock(scope: !238, file: !2, line: 259, column: 13)
!238 = distinct !DILexicalBlock(scope: !239, file: !2, line: 259, column: 13)
!239 = distinct !DILexicalBlock(scope: !240, file: !2, line: 258, column: 13)
!240 = distinct !DILexicalBlock(scope: !241, file: !2, line: 255, column: 9)
!241 = distinct !DILexicalBlock(scope: !218, file: !2, line: 254, column: 9)
!242 = !DILocation(line: 265, column: 40, scope: !236, inlinedAt: !234)
!243 = !DILocation(line: 265, column: 33, scope: !236, inlinedAt: !234)
!244 = !DILocalVariable(name: "n", arg: 1, scope: !245, file: !2, line: 825, type: !16)
!245 = distinct !DISubprogram(name: "idamax", scope: !2, file: !2, line: 825, type: !246, scopeLine: 827, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !248)
!246 = !DISubroutineType(types: !247)
!247 = !{!16, !16, !19, !16}
!248 = !{!244, !249, !250, !251, !252, !253, !254}
!249 = !DILocalVariable(name: "dx", arg: 2, scope: !245, file: !2, line: 825, type: !19)
!250 = !DILocalVariable(name: "incx", arg: 3, scope: !245, file: !2, line: 825, type: !16)
!251 = !DILocalVariable(name: "dmax", scope: !245, file: !2, line: 828, type: !20)
!252 = !DILocalVariable(name: "i", scope: !245, file: !2, line: 829, type: !16)
!253 = !DILocalVariable(name: "ix", scope: !245, file: !2, line: 829, type: !16)
!254 = !DILocalVariable(name: "itemp", scope: !245, file: !2, line: 829, type: !16)
!255 = !DILocation(line: 0, scope: !245, inlinedAt: !256)
!256 = distinct !DILocation(line: 265, column: 21, scope: !236, inlinedAt: !234)
!257 = !DILocation(line: 859, column: 29, scope: !258, inlinedAt: !256)
!258 = distinct !DILexicalBlock(scope: !259, file: !2, line: 854, column: 9)
!259 = distinct !DILexicalBlock(scope: !245, file: !2, line: 835, column: 8)
!260 = !DILocation(line: 859, column: 16, scope: !258, inlinedAt: !256)
!261 = !DILocation(line: 860, column: 9, scope: !262, inlinedAt: !256)
!262 = distinct !DILexicalBlock(scope: !258, file: !2, line: 860, column: 9)
!263 = !DILocation(line: 861, column: 29, scope: !264, inlinedAt: !256)
!264 = distinct !DILexicalBlock(scope: !265, file: !2, line: 861, column: 16)
!265 = distinct !DILexicalBlock(scope: !262, file: !2, line: 860, column: 9)
!266 = !DILocation(line: 861, column: 16, scope: !264, inlinedAt: !256)
!267 = !DILocation(line: 861, column: 36, scope: !264, inlinedAt: !256)
!268 = !DILocation(line: 861, column: 16, scope: !265, inlinedAt: !256)
!269 = !DILocation(line: 860, column: 29, scope: !265, inlinedAt: !256)
!270 = !DILocation(line: 860, column: 23, scope: !265, inlinedAt: !256)
!271 = distinct !{!271, !261, !272, !187}
!272 = !DILocation(line: 865, column: 17, scope: !262, inlinedAt: !256)
!273 = !DILocation(line: 261, column: 25, scope: !236, inlinedAt: !234)
!274 = !DILocation(line: 265, column: 38, scope: !236, inlinedAt: !234)
!275 = !DILocation(line: 265, column: 47, scope: !236, inlinedAt: !234)
!276 = !DILocation(line: 266, column: 17, scope: !236, inlinedAt: !234)
!277 = !DILocation(line: 266, column: 25, scope: !236, inlinedAt: !234)
!278 = !{!279, !279, i64 0}
!279 = !{!"int", !101, i64 0}
!280 = !DILocation(line: 271, column: 28, scope: !281, inlinedAt: !234)
!281 = distinct !DILexicalBlock(scope: !236, file: !2, line: 271, column: 21)
!282 = !DILocation(line: 271, column: 21, scope: !281, inlinedAt: !234)
!283 = !DILocation(line: 271, column: 32, scope: !281, inlinedAt: !234)
!284 = !DILocation(line: 271, column: 21, scope: !236, inlinedAt: !234)
!285 = !DILocation(line: 276, column: 27, scope: !286, inlinedAt: !234)
!286 = distinct !DILexicalBlock(scope: !287, file: !2, line: 276, column: 25)
!287 = distinct !DILexicalBlock(scope: !281, file: !2, line: 272, column: 21)
!288 = !DILocation(line: 276, column: 25, scope: !287, inlinedAt: !234)
!289 = !DILocation(line: 279, column: 36, scope: !290, inlinedAt: !234)
!290 = distinct !DILexicalBlock(scope: !286, file: !2, line: 277, column: 25)
!291 = !DILocation(line: 280, column: 36, scope: !290, inlinedAt: !234)
!292 = !DILocation(line: 281, column: 25, scope: !290, inlinedAt: !234)
!293 = !DILocation(line: 285, column: 30, scope: !287, inlinedAt: !234)
!294 = !DILocation(line: 285, column: 29, scope: !287, inlinedAt: !234)
!295 = !DILocation(line: 286, column: 30, scope: !287, inlinedAt: !234)
!296 = !DILocation(line: 286, column: 49, scope: !287, inlinedAt: !234)
!297 = !DILocation(line: 286, column: 40, scope: !287, inlinedAt: !234)
!298 = !DILocalVariable(name: "n", arg: 1, scope: !299, file: !2, line: 645, type: !16)
!299 = distinct !DISubprogram(name: "dscal_r", scope: !2, file: !2, line: 645, type: !300, scopeLine: 647, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !302)
!300 = !DISubroutineType(types: !301)
!301 = !{null, !16, !20, !19, !16}
!302 = !{!298, !303, !304, !305, !306, !307}
!303 = !DILocalVariable(name: "da", arg: 2, scope: !299, file: !2, line: 645, type: !20)
!304 = !DILocalVariable(name: "dx", arg: 3, scope: !299, file: !2, line: 645, type: !19)
!305 = !DILocalVariable(name: "incx", arg: 4, scope: !299, file: !2, line: 645, type: !16)
!306 = !DILocalVariable(name: "i", scope: !299, file: !2, line: 648, type: !16)
!307 = !DILocalVariable(name: "nincx", scope: !299, file: !2, line: 648, type: !16)
!308 = !DILocation(line: 0, scope: !299, inlinedAt: !309)
!309 = distinct !DILocation(line: 286, column: 21, scope: !287, inlinedAt: !234)
!310 = !DILocation(line: 665, column: 5, scope: !311, inlinedAt: !309)
!311 = distinct !DILexicalBlock(scope: !299, file: !2, line: 665, column: 5)
!312 = !DILocation(line: 665, column: 25, scope: !313, inlinedAt: !309)
!313 = distinct !DILexicalBlock(scope: !311, file: !2, line: 665, column: 5)
!314 = !DILocation(line: 666, column: 20, scope: !313, inlinedAt: !309)
!315 = !DILocation(line: 666, column: 19, scope: !313, inlinedAt: !309)
!316 = !DILocation(line: 666, column: 15, scope: !313, inlinedAt: !309)
!317 = distinct !{!317, !310, !318, !187, !209, !210}
!318 = !DILocation(line: 666, column: 24, scope: !311, inlinedAt: !309)
!319 = !DILocation(line: 665, column: 19, scope: !313, inlinedAt: !309)
!320 = distinct !{!320, !310, !318, !187, !210, !209}
!321 = !DILocation(line: 290, column: 21, scope: !322, inlinedAt: !234)
!322 = distinct !DILexicalBlock(scope: !287, file: !2, line: 290, column: 21)
!323 = !DILocation(line: 292, column: 34, scope: !324, inlinedAt: !234)
!324 = distinct !DILexicalBlock(scope: !325, file: !2, line: 291, column: 25)
!325 = distinct !DILexicalBlock(scope: !322, file: !2, line: 290, column: 21)
!326 = !DILocation(line: 292, column: 36, scope: !324, inlinedAt: !234)
!327 = !DILocation(line: 292, column: 29, scope: !324, inlinedAt: !234)
!328 = !DILocation(line: 293, column: 29, scope: !324, inlinedAt: !234)
!329 = !DILocation(line: 295, column: 49, scope: !330, inlinedAt: !234)
!330 = distinct !DILexicalBlock(scope: !331, file: !2, line: 294, column: 29)
!331 = distinct !DILexicalBlock(scope: !324, file: !2, line: 293, column: 29)
!332 = !DILocation(line: 295, column: 42, scope: !330, inlinedAt: !234)
!333 = !DILocation(line: 295, column: 40, scope: !330, inlinedAt: !234)
!334 = !DILocation(line: 296, column: 40, scope: !330, inlinedAt: !234)
!335 = !DILocation(line: 297, column: 29, scope: !330, inlinedAt: !234)
!336 = !DILocation(line: 298, column: 69, scope: !324, inlinedAt: !234)
!337 = !DILocation(line: 298, column: 60, scope: !324, inlinedAt: !234)
!338 = !DILocalVariable(name: "n", arg: 1, scope: !339, file: !2, line: 563, type: !16)
!339 = distinct !DISubprogram(name: "daxpy_r", scope: !2, file: !2, line: 563, type: !340, scopeLine: 565, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !342)
!340 = !DISubroutineType(types: !341)
!341 = !{null, !16, !20, !19, !16, !19, !16}
!342 = !{!338, !343, !344, !345, !346, !347, !348, !349, !350}
!343 = !DILocalVariable(name: "da", arg: 2, scope: !339, file: !2, line: 563, type: !20)
!344 = !DILocalVariable(name: "dx", arg: 3, scope: !339, file: !2, line: 563, type: !19)
!345 = !DILocalVariable(name: "incx", arg: 4, scope: !339, file: !2, line: 563, type: !16)
!346 = !DILocalVariable(name: "dy", arg: 5, scope: !339, file: !2, line: 563, type: !19)
!347 = !DILocalVariable(name: "incy", arg: 6, scope: !339, file: !2, line: 563, type: !16)
!348 = !DILocalVariable(name: "i", scope: !339, file: !2, line: 566, type: !16)
!349 = !DILocalVariable(name: "ix", scope: !339, file: !2, line: 566, type: !16)
!350 = !DILocalVariable(name: "iy", scope: !339, file: !2, line: 566, type: !16)
!351 = !DILocation(line: 0, scope: !339, inlinedAt: !352)
!352 = distinct !DILocation(line: 298, column: 25, scope: !324, inlinedAt: !234)
!353 = !DILocation(line: 568, column: 9, scope: !339, inlinedAt: !352)
!354 = !DILocation(line: 593, column: 5, scope: !355, inlinedAt: !352)
!355 = distinct !DILexicalBlock(scope: !339, file: !2, line: 593, column: 5)
!356 = !DILocation(line: 593, column: 24, scope: !357, inlinedAt: !352)
!357 = distinct !DILexicalBlock(scope: !355, file: !2, line: 593, column: 5)
!358 = !DILocation(line: 594, column: 17, scope: !357, inlinedAt: !352)
!359 = !DILocation(line: 594, column: 28, scope: !357, inlinedAt: !352)
!360 = !DILocation(line: 594, column: 23, scope: !357, inlinedAt: !352)
!361 = !DILocation(line: 594, column: 15, scope: !357, inlinedAt: !352)
!362 = distinct !{!362, !354, !363, !187, !209, !210}
!363 = !DILocation(line: 594, column: 32, scope: !355, inlinedAt: !352)
!364 = !DILocation(line: 593, column: 18, scope: !357, inlinedAt: !352)
!365 = distinct !{!365, !354, !363, !187, !210, !209}
!366 = !DILocation(line: 290, column: 43, scope: !325, inlinedAt: !234)
!367 = !DILocation(line: 290, column: 37, scope: !325, inlinedAt: !234)
!368 = distinct !{!368, !321, !369, !187}
!369 = !DILocation(line: 299, column: 25, scope: !322, inlinedAt: !234)
!370 = !DILocation(line: 259, column: 13, scope: !238, inlinedAt: !234)
!371 = !DILocation(line: 259, column: 27, scope: !237, inlinedAt: !234)
!372 = distinct !{!372, !370, !373, !187}
!373 = !DILocation(line: 303, column: 17, scope: !238, inlinedAt: !234)
!374 = !DILocation(line: 304, column: 19, scope: !240, inlinedAt: !234)
!375 = !DILocation(line: 305, column: 13, scope: !376, inlinedAt: !234)
!376 = distinct !DILexicalBlock(scope: !240, file: !2, line: 305, column: 13)
!377 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !378)
!378 = distinct !DILocation(line: 134, column: 19, scope: !169, inlinedAt: !138)
!379 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !378)
!380 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !381)
!381 = distinct !DILocation(line: 135, column: 14, scope: !169, inlinedAt: !138)
!382 = !DILocalVariable(name: "a", arg: 1, scope: !383, file: !2, line: 426, type: !19)
!383 = distinct !DISubprogram(name: "dgesl", scope: !2, file: !2, line: 426, type: !384, scopeLine: 428, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !386)
!384 = !DISubroutineType(types: !385)
!385 = !{null, !19, !16, !16, !22, !19, !16, !16}
!386 = !{!382, !387, !388, !389, !390, !391, !392, !393, !394, !395, !396, !397}
!387 = !DILocalVariable(name: "lda", arg: 2, scope: !383, file: !2, line: 426, type: !16)
!388 = !DILocalVariable(name: "n", arg: 3, scope: !383, file: !2, line: 426, type: !16)
!389 = !DILocalVariable(name: "ipvt", arg: 4, scope: !383, file: !2, line: 426, type: !22)
!390 = !DILocalVariable(name: "b", arg: 5, scope: !383, file: !2, line: 426, type: !19)
!391 = !DILocalVariable(name: "job", arg: 6, scope: !383, file: !2, line: 426, type: !16)
!392 = !DILocalVariable(name: "roll", arg: 7, scope: !383, file: !2, line: 426, type: !16)
!393 = !DILocalVariable(name: "t", scope: !383, file: !2, line: 429, type: !20)
!394 = !DILocalVariable(name: "k", scope: !383, file: !2, line: 430, type: !16)
!395 = !DILocalVariable(name: "kb", scope: !383, file: !2, line: 430, type: !16)
!396 = !DILocalVariable(name: "l", scope: !383, file: !2, line: 430, type: !16)
!397 = !DILocalVariable(name: "nm1", scope: !383, file: !2, line: 430, type: !16)
!398 = !DILocation(line: 0, scope: !383, inlinedAt: !399)
!399 = distinct !DILocation(line: 136, column: 9, scope: !169, inlinedAt: !138)
!400 = !DILocation(line: 444, column: 25, scope: !401, inlinedAt: !399)
!401 = distinct !DILexicalBlock(scope: !402, file: !2, line: 443, column: 21)
!402 = distinct !DILexicalBlock(scope: !403, file: !2, line: 442, column: 17)
!403 = distinct !DILexicalBlock(scope: !404, file: !2, line: 442, column: 17)
!404 = distinct !DILexicalBlock(scope: !405, file: !2, line: 441, column: 17)
!405 = distinct !DILexicalBlock(scope: !406, file: !2, line: 436, column: 13)
!406 = distinct !DILexicalBlock(scope: !407, file: !2, line: 435, column: 13)
!407 = distinct !DILexicalBlock(scope: !408, file: !2, line: 433, column: 9)
!408 = distinct !DILexicalBlock(scope: !383, file: !2, line: 432, column: 9)
!409 = !DILocation(line: 445, column: 25, scope: !401, inlinedAt: !399)
!410 = !DILocation(line: 446, column: 27, scope: !411, inlinedAt: !399)
!411 = distinct !DILexicalBlock(scope: !401, file: !2, line: 446, column: 25)
!412 = !DILocation(line: 446, column: 25, scope: !401, inlinedAt: !399)
!413 = !DILocation(line: 448, column: 32, scope: !414, inlinedAt: !399)
!414 = distinct !DILexicalBlock(scope: !411, file: !2, line: 447, column: 25)
!415 = !DILocation(line: 448, column: 30, scope: !414, inlinedAt: !399)
!416 = !DILocation(line: 449, column: 30, scope: !414, inlinedAt: !399)
!417 = !DILocation(line: 450, column: 25, scope: !414, inlinedAt: !399)
!418 = !DILocation(line: 451, column: 33, scope: !401, inlinedAt: !399)
!419 = !DILocation(line: 451, column: 47, scope: !401, inlinedAt: !399)
!420 = !DILocation(line: 451, column: 49, scope: !401, inlinedAt: !399)
!421 = !DILocation(line: 451, column: 40, scope: !401, inlinedAt: !399)
!422 = !DILocation(line: 451, column: 56, scope: !401, inlinedAt: !399)
!423 = !DILocation(line: 0, scope: !339, inlinedAt: !424)
!424 = distinct !DILocation(line: 451, column: 21, scope: !401, inlinedAt: !399)
!425 = !DILocation(line: 568, column: 9, scope: !339, inlinedAt: !424)
!426 = !DILocation(line: 451, column: 30, scope: !401, inlinedAt: !399)
!427 = !DILocation(line: 593, column: 5, scope: !355, inlinedAt: !424)
!428 = !DILocation(line: 593, column: 24, scope: !357, inlinedAt: !424)
!429 = !DILocation(line: 594, column: 17, scope: !357, inlinedAt: !424)
!430 = !DILocation(line: 594, column: 28, scope: !357, inlinedAt: !424)
!431 = !DILocation(line: 594, column: 23, scope: !357, inlinedAt: !424)
!432 = !DILocation(line: 594, column: 15, scope: !357, inlinedAt: !424)
!433 = distinct !{!433, !427, !434, !187, !209, !210}
!434 = !DILocation(line: 594, column: 32, scope: !355, inlinedAt: !424)
!435 = !DILocation(line: 593, column: 18, scope: !357, inlinedAt: !424)
!436 = distinct !{!436, !427, !434, !187, !210, !209}
!437 = !DILocation(line: 442, column: 31, scope: !402, inlinedAt: !399)
!438 = !DILocation(line: 442, column: 17, scope: !403, inlinedAt: !399)
!439 = distinct !{!439, !438, !440, !187}
!440 = !DILocation(line: 452, column: 21, scope: !403, inlinedAt: !399)
!441 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !378)
!442 = !DILocation(line: 456, column: 13, scope: !443, inlinedAt: !399)
!443 = distinct !DILexicalBlock(scope: !405, file: !2, line: 456, column: 13)
!444 = !DILocation(line: 458, column: 29, scope: !445, inlinedAt: !399)
!445 = distinct !DILexicalBlock(scope: !446, file: !2, line: 457, column: 17)
!446 = distinct !DILexicalBlock(scope: !443, file: !2, line: 456, column: 13)
!447 = !DILocation(line: 458, column: 23, scope: !445, inlinedAt: !399)
!448 = !DILocation(line: 459, column: 24, scope: !445, inlinedAt: !399)
!449 = !DILocation(line: 459, column: 34, scope: !445, inlinedAt: !399)
!450 = !DILocation(line: 459, column: 36, scope: !445, inlinedAt: !399)
!451 = !DILocation(line: 459, column: 29, scope: !445, inlinedAt: !399)
!452 = !DILocation(line: 459, column: 28, scope: !445, inlinedAt: !399)
!453 = !DILocation(line: 459, column: 22, scope: !445, inlinedAt: !399)
!454 = !DILocation(line: 460, column: 21, scope: !445, inlinedAt: !399)
!455 = !DILocation(line: 461, column: 30, scope: !445, inlinedAt: !399)
!456 = !DILocation(line: 0, scope: !339, inlinedAt: !457)
!457 = distinct !DILocation(line: 461, column: 17, scope: !445, inlinedAt: !399)
!458 = !DILocation(line: 568, column: 11, scope: !459, inlinedAt: !457)
!459 = distinct !DILexicalBlock(scope: !339, file: !2, line: 568, column: 9)
!460 = !DILocation(line: 568, column: 9, scope: !339, inlinedAt: !457)
!461 = !DILocation(line: 593, column: 5, scope: !355, inlinedAt: !457)
!462 = !DILocation(line: 593, column: 24, scope: !357, inlinedAt: !457)
!463 = !DILocation(line: 594, column: 17, scope: !357, inlinedAt: !457)
!464 = !DILocation(line: 594, column: 28, scope: !357, inlinedAt: !457)
!465 = !DILocation(line: 594, column: 23, scope: !357, inlinedAt: !457)
!466 = !DILocation(line: 594, column: 15, scope: !357, inlinedAt: !457)
!467 = distinct !{!467, !461, !468, !187, !209, !210}
!468 = !DILocation(line: 594, column: 32, scope: !355, inlinedAt: !457)
!469 = !DILocation(line: 593, column: 18, scope: !357, inlinedAt: !457)
!470 = distinct !{!470, !461, !468, !187, !210, !209}
!471 = !DILocation(line: 456, column: 29, scope: !446, inlinedAt: !399)
!472 = distinct !{!472, !442, !473, !187}
!473 = !DILocation(line: 462, column: 17, scope: !443, inlinedAt: !399)
!474 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !216)
!475 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !381)
!476 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !216)
!477 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !381)
!478 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !479)
!479 = distinct !DILocation(line: 137, column: 19, scope: !169, inlinedAt: !138)
!480 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !479)
!481 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !479)
!482 = !DILocation(line: 134, column: 27, scope: !169, inlinedAt: !138)
!483 = !DILocation(line: 137, column: 27, scope: !169, inlinedAt: !138)
!484 = !DILocation(line: 137, column: 16, scope: !169, inlinedAt: !138)
!485 = !DILocation(line: 129, column: 23, scope: !151, inlinedAt: !138)
!486 = distinct !{!486, !153, !487, !187}
!487 = !DILocation(line: 138, column: 9, scope: !152, inlinedAt: !138)
!488 = !DILocation(line: 139, column: 5, scope: !489, inlinedAt: !138)
!489 = distinct !DILexicalBlock(scope: !116, file: !2, line: 139, column: 5)
!490 = !DILocation(line: 180, column: 5, scope: !155, inlinedAt: !491)
!491 = distinct !DILocation(line: 141, column: 9, scope: !492, inlinedAt: !138)
!492 = distinct !DILexicalBlock(scope: !493, file: !2, line: 140, column: 9)
!493 = distinct !DILexicalBlock(scope: !489, file: !2, line: 139, column: 5)
!494 = !DILocation(line: 0, scope: !156, inlinedAt: !491)
!495 = !DILocation(line: 181, column: 9, scope: !172, inlinedAt: !491)
!496 = !DILocation(line: 184, column: 32, scope: !175, inlinedAt: !491)
!497 = !DILocation(line: 184, column: 42, scope: !175, inlinedAt: !491)
!498 = !DILocation(line: 184, column: 20, scope: !175, inlinedAt: !491)
!499 = !DILocation(line: 184, column: 13, scope: !175, inlinedAt: !491)
!500 = !DILocation(line: 184, column: 24, scope: !175, inlinedAt: !491)
!501 = !DILocation(line: 181, column: 29, scope: !176, inlinedAt: !491)
!502 = !DILocation(line: 181, column: 23, scope: !176, inlinedAt: !491)
!503 = distinct !{!503, !495, !504, !187}
!504 = !DILocation(line: 186, column: 13, scope: !172, inlinedAt: !491)
!505 = !DILocation(line: 180, column: 25, scope: !173, inlinedAt: !491)
!506 = !DILocation(line: 180, column: 19, scope: !173, inlinedAt: !491)
!507 = distinct !{!507, !490, !508, !187}
!508 = !DILocation(line: 186, column: 13, scope: !155, inlinedAt: !491)
!509 = !DILocation(line: 188, column: 14, scope: !193, inlinedAt: !491)
!510 = !DILocation(line: 189, column: 5, scope: !196, inlinedAt: !491)
!511 = !DILocation(line: 190, column: 9, scope: !198, inlinedAt: !491)
!512 = !DILocation(line: 190, column: 29, scope: !201, inlinedAt: !491)
!513 = !DILocation(line: 191, column: 20, scope: !201, inlinedAt: !491)
!514 = !DILocation(line: 191, column: 34, scope: !201, inlinedAt: !491)
!515 = !DILocation(line: 191, column: 27, scope: !201, inlinedAt: !491)
!516 = !DILocation(line: 191, column: 25, scope: !201, inlinedAt: !491)
!517 = !DILocation(line: 191, column: 18, scope: !201, inlinedAt: !491)
!518 = distinct !{!518, !511, !519, !187, !209, !210}
!519 = !DILocation(line: 191, column: 36, scope: !198, inlinedAt: !491)
!520 = !DILocation(line: 189, column: 25, scope: !199, inlinedAt: !491)
!521 = !DILocation(line: 189, column: 19, scope: !199, inlinedAt: !491)
!522 = distinct !{!522, !510, !523, !187}
!523 = !DILocation(line: 191, column: 36, scope: !196, inlinedAt: !491)
!524 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !525)
!525 = distinct !DILocation(line: 142, column: 14, scope: !492, inlinedAt: !138)
!526 = !DILocation(line: 0, scope: !218, inlinedAt: !527)
!527 = distinct !DILocation(line: 143, column: 9, scope: !492, inlinedAt: !138)
!528 = !DILocation(line: 0, scope: !241, inlinedAt: !527)
!529 = !DILocation(line: 319, column: 29, scope: !530, inlinedAt: !527)
!530 = distinct !DILexicalBlock(scope: !531, file: !2, line: 314, column: 17)
!531 = distinct !DILexicalBlock(scope: !532, file: !2, line: 313, column: 13)
!532 = distinct !DILexicalBlock(scope: !533, file: !2, line: 313, column: 13)
!533 = distinct !DILexicalBlock(scope: !534, file: !2, line: 312, column: 13)
!534 = distinct !DILexicalBlock(scope: !241, file: !2, line: 309, column: 9)
!535 = !DILocation(line: 319, column: 40, scope: !530, inlinedAt: !527)
!536 = !DILocation(line: 319, column: 33, scope: !530, inlinedAt: !527)
!537 = !DILocation(line: 0, scope: !245, inlinedAt: !538)
!538 = distinct !DILocation(line: 319, column: 21, scope: !530, inlinedAt: !527)
!539 = !DILocation(line: 859, column: 29, scope: !258, inlinedAt: !538)
!540 = !DILocation(line: 859, column: 16, scope: !258, inlinedAt: !538)
!541 = !DILocation(line: 860, column: 9, scope: !262, inlinedAt: !538)
!542 = !DILocation(line: 861, column: 29, scope: !264, inlinedAt: !538)
!543 = !DILocation(line: 861, column: 16, scope: !264, inlinedAt: !538)
!544 = !DILocation(line: 861, column: 36, scope: !264, inlinedAt: !538)
!545 = !DILocation(line: 861, column: 16, scope: !265, inlinedAt: !538)
!546 = !DILocation(line: 860, column: 29, scope: !265, inlinedAt: !538)
!547 = !DILocation(line: 860, column: 23, scope: !265, inlinedAt: !538)
!548 = distinct !{!548, !541, !549, !187}
!549 = !DILocation(line: 865, column: 17, scope: !262, inlinedAt: !538)
!550 = !DILocation(line: 315, column: 25, scope: !530, inlinedAt: !527)
!551 = !DILocation(line: 319, column: 38, scope: !530, inlinedAt: !527)
!552 = !DILocation(line: 319, column: 47, scope: !530, inlinedAt: !527)
!553 = !DILocation(line: 320, column: 17, scope: !530, inlinedAt: !527)
!554 = !DILocation(line: 320, column: 25, scope: !530, inlinedAt: !527)
!555 = !DILocation(line: 325, column: 28, scope: !556, inlinedAt: !527)
!556 = distinct !DILexicalBlock(scope: !530, file: !2, line: 325, column: 21)
!557 = !DILocation(line: 325, column: 21, scope: !556, inlinedAt: !527)
!558 = !DILocation(line: 325, column: 32, scope: !556, inlinedAt: !527)
!559 = !DILocation(line: 325, column: 21, scope: !530, inlinedAt: !527)
!560 = !DILocation(line: 330, column: 27, scope: !561, inlinedAt: !527)
!561 = distinct !DILexicalBlock(scope: !562, file: !2, line: 330, column: 25)
!562 = distinct !DILexicalBlock(scope: !556, file: !2, line: 326, column: 21)
!563 = !DILocation(line: 330, column: 25, scope: !562, inlinedAt: !527)
!564 = !DILocation(line: 333, column: 36, scope: !565, inlinedAt: !527)
!565 = distinct !DILexicalBlock(scope: !561, file: !2, line: 331, column: 25)
!566 = !DILocation(line: 334, column: 36, scope: !565, inlinedAt: !527)
!567 = !DILocation(line: 335, column: 25, scope: !565, inlinedAt: !527)
!568 = !DILocation(line: 339, column: 30, scope: !562, inlinedAt: !527)
!569 = !DILocation(line: 339, column: 29, scope: !562, inlinedAt: !527)
!570 = !DILocation(line: 340, column: 31, scope: !562, inlinedAt: !527)
!571 = !DILocation(line: 340, column: 50, scope: !562, inlinedAt: !527)
!572 = !DILocation(line: 340, column: 41, scope: !562, inlinedAt: !527)
!573 = !DILocalVariable(name: "n", arg: 1, scope: !574, file: !2, line: 782, type: !16)
!574 = distinct !DISubprogram(name: "dscal_ur", scope: !2, file: !2, line: 782, type: !300, scopeLine: 784, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !575)
!575 = !{!573, !576, !577, !578, !579, !580, !581}
!576 = !DILocalVariable(name: "da", arg: 2, scope: !574, file: !2, line: 782, type: !20)
!577 = !DILocalVariable(name: "dx", arg: 3, scope: !574, file: !2, line: 782, type: !19)
!578 = !DILocalVariable(name: "incx", arg: 4, scope: !574, file: !2, line: 782, type: !16)
!579 = !DILocalVariable(name: "i", scope: !574, file: !2, line: 785, type: !16)
!580 = !DILocalVariable(name: "m", scope: !574, file: !2, line: 785, type: !16)
!581 = !DILocalVariable(name: "nincx", scope: !574, file: !2, line: 785, type: !16)
!582 = !DILocation(line: 0, scope: !574, inlinedAt: !583)
!583 = distinct !DILocation(line: 340, column: 21, scope: !562, inlinedAt: !527)
!584 = !DILocation(line: 803, column: 11, scope: !585, inlinedAt: !583)
!585 = distinct !DILexicalBlock(scope: !574, file: !2, line: 803, column: 9)
!586 = !DILocation(line: 803, column: 9, scope: !574, inlinedAt: !583)
!587 = !DILocation(line: 805, column: 23, scope: !588, inlinedAt: !583)
!588 = distinct !DILexicalBlock(scope: !589, file: !2, line: 805, column: 9)
!589 = distinct !DILexicalBlock(scope: !590, file: !2, line: 805, column: 9)
!590 = distinct !DILexicalBlock(scope: !585, file: !2, line: 804, column: 9)
!591 = !DILocation(line: 805, column: 9, scope: !589, inlinedAt: !583)
!592 = !DILocation(line: 805, column: 29, scope: !588, inlinedAt: !583)
!593 = !DILocation(line: 806, column: 24, scope: !588, inlinedAt: !583)
!594 = !DILocation(line: 806, column: 23, scope: !588, inlinedAt: !583)
!595 = !DILocation(line: 806, column: 19, scope: !588, inlinedAt: !583)
!596 = distinct !{!596, !591, !597, !187, !209, !210}
!597 = !DILocation(line: 806, column: 28, scope: !589, inlinedAt: !583)
!598 = distinct !{!598, !591, !597, !187, !210, !209}
!599 = !DILocation(line: 807, column: 15, scope: !600, inlinedAt: !583)
!600 = distinct !DILexicalBlock(scope: !590, file: !2, line: 807, column: 13)
!601 = !DILocation(line: 807, column: 13, scope: !590, inlinedAt: !583)
!602 = !DILocation(line: 810, column: 5, scope: !603, inlinedAt: !583)
!603 = distinct !DILexicalBlock(scope: !574, file: !2, line: 810, column: 5)
!604 = !DILocation(line: 812, column: 20, scope: !605, inlinedAt: !583)
!605 = distinct !DILexicalBlock(scope: !606, file: !2, line: 811, column: 9)
!606 = distinct !DILexicalBlock(scope: !603, file: !2, line: 810, column: 5)
!607 = !DILocation(line: 813, column: 26, scope: !605, inlinedAt: !583)
!608 = !DILocation(line: 813, column: 22, scope: !605, inlinedAt: !583)
!609 = !DILocation(line: 814, column: 26, scope: !605, inlinedAt: !583)
!610 = !DILocation(line: 814, column: 22, scope: !605, inlinedAt: !583)
!611 = !DILocation(line: 815, column: 26, scope: !605, inlinedAt: !583)
!612 = !DILocation(line: 815, column: 22, scope: !605, inlinedAt: !583)
!613 = !DILocation(line: 816, column: 26, scope: !605, inlinedAt: !583)
!614 = !DILocation(line: 816, column: 22, scope: !605, inlinedAt: !583)
!615 = !DILocation(line: 816, column: 17, scope: !605, inlinedAt: !583)
!616 = distinct !{!616, !602, !617, !187, !209, !210}
!617 = !DILocation(line: 817, column: 9, scope: !603, inlinedAt: !583)
!618 = !DILocation(line: 812, column: 19, scope: !605, inlinedAt: !583)
!619 = !DILocation(line: 812, column: 15, scope: !605, inlinedAt: !583)
!620 = !DILocation(line: 814, column: 21, scope: !605, inlinedAt: !583)
!621 = !DILocation(line: 814, column: 17, scope: !605, inlinedAt: !583)
!622 = !DILocation(line: 816, column: 21, scope: !605, inlinedAt: !583)
!623 = !DILocation(line: 810, column: 30, scope: !606, inlinedAt: !583)
!624 = !DILocation(line: 810, column: 19, scope: !606, inlinedAt: !583)
!625 = distinct !{!625, !602, !617, !187, !209}
!626 = !DILocation(line: 344, column: 21, scope: !627, inlinedAt: !527)
!627 = distinct !DILexicalBlock(scope: !562, file: !2, line: 344, column: 21)
!628 = !DILocation(line: 346, column: 34, scope: !629, inlinedAt: !527)
!629 = distinct !DILexicalBlock(scope: !630, file: !2, line: 345, column: 25)
!630 = distinct !DILexicalBlock(scope: !627, file: !2, line: 344, column: 21)
!631 = !DILocation(line: 346, column: 36, scope: !629, inlinedAt: !527)
!632 = !DILocation(line: 346, column: 29, scope: !629, inlinedAt: !527)
!633 = !DILocation(line: 347, column: 29, scope: !629, inlinedAt: !527)
!634 = !DILocation(line: 349, column: 49, scope: !635, inlinedAt: !527)
!635 = distinct !DILexicalBlock(scope: !636, file: !2, line: 348, column: 29)
!636 = distinct !DILexicalBlock(scope: !629, file: !2, line: 347, column: 29)
!637 = !DILocation(line: 349, column: 42, scope: !635, inlinedAt: !527)
!638 = !DILocation(line: 349, column: 40, scope: !635, inlinedAt: !527)
!639 = !DILocation(line: 350, column: 40, scope: !635, inlinedAt: !527)
!640 = !DILocation(line: 351, column: 29, scope: !635, inlinedAt: !527)
!641 = !DILocation(line: 352, column: 70, scope: !629, inlinedAt: !527)
!642 = !DILocation(line: 352, column: 61, scope: !629, inlinedAt: !527)
!643 = !DILocalVariable(name: "n", arg: 1, scope: !644, file: !2, line: 675, type: !16)
!644 = distinct !DISubprogram(name: "daxpy_ur", scope: !2, file: !2, line: 675, type: !340, scopeLine: 677, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !645)
!645 = !{!643, !646, !647, !648, !649, !650, !651, !652, !653, !654}
!646 = !DILocalVariable(name: "da", arg: 2, scope: !644, file: !2, line: 675, type: !20)
!647 = !DILocalVariable(name: "dx", arg: 3, scope: !644, file: !2, line: 675, type: !19)
!648 = !DILocalVariable(name: "incx", arg: 4, scope: !644, file: !2, line: 675, type: !16)
!649 = !DILocalVariable(name: "dy", arg: 5, scope: !644, file: !2, line: 675, type: !19)
!650 = !DILocalVariable(name: "incy", arg: 6, scope: !644, file: !2, line: 675, type: !16)
!651 = !DILocalVariable(name: "i", scope: !644, file: !2, line: 678, type: !16)
!652 = !DILocalVariable(name: "ix", scope: !644, file: !2, line: 678, type: !16)
!653 = !DILocalVariable(name: "iy", scope: !644, file: !2, line: 678, type: !16)
!654 = !DILocalVariable(name: "m", scope: !644, file: !2, line: 678, type: !16)
!655 = !DILocation(line: 0, scope: !644, inlinedAt: !656)
!656 = distinct !DILocation(line: 352, column: 25, scope: !629, inlinedAt: !527)
!657 = !DILocation(line: 680, column: 9, scope: !644, inlinedAt: !656)
!658 = !DILocation(line: 706, column: 10, scope: !644, inlinedAt: !656)
!659 = !DILocation(line: 709, column: 21, scope: !660, inlinedAt: !656)
!660 = distinct !DILexicalBlock(scope: !661, file: !2, line: 708, column: 9)
!661 = distinct !DILexicalBlock(scope: !662, file: !2, line: 708, column: 9)
!662 = distinct !DILexicalBlock(scope: !663, file: !2, line: 707, column: 9)
!663 = distinct !DILexicalBlock(scope: !644, file: !2, line: 706, column: 10)
!664 = !DILocation(line: 709, column: 32, scope: !660, inlinedAt: !656)
!665 = !DILocation(line: 709, column: 27, scope: !660, inlinedAt: !656)
!666 = !DILocation(line: 709, column: 19, scope: !660, inlinedAt: !656)
!667 = !DILocation(line: 708, column: 9, scope: !661, inlinedAt: !656)
!668 = distinct !{!668, !667, !669, !187}
!669 = !DILocation(line: 709, column: 36, scope: !661, inlinedAt: !656)
!670 = distinct !{!670, !667, !669, !187}
!671 = !DILocation(line: 710, column: 13, scope: !662, inlinedAt: !656)
!672 = !DILocation(line: 713, column: 5, scope: !673, inlinedAt: !656)
!673 = distinct !DILexicalBlock(scope: !644, file: !2, line: 713, column: 5)
!674 = !DILocation(line: 715, column: 17, scope: !675, inlinedAt: !656)
!675 = distinct !DILexicalBlock(scope: !676, file: !2, line: 714, column: 9)
!676 = distinct !DILexicalBlock(scope: !673, file: !2, line: 713, column: 5)
!677 = !DILocation(line: 715, column: 28, scope: !675, inlinedAt: !656)
!678 = !DILocation(line: 716, column: 23, scope: !675, inlinedAt: !656)
!679 = !DILocation(line: 716, column: 19, scope: !675, inlinedAt: !656)
!680 = !DILocation(line: 716, column: 32, scope: !675, inlinedAt: !656)
!681 = !DILocation(line: 717, column: 23, scope: !675, inlinedAt: !656)
!682 = !DILocation(line: 717, column: 19, scope: !675, inlinedAt: !656)
!683 = !DILocation(line: 717, column: 32, scope: !675, inlinedAt: !656)
!684 = !DILocation(line: 718, column: 23, scope: !675, inlinedAt: !656)
!685 = !DILocation(line: 718, column: 19, scope: !675, inlinedAt: !656)
!686 = !DILocation(line: 718, column: 32, scope: !675, inlinedAt: !656)
!687 = !DILocation(line: 718, column: 17, scope: !675, inlinedAt: !656)
!688 = distinct !{!688, !672, !689, !187, !209, !210}
!689 = !DILocation(line: 719, column: 9, scope: !673, inlinedAt: !656)
!690 = !DILocation(line: 715, column: 23, scope: !675, inlinedAt: !656)
!691 = !DILocation(line: 715, column: 15, scope: !675, inlinedAt: !656)
!692 = !DILocation(line: 716, column: 27, scope: !675, inlinedAt: !656)
!693 = !DILocation(line: 716, column: 17, scope: !675, inlinedAt: !656)
!694 = !DILocation(line: 717, column: 27, scope: !675, inlinedAt: !656)
!695 = !DILocation(line: 717, column: 17, scope: !675, inlinedAt: !656)
!696 = !DILocation(line: 718, column: 27, scope: !675, inlinedAt: !656)
!697 = !DILocation(line: 713, column: 30, scope: !676, inlinedAt: !656)
!698 = !DILocation(line: 713, column: 19, scope: !676, inlinedAt: !656)
!699 = distinct !{!699, !672, !689, !187, !210, !209}
!700 = !DILocation(line: 344, column: 43, scope: !630, inlinedAt: !527)
!701 = !DILocation(line: 344, column: 37, scope: !630, inlinedAt: !527)
!702 = distinct !{!702, !626, !703, !187}
!703 = !DILocation(line: 353, column: 25, scope: !627, inlinedAt: !527)
!704 = !DILocation(line: 356, column: 29, scope: !556, inlinedAt: !527)
!705 = !DILocation(line: 313, column: 13, scope: !532, inlinedAt: !527)
!706 = !DILocation(line: 313, column: 27, scope: !531, inlinedAt: !527)
!707 = distinct !{!707, !705, !708, !187}
!708 = !DILocation(line: 357, column: 17, scope: !532, inlinedAt: !527)
!709 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !525)
!710 = !DILocation(line: 358, column: 9, scope: !534, inlinedAt: !527)
!711 = !DILocation(line: 358, column: 19, scope: !534, inlinedAt: !527)
!712 = !DILocation(line: 359, column: 13, scope: !713, inlinedAt: !527)
!713 = distinct !DILexicalBlock(scope: !534, file: !2, line: 359, column: 13)
!714 = !DILocation(line: 359, column: 32, scope: !713, inlinedAt: !527)
!715 = !DILocation(line: 359, column: 13, scope: !534, inlinedAt: !527)
!716 = !DILocation(line: 362, column: 5, scope: !218, inlinedAt: !527)
!717 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !718)
!718 = distinct !DILocation(line: 144, column: 19, scope: !492, inlinedAt: !138)
!719 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !718)
!720 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !721)
!721 = distinct !DILocation(line: 145, column: 14, scope: !492, inlinedAt: !138)
!722 = !DILocation(line: 0, scope: !383, inlinedAt: !723)
!723 = distinct !DILocation(line: 146, column: 9, scope: !492, inlinedAt: !138)
!724 = !DILocation(line: 505, column: 25, scope: !725, inlinedAt: !723)
!725 = distinct !DILexicalBlock(scope: !726, file: !2, line: 504, column: 21)
!726 = distinct !DILexicalBlock(scope: !727, file: !2, line: 503, column: 17)
!727 = distinct !DILexicalBlock(scope: !728, file: !2, line: 503, column: 17)
!728 = distinct !DILexicalBlock(scope: !729, file: !2, line: 502, column: 17)
!729 = distinct !DILexicalBlock(scope: !730, file: !2, line: 497, column: 13)
!730 = distinct !DILexicalBlock(scope: !731, file: !2, line: 496, column: 13)
!731 = distinct !DILexicalBlock(scope: !408, file: !2, line: 494, column: 9)
!732 = !DILocation(line: 506, column: 25, scope: !725, inlinedAt: !723)
!733 = !DILocation(line: 507, column: 27, scope: !734, inlinedAt: !723)
!734 = distinct !DILexicalBlock(scope: !725, file: !2, line: 507, column: 25)
!735 = !DILocation(line: 507, column: 25, scope: !725, inlinedAt: !723)
!736 = !DILocation(line: 509, column: 32, scope: !737, inlinedAt: !723)
!737 = distinct !DILexicalBlock(scope: !734, file: !2, line: 508, column: 25)
!738 = !DILocation(line: 509, column: 30, scope: !737, inlinedAt: !723)
!739 = !DILocation(line: 510, column: 30, scope: !737, inlinedAt: !723)
!740 = !DILocation(line: 511, column: 25, scope: !737, inlinedAt: !723)
!741 = !DILocation(line: 512, column: 34, scope: !725, inlinedAt: !723)
!742 = !DILocation(line: 512, column: 31, scope: !725, inlinedAt: !723)
!743 = !DILocation(line: 512, column: 48, scope: !725, inlinedAt: !723)
!744 = !DILocation(line: 512, column: 50, scope: !725, inlinedAt: !723)
!745 = !DILocation(line: 512, column: 41, scope: !725, inlinedAt: !723)
!746 = !DILocation(line: 512, column: 57, scope: !725, inlinedAt: !723)
!747 = !DILocation(line: 0, scope: !644, inlinedAt: !748)
!748 = distinct !DILocation(line: 512, column: 21, scope: !725, inlinedAt: !723)
!749 = !DILocation(line: 680, column: 9, scope: !644, inlinedAt: !748)
!750 = !DILocation(line: 706, column: 12, scope: !663, inlinedAt: !748)
!751 = !DILocation(line: 706, column: 10, scope: !644, inlinedAt: !748)
!752 = !DILocation(line: 709, column: 21, scope: !660, inlinedAt: !748)
!753 = !DILocation(line: 709, column: 32, scope: !660, inlinedAt: !748)
!754 = !DILocation(line: 709, column: 27, scope: !660, inlinedAt: !748)
!755 = !DILocation(line: 709, column: 19, scope: !660, inlinedAt: !748)
!756 = !DILocation(line: 708, column: 23, scope: !660, inlinedAt: !748)
!757 = !DILocation(line: 708, column: 9, scope: !661, inlinedAt: !748)
!758 = distinct !{!758, !757, !759, !187}
!759 = !DILocation(line: 709, column: 36, scope: !661, inlinedAt: !748)
!760 = !DILocation(line: 710, column: 13, scope: !662, inlinedAt: !748)
!761 = !DILocation(line: 713, column: 19, scope: !676, inlinedAt: !748)
!762 = !DILocation(line: 713, column: 5, scope: !673, inlinedAt: !748)
!763 = !DILocation(line: 715, column: 17, scope: !675, inlinedAt: !748)
!764 = !DILocation(line: 715, column: 28, scope: !675, inlinedAt: !748)
!765 = !DILocation(line: 716, column: 23, scope: !675, inlinedAt: !748)
!766 = !DILocation(line: 716, column: 19, scope: !675, inlinedAt: !748)
!767 = !DILocation(line: 716, column: 32, scope: !675, inlinedAt: !748)
!768 = !DILocation(line: 717, column: 23, scope: !675, inlinedAt: !748)
!769 = !DILocation(line: 717, column: 19, scope: !675, inlinedAt: !748)
!770 = !DILocation(line: 717, column: 32, scope: !675, inlinedAt: !748)
!771 = !DILocation(line: 718, column: 23, scope: !675, inlinedAt: !748)
!772 = !DILocation(line: 718, column: 19, scope: !675, inlinedAt: !748)
!773 = !DILocation(line: 718, column: 32, scope: !675, inlinedAt: !748)
!774 = !DILocation(line: 718, column: 17, scope: !675, inlinedAt: !748)
!775 = distinct !{!775, !762, !776, !187, !209, !210}
!776 = !DILocation(line: 719, column: 9, scope: !673, inlinedAt: !748)
!777 = !DILocation(line: 715, column: 23, scope: !675, inlinedAt: !748)
!778 = !DILocation(line: 715, column: 15, scope: !675, inlinedAt: !748)
!779 = !DILocation(line: 717, column: 27, scope: !675, inlinedAt: !748)
!780 = !DILocation(line: 717, column: 17, scope: !675, inlinedAt: !748)
!781 = !DILocation(line: 713, column: 30, scope: !676, inlinedAt: !748)
!782 = distinct !{!782, !762, !776, !187, !210, !209}
!783 = !DILocation(line: 503, column: 31, scope: !726, inlinedAt: !723)
!784 = !DILocation(line: 503, column: 17, scope: !727, inlinedAt: !723)
!785 = distinct !{!785, !784, !786, !187}
!786 = !DILocation(line: 513, column: 21, scope: !727, inlinedAt: !723)
!787 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !525)
!788 = !DILocation(line: 517, column: 13, scope: !789, inlinedAt: !723)
!789 = distinct !DILexicalBlock(scope: !729, file: !2, line: 517, column: 13)
!790 = !DILocation(line: 519, column: 29, scope: !791, inlinedAt: !723)
!791 = distinct !DILexicalBlock(scope: !792, file: !2, line: 518, column: 17)
!792 = distinct !DILexicalBlock(scope: !789, file: !2, line: 517, column: 13)
!793 = !DILocation(line: 519, column: 23, scope: !791, inlinedAt: !723)
!794 = !DILocation(line: 520, column: 24, scope: !791, inlinedAt: !723)
!795 = !DILocation(line: 520, column: 34, scope: !791, inlinedAt: !723)
!796 = !DILocation(line: 520, column: 36, scope: !791, inlinedAt: !723)
!797 = !DILocation(line: 520, column: 29, scope: !791, inlinedAt: !723)
!798 = !DILocation(line: 520, column: 28, scope: !791, inlinedAt: !723)
!799 = !DILocation(line: 520, column: 22, scope: !791, inlinedAt: !723)
!800 = !DILocation(line: 521, column: 21, scope: !791, inlinedAt: !723)
!801 = !DILocation(line: 522, column: 31, scope: !791, inlinedAt: !723)
!802 = !DILocation(line: 0, scope: !644, inlinedAt: !803)
!803 = distinct !DILocation(line: 522, column: 17, scope: !791, inlinedAt: !723)
!804 = !DILocation(line: 680, column: 11, scope: !805, inlinedAt: !803)
!805 = distinct !DILexicalBlock(scope: !644, file: !2, line: 680, column: 9)
!806 = !DILocation(line: 680, column: 9, scope: !644, inlinedAt: !803)
!807 = !DILocation(line: 706, column: 12, scope: !663, inlinedAt: !803)
!808 = !DILocation(line: 706, column: 10, scope: !644, inlinedAt: !803)
!809 = !DILocation(line: 709, column: 21, scope: !660, inlinedAt: !803)
!810 = !DILocation(line: 709, column: 32, scope: !660, inlinedAt: !803)
!811 = !DILocation(line: 709, column: 27, scope: !660, inlinedAt: !803)
!812 = !DILocation(line: 709, column: 19, scope: !660, inlinedAt: !803)
!813 = !DILocation(line: 708, column: 23, scope: !660, inlinedAt: !803)
!814 = !DILocation(line: 708, column: 9, scope: !661, inlinedAt: !803)
!815 = distinct !{!815, !814, !816, !187}
!816 = !DILocation(line: 709, column: 36, scope: !661, inlinedAt: !803)
!817 = !DILocation(line: 710, column: 13, scope: !662, inlinedAt: !803)
!818 = !DILocation(line: 713, column: 19, scope: !676, inlinedAt: !803)
!819 = !DILocation(line: 713, column: 5, scope: !673, inlinedAt: !803)
!820 = !DILocation(line: 715, column: 17, scope: !675, inlinedAt: !803)
!821 = !DILocation(line: 715, column: 28, scope: !675, inlinedAt: !803)
!822 = !DILocation(line: 716, column: 23, scope: !675, inlinedAt: !803)
!823 = !DILocation(line: 716, column: 19, scope: !675, inlinedAt: !803)
!824 = !DILocation(line: 716, column: 32, scope: !675, inlinedAt: !803)
!825 = !DILocation(line: 717, column: 23, scope: !675, inlinedAt: !803)
!826 = !DILocation(line: 717, column: 19, scope: !675, inlinedAt: !803)
!827 = !DILocation(line: 717, column: 32, scope: !675, inlinedAt: !803)
!828 = !DILocation(line: 718, column: 23, scope: !675, inlinedAt: !803)
!829 = !DILocation(line: 718, column: 19, scope: !675, inlinedAt: !803)
!830 = !DILocation(line: 718, column: 32, scope: !675, inlinedAt: !803)
!831 = !DILocation(line: 718, column: 17, scope: !675, inlinedAt: !803)
!832 = distinct !{!832, !819, !833, !187, !209, !210}
!833 = !DILocation(line: 719, column: 9, scope: !673, inlinedAt: !803)
!834 = !DILocation(line: 715, column: 23, scope: !675, inlinedAt: !803)
!835 = !DILocation(line: 715, column: 15, scope: !675, inlinedAt: !803)
!836 = !DILocation(line: 717, column: 27, scope: !675, inlinedAt: !803)
!837 = !DILocation(line: 717, column: 17, scope: !675, inlinedAt: !803)
!838 = !DILocation(line: 713, column: 30, scope: !676, inlinedAt: !803)
!839 = distinct !{!839, !819, !833, !187, !210, !209}
!840 = !DILocation(line: 517, column: 29, scope: !792, inlinedAt: !723)
!841 = distinct !{!841, !788, !842, !187}
!842 = !DILocation(line: 523, column: 17, scope: !789, inlinedAt: !723)
!843 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !718)
!844 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !721)
!845 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !721)
!846 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !847)
!847 = distinct !DILocation(line: 147, column: 19, scope: !492, inlinedAt: !138)
!848 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !847)
!849 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !847)
!850 = !DILocation(line: 144, column: 27, scope: !492, inlinedAt: !138)
!851 = !DILocation(line: 147, column: 27, scope: !492, inlinedAt: !138)
!852 = !DILocation(line: 147, column: 16, scope: !492, inlinedAt: !138)
!853 = !DILocation(line: 139, column: 23, scope: !493, inlinedAt: !138)
!854 = !DILocation(line: 139, column: 15, scope: !493, inlinedAt: !138)
!855 = distinct !{!855, !488, !856, !187}
!856 = !DILocation(line: 148, column: 9, scope: !489, inlinedAt: !138)
!857 = !DILocation(line: 874, column: 26, scope: !144, inlinedAt: !858)
!858 = distinct !DILocation(line: 149, column: 12, scope: !116, inlinedAt: !138)
!859 = !DILocation(line: 874, column: 20, scope: !144, inlinedAt: !858)
!860 = !DILocation(line: 874, column: 33, scope: !144, inlinedAt: !858)
!861 = !DILocation(line: 149, column: 20, scope: !116, inlinedAt: !138)
!862 = !DILocation(line: 150, column: 15, scope: !863, inlinedAt: !138)
!863 = distinct !DILexicalBlock(scope: !116, file: !2, line: 150, column: 9)
!864 = !DILocation(line: 150, column: 20, scope: !863, inlinedAt: !138)
!865 = !DILocation(line: 150, column: 29, scope: !863, inlinedAt: !138)
!866 = !DILocation(line: 150, column: 36, scope: !863, inlinedAt: !138)
!867 = !DILocation(line: 150, column: 9, scope: !116, inlinedAt: !138)
!868 = !DILocation(line: 165, column: 5, scope: !116, inlinedAt: !138)
!869 = !DILocation(line: 152, column: 15, scope: !116, inlinedAt: !138)
!870 = !DILocation(line: 152, column: 14, scope: !116, inlinedAt: !138)
!871 = !DILocation(line: 152, column: 20, scope: !116, inlinedAt: !138)
!872 = !DILocation(line: 152, column: 31, scope: !116, inlinedAt: !138)
!873 = !DILocation(line: 152, column: 24, scope: !116, inlinedAt: !138)
!874 = !DILocation(line: 153, column: 21, scope: !116, inlinedAt: !138)
!875 = !DILocation(line: 153, column: 28, scope: !116, inlinedAt: !138)
!876 = !DILocation(line: 156, column: 15, scope: !877, inlinedAt: !138)
!877 = distinct !DILexicalBlock(scope: !116, file: !2, line: 156, column: 9)
!878 = !DILocation(line: 161, column: 30, scope: !116, inlinedAt: !138)
!879 = !DILocation(line: 162, column: 17, scope: !116, inlinedAt: !138)
!880 = !DILocation(line: 158, column: 18, scope: !881, inlinedAt: !138)
!881 = distinct !DILexicalBlock(scope: !116, file: !2, line: 158, column: 9)
!882 = !DILocation(line: 162, column: 36, scope: !116, inlinedAt: !138)
!883 = !DILocation(line: 161, column: 37, scope: !116, inlinedAt: !138)
!884 = !DILocation(line: 162, column: 24, scope: !116, inlinedAt: !138)
!885 = !DILocation(line: 162, column: 46, scope: !116, inlinedAt: !138)
!886 = !DILocation(line: 160, column: 5, scope: !116, inlinedAt: !138)
!887 = !DILocation(line: 104, column: 37, scope: !83)
!888 = !DILocation(line: 105, column: 18, scope: !83)
!889 = distinct !{!889, !114, !890, !187}
!890 = !DILocation(line: 105, column: 20, scope: !83)
!891 = !DILocation(line: 106, column: 14, scope: !83)
!892 = !DILocation(line: 106, column: 9, scope: !83)
!893 = !DILocation(line: 107, column: 9, scope: !83)
!894 = !DILocation(line: 108, column: 1, scope: !83)
!895 = !DISubprogram(name: "printf", scope: !896, file: !896, line: 332, type: !897, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!896 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "5b917eded35ce2507d1e294bf8cb74d7")
!897 = !DISubroutineType(types: !898)
!898 = !{!16, !899, null}
!899 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !900)
!900 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !901, size: 64)
!901 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!902 = !DISubprogram(name: "malloc", scope: !903, file: !903, line: 539, type: !904, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!903 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f0db66726d35051e5af2525f5b33bd81")
!904 = !DISubroutineType(types: !905)
!905 = !{!11, !13}
!906 = !DISubprogram(name: "free", scope: !903, file: !903, line: 565, type: !907, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!907 = !DISubroutineType(types: !908)
!908 = !{null, !11}
!909 = !DISubprogram(name: "clock", scope: !910, file: !910, line: 72, type: !911, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!910 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "2dc9fb937b28c900f98919b5c35320c2")
!911 = !DISubroutineType(types: !912)
!912 = !{!913}
!913 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !914, line: 7, baseType: !23)
!914 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
