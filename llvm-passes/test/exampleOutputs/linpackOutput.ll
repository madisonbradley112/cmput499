; ModuleID = '../test/testInputs/linpack.ll'
source_filename = "../test/testInputs/linpack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [25 x i8] c"Memory required:  %ldK.\0A\00", align 1, !dbg !0
@mempool = internal unnamed_addr global ptr null, align 8, !dbg !7
@.str.3 = private unnamed_addr constant [36 x i8] c"\0A\0ALINPACK benchmark, %s precision.\0A\00", align 1, !dbg !34
@.str.4 = private unnamed_addr constant [7 x i8] c"Double\00", align 1, !dbg !39
@.str.5 = private unnamed_addr constant [32 x i8] c"Machine precision:  %d digits.\0A\00", align 1, !dbg !44
@.str.6 = private unnamed_addr constant [21 x i8] c"Array size %d X %d.\0A\00", align 1, !dbg !49
@.str.11 = private unnamed_addr constant [43 x i8] c"%8ld %6.2f %6.2f%% %6.2f%% %6.2f%%  %9.3f\0A\00", align 1, !dbg !71
@str = private unnamed_addr constant [42 x i8] c"Average rolled and unrolled performance:\0A\00", align 1
@str.1 = private unnamed_addr constant [51 x i8] c"    Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS\00", align 1
@str.2 = private unnamed_addr constant [53 x i8] c"----------------------------------------------------\00", align 1
@str.3 = private unnamed_addr constant [51 x i8] c"Not enough memory available for given array size.\0A\00", align 1

; Function Attrs: alwaysinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !81 {
entry:
  %norma.i = alloca double, align 8
  %info.i = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr null, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32 200, metadata !88, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32 200, metadata !88, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32 100, metadata !88, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32 200, metadata !88, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i64 40000, metadata !89, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i64 322400, metadata !90, metadata !DIExpression()), !dbg !87
  %call14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i64 noundef 315), !dbg !91
  call void @llvm.dbg.value(metadata i64 322400, metadata !92, metadata !DIExpression()), !dbg !87
  %call17 = tail call noalias dereferenceable_or_null(322400) ptr @malloc(i64 noundef 322400) #10, !dbg !93
  store ptr %call17, ptr @mempool, align 8, !dbg !95
  %cmp18 = icmp eq ptr %call17, null, !dbg !96
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !97

if.then20:                                        ; preds = %entry
  %puts17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.3), !dbg !98
  br label %return, !dbg !100

if.end22:                                         ; preds = %entry
  %call23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, ptr noundef nonnull @.str.4), !dbg !101
  %call24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef 15), !dbg !102
  %call25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 200, i32 noundef 200), !dbg !103
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !104
  %puts15 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1), !dbg !105
  %puts16 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.2), !dbg !106
  call void @llvm.dbg.value(metadata i64 1, metadata !107, metadata !DIExpression()), !dbg !87
  br label %while.cond, !dbg !108

while.cond:                                       ; preds = %linpack.exit, %if.end22
  %nreps.0 = phi i64 [ 1, %if.end22 ], [ %mul32, %linpack.exit ], !dbg !87
  call void @llvm.dbg.value(metadata i64 %nreps.0, metadata !107, metadata !DIExpression()), !dbg !87
  call void @llvm.lifetime.start.p0(i64 8, ptr %norma.i), !dbg !109
  call void @llvm.lifetime.start.p0(i64 4, ptr %info.i), !dbg !109
  call void @llvm.dbg.value(metadata i64 %nreps.0, metadata !114, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i32 200, metadata !115, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i32 200, metadata !116, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i32 100, metadata !117, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i64 40000, metadata !118, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double 0x4124F49555555555, metadata !119, metadata !DIExpression()), !dbg !109
  %0 = load ptr, ptr @mempool, align 8, !dbg !120
  call void @llvm.dbg.value(metadata ptr %0, metadata !121, metadata !DIExpression()), !dbg !109
  %add.ptr.i = getelementptr inbounds double, ptr %0, i64 40000, !dbg !122
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !123, metadata !DIExpression()), !dbg !109
  %arrayidx.i = getelementptr inbounds double, ptr %0, i64 40200, !dbg !124
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !125, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !126, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !127, metadata !DIExpression()), !dbg !109
  %call.i43 = tail call i64 @clock() #11, !dbg !128
  %conv.i44 = sitofp i64 %call.i43 to double, !dbg !133
  %div.i45 = fdiv double %conv.i44, 1.000000e+06, !dbg !134
  call void @llvm.dbg.value(metadata double %div.i45, metadata !135, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata i64 0, metadata !136, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !126, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !127, metadata !DIExpression()), !dbg !109
  %cmp62.i = icmp sgt i64 %nreps.0, 0, !dbg !137
  br i1 %cmp62.i, label %for.body.i, label %for.cond20.preheader.i, !dbg !140

for.cond20.preheader.i:                           ; preds = %dgesl.exit, %while.cond
  %tdgefa.0.lcssa.i = phi double [ 0.000000e+00, %while.cond ], [ %add.i, %dgesl.exit ], !dbg !109
  %tdgesl.0.lcssa.i = phi double [ 0.000000e+00, %while.cond ], [ %add19.i, %dgesl.exit ], !dbg !109
  call void @llvm.dbg.value(metadata i64 0, metadata !136, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double %tdgesl.0.lcssa.i, metadata !126, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double %tdgefa.0.lcssa.i, metadata !127, metadata !DIExpression()), !dbg !109
  %cmp2167.i = icmp sgt i64 %nreps.0, 0, !dbg !141
  br i1 %cmp2167.i, label %for.body23.i, label %for.end34.i, !dbg !144

for.body.i:                                       ; preds = %while.cond, %dgesl.exit
  %i.065.i = phi i64 [ %inc.i, %dgesl.exit ], [ 0, %while.cond ]
  %tdgesl.064.i = phi double [ %add19.i, %dgesl.exit ], [ 0.000000e+00, %while.cond ]
  %tdgefa.063.i = phi double [ %add.i, %dgesl.exit ], [ 0.000000e+00, %while.cond ]
  call void @llvm.dbg.value(metadata i64 %i.065.i, metadata !136, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double %tdgesl.064.i, metadata !126, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double %tdgefa.063.i, metadata !127, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata ptr %norma.i, metadata !145, metadata !DIExpression(DW_OP_deref)), !dbg !109
  call void @llvm.dbg.value(metadata ptr %0, metadata !146, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 200, metadata !153, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 100, metadata !154, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !155, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata ptr %norma.i, metadata !156, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 1325, metadata !157, metadata !DIExpression()), !dbg !150
  store double 0.000000e+00, ptr %norma.i, align 8, !dbg !158
  call void @llvm.dbg.value(metadata i32 0, metadata !159, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 1325, metadata !157, metadata !DIExpression()), !dbg !150
  br label %for.cond1.preheader.i, !dbg !160

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %for.body.i
  %indvars.iv46.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next47.i, %for.inc17.i ]
  %init.038.i = phi i32 [ 1325, %for.body.i ], [ %.lcssa, %for.inc17.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv46.i, metadata !159, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 %init.038.i, metadata !157, metadata !DIExpression()), !dbg !150
  %1 = mul nuw nsw i64 %indvars.iv46.i, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !162, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 %init.038.i, metadata !157, metadata !DIExpression()), !dbg !150
  br label %for.body3.i, !dbg !163

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i ]
  %init.136.i = phi i32 [ %init.038.i, %for.cond1.preheader.i ], [ %3, %for.body3.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !162, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 %init.136.i, metadata !157, metadata !DIExpression()), !dbg !150
  %2 = mul nuw nsw i32 %init.136.i, 3125
  %3 = and i32 %2, 65535
  call void @llvm.dbg.value(metadata i32 %3, metadata !157, metadata !DIExpression()), !dbg !150
  %addconv.i = add nsw i32 %3, -32768, !dbg !166
  %sub.i46 = sitofp i32 %addconv.i to double, !dbg !166
  %div.i47 = fmul double %sub.i46, 0x3F10000000000000, !dbg !169
  %4 = add nuw nsw i64 %indvars.iv.i, %1, !dbg !170
  %arrayidx.i48 = getelementptr inbounds double, ptr %0, i64 %4, !dbg !171
  store double %div.i47, ptr %arrayidx.i48, align 8, !dbg !172
  %5 = load double, ptr %norma.i, align 8, !dbg !173
  %cmp11.i = fcmp ogt double %div.i47, %5, !dbg !174
  %div..i = select i1 %cmp11.i, double %div.i47, double %5, !dbg !175
  store double %div..i, ptr %norma.i, align 8, !dbg !176
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !177
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !162, metadata !DIExpression()), !dbg !150
  %exitcond.not.i49 = icmp eq i64 %indvars.iv.next.i, 100, !dbg !178
  br i1 %exitcond.not.i49, label %for.inc17.i, label %for.body3.i, !dbg !163, !llvm.loop !179

for.inc17.i:                                      ; preds = %for.body3.i
  %.lcssa = phi i32 [ %3, %for.body3.i ]
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1, !dbg !182
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next47.i, metadata !159, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i32 %.lcssa, metadata !157, metadata !DIExpression()), !dbg !150
  %exitcond50.not.i = icmp eq i64 %indvars.iv.next47.i, 100, !dbg !183
  br i1 %exitcond50.not.i, label %for.body23.preheader.i, label %for.cond1.preheader.i, !dbg !160, !llvm.loop !184

for.body23.preheader.i:                           ; preds = %for.inc17.i
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(800) %add.ptr.i, i8 0, i64 800, i1 false), !dbg !186
  call void @llvm.dbg.value(metadata i64 poison, metadata !162, metadata !DIExpression()), !dbg !150
  br label %for.cond33.preheader.i, !dbg !189

for.cond33.preheader.i:                           ; preds = %for.inc49.i, %for.body23.preheader.i
  %indvars.iv59.i = phi i64 [ 0, %for.body23.preheader.i ], [ %indvars.iv.next60.i, %for.inc49.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv59.i, metadata !159, metadata !DIExpression()), !dbg !150
  %6 = mul nuw nsw i64 %indvars.iv59.i, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !162, metadata !DIExpression()), !dbg !150
  br label %for.body36.i, !dbg !191

for.body36.i:                                     ; preds = %for.body36.i, %for.cond33.preheader.i
  %indvars.iv54.i = phi i64 [ 0, %for.cond33.preheader.i ], [ %indvars.iv.next55.1.i, %for.body36.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv54.i, metadata !162, metadata !DIExpression()), !dbg !150
  %arrayidx38.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv54.i, !dbg !194
  %7 = load double, ptr %arrayidx38.i, align 8, !dbg !194
  %8 = add nuw nsw i64 %indvars.iv54.i, %6, !dbg !196
  %arrayidx42.i = getelementptr inbounds double, ptr %0, i64 %8, !dbg !197
  %9 = load double, ptr %arrayidx42.i, align 8, !dbg !197
  %add43.i = fadd double %7, %9, !dbg !198
  store double %add43.i, ptr %arrayidx38.i, align 8, !dbg !199
  %indvars.iv.next55.i = or i64 %indvars.iv54.i, 1, !dbg !200
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next55.i, metadata !162, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next55.i, metadata !162, metadata !DIExpression()), !dbg !150
  %arrayidx38.1.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next55.i, !dbg !194
  %10 = load double, ptr %arrayidx38.1.i, align 8, !dbg !194
  %11 = add nuw nsw i64 %indvars.iv.next55.i, %6, !dbg !196
  %arrayidx42.1.i = getelementptr inbounds double, ptr %0, i64 %11, !dbg !197
  %12 = load double, ptr %arrayidx42.1.i, align 8, !dbg !197
  %add43.1.i = fadd double %10, %12, !dbg !198
  store double %add43.1.i, ptr %arrayidx38.1.i, align 8, !dbg !199
  %indvars.iv.next55.1.i = add nuw nsw i64 %indvars.iv54.i, 2, !dbg !200
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next55.1.i, metadata !162, metadata !DIExpression()), !dbg !150
  %exitcond58.not.1.i = icmp eq i64 %indvars.iv.next55.1.i, 100, !dbg !201
  br i1 %exitcond58.not.1.i, label %for.inc49.i, label %for.body36.i, !dbg !191, !llvm.loop !202

for.inc49.i:                                      ; preds = %for.body36.i
  %indvars.iv.next60.i = add nuw nsw i64 %indvars.iv59.i, 1, !dbg !204
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next60.i, metadata !159, metadata !DIExpression()), !dbg !150
  %exitcond63.not.i = icmp eq i64 %indvars.iv.next60.i, 100, !dbg !205
  br i1 %exitcond63.not.i, label %matgen.exit, label %for.cond33.preheader.i, !dbg !189, !llvm.loop !206

matgen.exit:                                      ; preds = %for.inc49.i
  %call.i25 = tail call i64 @clock() #11, !dbg !208
  %conv.i26 = sitofp i64 %call.i25 to double, !dbg !210
  call void @llvm.dbg.value(metadata double %div.i27, metadata !211, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata ptr %info.i, metadata !212, metadata !DIExpression(DW_OP_deref)), !dbg !109
  call void @llvm.dbg.value(metadata ptr %0, metadata !213, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 200, metadata !219, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 100, metadata !220, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !221, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata ptr %info.i, metadata !222, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 1, metadata !223, metadata !DIExpression()), !dbg !217
  store i32 0, ptr %info.i, align 4, !dbg !224
  call void @llvm.dbg.value(metadata i32 99, metadata !226, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 99, metadata !226, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !227, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !227, metadata !DIExpression()), !dbg !217
  br label %for.body.i85

for.body.i85:                                     ; preds = %for.inc78.i, %matgen.exit
  %indvars.iv196.i = phi i64 [ %indvars.iv.next197.i, %for.inc78.i ], [ 0, %matgen.exit ]
  %indvars.iv.i86 = phi i64 [ %indvars.iv.next.i88, %for.inc78.i ], [ 1, %matgen.exit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv196.i, metadata !227, metadata !DIExpression()), !dbg !217
  %indvars.iv.next197.i = add nuw nsw i64 %indvars.iv196.i, 1, !dbg !228
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next197.i, metadata !234, metadata !DIExpression()), !dbg !217
  %13 = mul nuw nsw i64 %indvars.iv196.i, 200, !dbg !235
  %14 = mul nuw nsw i64 %indvars.iv196.i, 201, !dbg !236
  %arrayidx.i87 = getelementptr inbounds double, ptr %0, i64 %14, !dbg !237
  %15 = trunc i64 %indvars.iv196.i to i32, !dbg !238
  %16 = sub i32 100, %15, !dbg !238
  call void @llvm.dbg.value(metadata i32 %16, metadata !239, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata ptr %arrayidx.i87, metadata !245, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i32 1, metadata !246, metadata !DIExpression()), !dbg !243
  %cmp.i110 = icmp slt i32 %16, 1, !dbg !247
  br i1 %cmp.i110, label %idamax.exit146, label %if.else.i111, !dbg !249

if.else.i111:                                     ; preds = %for.body.i85
  call void @llvm.dbg.value(metadata i32 0, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double poison, metadata !251, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i32 1, metadata !252, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i32 0, metadata !250, metadata !DIExpression()), !dbg !243
  %cmp1623.not.i112 = icmp eq i32 %16, 1, !dbg !253
  br i1 %cmp1623.not.i112, label %idamax.exit146, label %for.body17.preheader.i113, !dbg !258

for.body17.preheader.i113:                        ; preds = %if.else.i111
  %17 = load double, ptr %arrayidx.i87, align 8, !dbg !259
  %18 = call double @llvm.fabs.f64(double %17), !dbg !260
  call void @llvm.dbg.value(metadata double %18, metadata !251, metadata !DIExpression()), !dbg !243
  %wide.trip.count.i114 = zext i32 %16 to i64, !dbg !253
  %19 = add nsw i64 %wide.trip.count.i114, -1, !dbg !258
  %xtraiter.i115 = and i64 %19, 1, !dbg !258
  %20 = icmp eq i32 %16, 2, !dbg !258
  br i1 %20, label %return.loopexit.unr-lcssa.i135, label %for.body17.preheader.new.i116, !dbg !258

for.body17.preheader.new.i116:                    ; preds = %for.body17.preheader.i113
  %unroll_iter.i117 = and i64 %19, -2, !dbg !258
  br label %for.body17.i118, !dbg !258

for.body17.i118:                                  ; preds = %for.body17.i118, %for.body17.preheader.new.i116
  %indvars.iv.i119 = phi i64 [ 1, %for.body17.preheader.new.i116 ], [ %indvars.iv.next.1.i132, %for.body17.i118 ]
  %itemp.226.i120 = phi i32 [ 0, %for.body17.preheader.new.i116 ], [ %itemp.3.1.i131, %for.body17.i118 ]
  %dmax.224.i121 = phi double [ %18, %for.body17.preheader.new.i116 ], [ %dmax.3.1.i130, %for.body17.i118 ]
  %niter.i122 = phi i64 [ 0, %for.body17.preheader.new.i116 ], [ %niter.next.1.i133, %for.body17.i118 ]
  call void @llvm.dbg.value(metadata i32 %itemp.226.i120, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i119, metadata !252, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double %dmax.224.i121, metadata !251, metadata !DIExpression()), !dbg !243
  %arrayidx19.i123 = getelementptr inbounds double, ptr %arrayidx.i87, i64 %indvars.iv.i119, !dbg !261
  %21 = load double, ptr %arrayidx19.i123, align 8, !dbg !261
  %22 = call double @llvm.fabs.f64(double %21), !dbg !263
  %cmp20.i124 = fcmp ogt double %22, %dmax.224.i121, !dbg !264
  %dmax.3.i125 = select i1 %cmp20.i124, double %22, double %dmax.224.i121, !dbg !265
  %23 = trunc i64 %indvars.iv.i119 to i32, !dbg !265
  %itemp.3.i126 = select i1 %cmp20.i124, i32 %23, i32 %itemp.226.i120, !dbg !265
  call void @llvm.dbg.value(metadata i32 %itemp.3.i126, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double %dmax.3.i125, metadata !251, metadata !DIExpression()), !dbg !243
  %indvars.iv.next.i127 = add nuw nsw i64 %indvars.iv.i119, 1, !dbg !266
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i127, metadata !252, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i32 %itemp.3.i126, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i127, metadata !252, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double %dmax.3.i125, metadata !251, metadata !DIExpression()), !dbg !243
  %arrayidx19.1.i128 = getelementptr inbounds double, ptr %arrayidx.i87, i64 %indvars.iv.next.i127, !dbg !261
  %24 = load double, ptr %arrayidx19.1.i128, align 8, !dbg !261
  %25 = call double @llvm.fabs.f64(double %24), !dbg !263
  %cmp20.1.i129 = fcmp ogt double %25, %dmax.3.i125, !dbg !264
  %dmax.3.1.i130 = select i1 %cmp20.1.i129, double %25, double %dmax.3.i125, !dbg !265
  %26 = trunc i64 %indvars.iv.next.i127 to i32, !dbg !265
  %itemp.3.1.i131 = select i1 %cmp20.1.i129, i32 %26, i32 %itemp.3.i126, !dbg !265
  call void @llvm.dbg.value(metadata i32 %itemp.3.1.i131, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double %dmax.3.1.i130, metadata !251, metadata !DIExpression()), !dbg !243
  %indvars.iv.next.1.i132 = add nuw nsw i64 %indvars.iv.i119, 2, !dbg !266
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i132, metadata !252, metadata !DIExpression()), !dbg !243
  %niter.next.1.i133 = add i64 %niter.i122, 2, !dbg !258
  %niter.ncmp.1.i134 = icmp eq i64 %niter.next.1.i133, %unroll_iter.i117, !dbg !258
  br i1 %niter.ncmp.1.i134, label %return.loopexit.unr-lcssa.i135, label %for.body17.i118, !dbg !258, !llvm.loop !267

return.loopexit.unr-lcssa.i135:                   ; preds = %for.body17.i118, %for.body17.preheader.i113
  %itemp.3.lcssa.ph.i136 = phi i32 [ undef, %for.body17.preheader.i113 ], [ %itemp.3.1.i131, %for.body17.i118 ]
  %indvars.iv.unr.i137 = phi i64 [ 1, %for.body17.preheader.i113 ], [ %indvars.iv.next.1.i132, %for.body17.i118 ]
  %itemp.226.unr.i138 = phi i32 [ 0, %for.body17.preheader.i113 ], [ %itemp.3.1.i131, %for.body17.i118 ]
  %dmax.224.unr.i139 = phi double [ %18, %for.body17.preheader.i113 ], [ %dmax.3.1.i130, %for.body17.i118 ]
  %lcmp.mod.not.i140 = icmp eq i64 %xtraiter.i115, 0, !dbg !258
  br i1 %lcmp.mod.not.i140, label %idamax.exit146, label %for.body17.epil.i141, !dbg !258

for.body17.epil.i141:                             ; preds = %return.loopexit.unr-lcssa.i135
  call void @llvm.dbg.value(metadata i32 %itemp.226.unr.i138, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i137, metadata !252, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double %dmax.224.unr.i139, metadata !251, metadata !DIExpression()), !dbg !243
  %arrayidx19.epil.i142 = getelementptr inbounds double, ptr %arrayidx.i87, i64 %indvars.iv.unr.i137, !dbg !261
  %27 = load double, ptr %arrayidx19.epil.i142, align 8, !dbg !261
  %28 = call double @llvm.fabs.f64(double %27), !dbg !263
  %cmp20.epil.i143 = fcmp ogt double %28, %dmax.224.unr.i139, !dbg !264
  %29 = trunc i64 %indvars.iv.unr.i137 to i32, !dbg !265
  %itemp.3.epil.i144 = select i1 %cmp20.epil.i143, i32 %29, i32 %itemp.226.unr.i138, !dbg !265
  call void @llvm.dbg.value(metadata i32 %itemp.3.epil.i144, metadata !250, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata double poison, metadata !251, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i137, metadata !252, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !243
  br label %idamax.exit146, !dbg !269

idamax.exit146:                                   ; preds = %for.body.i85, %if.else.i111, %return.loopexit.unr-lcssa.i135, %for.body17.epil.i141
  %retval.0.i145 = phi i32 [ -1, %for.body.i85 ], [ 0, %if.else.i111 ], [ %itemp.3.lcssa.ph.i136, %return.loopexit.unr-lcssa.i135 ], [ %itemp.3.epil.i144, %for.body17.epil.i141 ], !dbg !243
  %30 = trunc i64 %indvars.iv196.i to i32, !dbg !270
  %add5.i = add nsw i32 %retval.0.i145, %30, !dbg !270
  call void @llvm.dbg.value(metadata i32 %add5.i, metadata !271, metadata !DIExpression()), !dbg !217
  %arrayidx7.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv196.i, !dbg !272
  store i32 %add5.i, ptr %arrayidx7.i, align 4, !dbg !273
  %31 = sext i32 %add5.i to i64, !dbg !274
  %32 = add nsw i64 %13, %31, !dbg !274
  %arrayidx11.i = getelementptr inbounds double, ptr %0, i64 %32, !dbg !276
  %33 = load double, ptr %arrayidx11.i, align 8, !dbg !276
  %cmp12.i = fcmp une double %33, 0.000000e+00, !dbg !277
  br i1 %cmp12.i, label %if.then13.i, label %if.else.i, !dbg !278

if.then13.i:                                      ; preds = %idamax.exit146
  %cmp14.not.i = icmp eq i32 %retval.0.i145, 0, !dbg !279
  br i1 %cmp14.not.i, label %if.end.i89, label %if.then15.i, !dbg !282

if.then15.i:                                      ; preds = %if.then13.i
  call void @llvm.dbg.value(metadata double %33, metadata !283, metadata !DIExpression()), !dbg !217
  %34 = load double, ptr %arrayidx.i87, align 8, !dbg !284
  store double %34, ptr %arrayidx11.i, align 8, !dbg !286
  store double %33, ptr %arrayidx.i87, align 8, !dbg !287
  br label %if.end.i89, !dbg !288

if.end.i89:                                       ; preds = %if.then15.i, %if.then13.i
  %35 = load double, ptr %arrayidx.i87, align 8, !dbg !289
  %div.i90 = fdiv double -1.000000e+00, %35, !dbg !290
  call void @llvm.dbg.value(metadata double %div.i90, metadata !283, metadata !DIExpression()), !dbg !217
  %36 = sub nuw nsw i64 99, %indvars.iv196.i, !dbg !291
  %37 = add nuw nsw i64 %14, 1, !dbg !292
  %arrayidx42.i91 = getelementptr inbounds double, ptr %0, i64 %37, !dbg !293
  %38 = trunc i64 %36 to i32, !dbg !294
  call void @llvm.dbg.value(metadata i32 %38, metadata !295, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata double %div.i90, metadata !301, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata ptr %arrayidx42.i91, metadata !302, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i32 1, metadata !303, metadata !DIExpression()), !dbg !299
  %cmp.i147 = icmp slt i32 %38, 1, !dbg !304
  br i1 %cmp.i147, label %dscal_r.exit, label %for.body10.preheader.i, !dbg !306

for.body10.preheader.i:                           ; preds = %if.end.i89
  %wide.trip.count.i148 = zext i32 %38 to i64, !dbg !307
  %xtraiter.i149 = and i64 %wide.trip.count.i148, 3, !dbg !310
  %39 = icmp ult i32 %38, 4, !dbg !310
  br i1 %39, label %for.end17.loopexit.unr-lcssa.i, label %for.body10.preheader.new.i, !dbg !310

for.body10.preheader.new.i:                       ; preds = %for.body10.preheader.i
  %unroll_iter.i150 = and i64 %wide.trip.count.i148, 4294967292, !dbg !310
  br label %for.body10.i, !dbg !310

for.body10.i:                                     ; preds = %for.body10.i, %for.body10.preheader.new.i
  %indvars.iv.i151 = phi i64 [ 0, %for.body10.preheader.new.i ], [ %indvars.iv.next.3.i, %for.body10.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i151, metadata !311, metadata !DIExpression()), !dbg !299
  %arrayidx12.i = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.i151, !dbg !312
  %40 = load double, ptr %arrayidx12.i, align 8, !dbg !312
  %mul13.i = fmul double %40, %div.i90, !dbg !313
  store double %mul13.i, ptr %arrayidx12.i, align 8, !dbg !314
  %indvars.iv.next.i153 = or i64 %indvars.iv.i151, 1, !dbg !315
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i153, metadata !311, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i153, metadata !311, metadata !DIExpression()), !dbg !299
  %arrayidx12.1.i = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.next.i153, !dbg !312
  %41 = load double, ptr %arrayidx12.1.i, align 8, !dbg !312
  %mul13.1.i = fmul double %41, %div.i90, !dbg !313
  store double %mul13.1.i, ptr %arrayidx12.1.i, align 8, !dbg !314
  %indvars.iv.next.1.i154 = or i64 %indvars.iv.i151, 2, !dbg !315
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i154, metadata !311, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i154, metadata !311, metadata !DIExpression()), !dbg !299
  %arrayidx12.2.i = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.next.1.i154, !dbg !312
  %42 = load double, ptr %arrayidx12.2.i, align 8, !dbg !312
  %mul13.2.i = fmul double %42, %div.i90, !dbg !313
  store double %mul13.2.i, ptr %arrayidx12.2.i, align 8, !dbg !314
  %indvars.iv.next.2.i = or i64 %indvars.iv.i151, 3, !dbg !315
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i, metadata !311, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i, metadata !311, metadata !DIExpression()), !dbg !299
  %arrayidx12.3.i = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.next.2.i, !dbg !312
  %43 = load double, ptr %arrayidx12.3.i, align 8, !dbg !312
  %mul13.3.i = fmul double %43, %div.i90, !dbg !313
  store double %mul13.3.i, ptr %arrayidx12.3.i, align 8, !dbg !314
  %indvars.iv.next.3.i = add nuw i64 %indvars.iv.i151, 4, !dbg !315
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3.i, metadata !311, metadata !DIExpression()), !dbg !299
  %niter.ncmp.3.i = icmp eq i64 %indvars.iv.next.3.i, %unroll_iter.i150, !dbg !310
  br i1 %niter.ncmp.3.i, label %for.end17.loopexit.unr-lcssa.i, label %for.body10.i, !dbg !310, !llvm.loop !316

for.end17.loopexit.unr-lcssa.i:                   ; preds = %for.body10.i, %for.body10.preheader.i
  %indvars.iv.unr.i155 = phi i64 [ 0, %for.body10.preheader.i ], [ %indvars.iv.next.3.i, %for.body10.i ]
  %lcmp.mod.not.i156 = icmp eq i64 %xtraiter.i149, 0, !dbg !310
  br i1 %lcmp.mod.not.i156, label %dscal_r.exit, label %for.body10.epil.i, !dbg !310

for.body10.epil.i:                                ; preds = %for.end17.loopexit.unr-lcssa.i, %for.body10.epil.i
  %indvars.iv.epil.i = phi i64 [ %indvars.iv.next.epil.i, %for.body10.epil.i ], [ %indvars.iv.unr.i155, %for.end17.loopexit.unr-lcssa.i ]
  %epil.iter.i = phi i64 [ %epil.iter.next.i, %for.body10.epil.i ], [ 0, %for.end17.loopexit.unr-lcssa.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.epil.i, metadata !311, metadata !DIExpression()), !dbg !299
  %arrayidx12.epil.i = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.epil.i, !dbg !312
  %44 = load double, ptr %arrayidx12.epil.i, align 8, !dbg !312
  %mul13.epil.i = fmul double %44, %div.i90, !dbg !313
  store double %mul13.epil.i, ptr %arrayidx12.epil.i, align 8, !dbg !314
  %indvars.iv.next.epil.i = add nuw nsw i64 %indvars.iv.epil.i, 1, !dbg !315
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.epil.i, metadata !311, metadata !DIExpression()), !dbg !299
  %epil.iter.next.i = add nuw nsw i64 %epil.iter.i, 1, !dbg !310
  %epil.iter.cmp.not.i = icmp eq i64 %epil.iter.next.i, %xtraiter.i149, !dbg !310
  br i1 %epil.iter.cmp.not.i, label %dscal_r.exit, label %for.body10.epil.i, !dbg !310, !llvm.loop !318

dscal_r.exit:                                     ; preds = %for.body10.epil.i, %if.end.i89, %for.end17.loopexit.unr-lcssa.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next197.i, metadata !320, metadata !DIExpression()), !dbg !217
  %45 = sext i32 %add5.i to i64, !dbg !321
  %46 = trunc i64 %36 to i32
  br label %for.body45.i, !dbg !321

for.body45.i:                                     ; preds = %daxpy_r.exit220, %dscal_r.exit
  %indvars.iv189.i = phi i64 [ %indvars.iv.i86, %dscal_r.exit ], [ %indvars.iv.next190.i, %daxpy_r.exit220 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv189.i, metadata !320, metadata !DIExpression()), !dbg !217
  %47 = mul nuw nsw i64 %indvars.iv189.i, 200, !dbg !323
  %48 = add nsw i64 %47, %45, !dbg !326
  %arrayidx49.i = getelementptr inbounds double, ptr %0, i64 %48, !dbg !327
  %49 = load double, ptr %arrayidx49.i, align 8, !dbg !327
  call void @llvm.dbg.value(metadata double %49, metadata !283, metadata !DIExpression()), !dbg !217
  br i1 %cmp14.not.i, label %if.end64.i, label %if.then51.i, !dbg !328

if.then51.i:                                      ; preds = %for.body45.i
  %50 = add nuw nsw i64 %47, %indvars.iv196.i, !dbg !329
  %arrayidx55.i = getelementptr inbounds double, ptr %0, i64 %50, !dbg !332
  %51 = load double, ptr %arrayidx55.i, align 8, !dbg !332
  store double %51, ptr %arrayidx49.i, align 8, !dbg !333
  store double %49, ptr %arrayidx55.i, align 8, !dbg !334
  br label %if.end64.i, !dbg !335

if.end64.i:                                       ; preds = %if.then51.i, %for.body45.i
  %52 = add nuw nsw i64 %indvars.iv.next197.i, %47, !dbg !336
  %arrayidx76.i = getelementptr inbounds double, ptr %0, i64 %52, !dbg !337
  call void @llvm.dbg.value(metadata i32 %46, metadata !338, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata double %49, metadata !344, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata ptr %arrayidx42.i91, metadata !345, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata i32 1, metadata !346, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata ptr %arrayidx76.i, metadata !347, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata i32 1, metadata !348, metadata !DIExpression()), !dbg !342
  %cmp.i195 = icmp slt i32 %46, 1, !dbg !349
  %cmp1.i196 = fcmp oeq double %49, 0.000000e+00
  %or.cond1.i197 = or i1 %cmp.i195, %cmp1.i196, !dbg !351
  br i1 %or.cond1.i197, label %daxpy_r.exit220, label %for.body29.preheader.i198, !dbg !351

for.body29.preheader.i198:                        ; preds = %if.end64.i
  %wide.trip.count.i199 = zext i32 %46 to i64, !dbg !352
  %xtraiter.i200 = and i64 %wide.trip.count.i199, 1, !dbg !355
  %53 = icmp eq i32 %46, 1, !dbg !355
  br i1 %53, label %for.end39.loopexit.unr-lcssa.i214, label %for.body29.preheader.new.i201, !dbg !355

for.body29.preheader.new.i201:                    ; preds = %for.body29.preheader.i198
  %unroll_iter.i202 = and i64 %wide.trip.count.i199, 4294967294, !dbg !355
  br label %for.body29.i203, !dbg !355

for.body29.i203:                                  ; preds = %for.body29.i203, %for.body29.preheader.new.i201
  %indvars.iv.i204 = phi i64 [ 0, %for.body29.preheader.new.i201 ], [ %indvars.iv.next.1.i211, %for.body29.i203 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i204, metadata !356, metadata !DIExpression()), !dbg !342
  %arrayidx31.i206 = getelementptr inbounds double, ptr %arrayidx76.i, i64 %indvars.iv.i204, !dbg !357
  %54 = load double, ptr %arrayidx31.i206, align 8, !dbg !357
  %arrayidx33.i207 = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.i204, !dbg !358
  %55 = load double, ptr %arrayidx33.i207, align 8, !dbg !358
  %56 = call double @llvm.fmuladd.f64(double %49, double %55, double %54), !dbg !359
  store double %56, ptr %arrayidx31.i206, align 8, !dbg !360
  %indvars.iv.next.i208 = or i64 %indvars.iv.i204, 1, !dbg !361
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i208, metadata !356, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i208, metadata !356, metadata !DIExpression()), !dbg !342
  %arrayidx31.1.i209 = getelementptr inbounds double, ptr %arrayidx76.i, i64 %indvars.iv.next.i208, !dbg !357
  %57 = load double, ptr %arrayidx31.1.i209, align 8, !dbg !357
  %arrayidx33.1.i210 = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.next.i208, !dbg !358
  %58 = load double, ptr %arrayidx33.1.i210, align 8, !dbg !358
  %59 = call double @llvm.fmuladd.f64(double %49, double %58, double %57), !dbg !359
  store double %59, ptr %arrayidx31.1.i209, align 8, !dbg !360
  %indvars.iv.next.1.i211 = add nuw i64 %indvars.iv.i204, 2, !dbg !361
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i211, metadata !356, metadata !DIExpression()), !dbg !342
  %niter.ncmp.1.i213 = icmp eq i64 %indvars.iv.next.1.i211, %unroll_iter.i202, !dbg !355
  br i1 %niter.ncmp.1.i213, label %for.end39.loopexit.unr-lcssa.i214, label %for.body29.i203, !dbg !355, !llvm.loop !362

for.end39.loopexit.unr-lcssa.i214:                ; preds = %for.body29.i203, %for.body29.preheader.i198
  %indvars.iv.unr.i215 = phi i64 [ 0, %for.body29.preheader.i198 ], [ %indvars.iv.next.1.i211, %for.body29.i203 ]
  %lcmp.mod.not.i216 = icmp eq i64 %xtraiter.i200, 0, !dbg !355
  br i1 %lcmp.mod.not.i216, label %daxpy_r.exit220, label %for.body29.epil.i217, !dbg !355

for.body29.epil.i217:                             ; preds = %for.end39.loopexit.unr-lcssa.i214
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i215, metadata !356, metadata !DIExpression()), !dbg !342
  %arrayidx31.epil.i218 = getelementptr inbounds double, ptr %arrayidx76.i, i64 %indvars.iv.unr.i215, !dbg !357
  %60 = load double, ptr %arrayidx31.epil.i218, align 8, !dbg !357
  %arrayidx33.epil.i219 = getelementptr inbounds double, ptr %arrayidx42.i91, i64 %indvars.iv.unr.i215, !dbg !358
  %61 = load double, ptr %arrayidx33.epil.i219, align 8, !dbg !358
  %62 = call double @llvm.fmuladd.f64(double %49, double %61, double %60), !dbg !359
  store double %62, ptr %arrayidx31.epil.i218, align 8, !dbg !360
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i215, metadata !356, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !342
  br label %daxpy_r.exit220, !dbg !364

daxpy_r.exit220:                                  ; preds = %if.end64.i, %for.end39.loopexit.unr-lcssa.i214, %for.body29.epil.i217
  %indvars.iv.next190.i = add nuw nsw i64 %indvars.iv189.i, 1, !dbg !365
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next190.i, metadata !320, metadata !DIExpression()), !dbg !217
  %exitcond.not.i92 = icmp eq i64 %indvars.iv.next190.i, 100, !dbg !366
  br i1 %exitcond.not.i92, label %for.inc78.i, label %for.body45.i, !dbg !321, !llvm.loop !367

if.else.i:                                        ; preds = %idamax.exit146
  %63 = trunc i64 %indvars.iv196.i to i32, !dbg !369
  store i32 %63, ptr %info.i, align 4, !dbg !369
  br label %for.inc78.i

for.inc78.i:                                      ; preds = %daxpy_r.exit220, %if.else.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next197.i, metadata !227, metadata !DIExpression()), !dbg !217
  %indvars.iv.next.i88 = add nuw nsw i64 %indvars.iv.i86, 1, !dbg !370
  %exitcond205.not.i = icmp eq i64 %indvars.iv.next197.i, 99, !dbg !371
  br i1 %exitcond205.not.i, label %if.end81.i, label %for.body.i85, !dbg !370, !llvm.loop !372

if.end81.i:                                       ; preds = %for.inc78.i
  %div.i27 = fdiv double %conv.i26, 1.000000e+06, !dbg !374
  %arrayidx85.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 99, !dbg !375
  store i32 99, ptr %arrayidx85.i, align 4, !dbg !376
  %arrayidx91.i = getelementptr inbounds double, ptr %0, i64 19899, !dbg !377
  %64 = load double, ptr %arrayidx91.i, align 8, !dbg !377
  %cmp92.i = fcmp oeq double %64, 0.000000e+00, !dbg !379
  br i1 %cmp92.i, label %if.end207.sink.split.i, label %dgefa.exit, !dbg !380

if.end207.sink.split.i:                           ; preds = %if.end81.i
  store i32 99, ptr %info.i, align 4, !dbg !224
  br label %dgefa.exit, !dbg !381

dgefa.exit:                                       ; preds = %if.end81.i, %if.end207.sink.split.i
  %call.i22 = tail call i64 @clock() #11, !dbg !382
  %conv.i23 = sitofp i64 %call.i22 to double, !dbg !384
  %div.i24 = fdiv double %conv.i23, 1.000000e+06, !dbg !385
  %sub.i = fsub double %div.i24, %div.i27, !dbg !386
  call void @llvm.dbg.value(metadata double %add.i, metadata !127, metadata !DIExpression()), !dbg !109
  %call.i19 = tail call i64 @clock() #11, !dbg !387
  %conv.i20 = sitofp i64 %call.i19 to double, !dbg !389
  call void @llvm.dbg.value(metadata double %div.i21, metadata !211, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata ptr %0, metadata !390, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata i32 200, metadata !396, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata i32 100, metadata !397, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !398, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !399, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata i32 0, metadata !400, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata i32 1, metadata !401, metadata !DIExpression()), !dbg !394
  br label %for.body.i95

for.body.i95:                                     ; preds = %daxpy_r.exit194, %dgefa.exit
  %indvars.iv.i96 = phi i64 [ %indvars.iv.next.i99, %daxpy_r.exit194 ], [ 0, %dgefa.exit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i96, metadata !402, metadata !DIExpression()), !dbg !394
  %arrayidx.i97 = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv.i96, !dbg !403
  %65 = load i32, ptr %arrayidx.i97, align 4, !dbg !403
  call void @llvm.dbg.value(metadata i32 %65, metadata !412, metadata !DIExpression()), !dbg !394
  %idxprom5.i = sext i32 %65 to i64, !dbg !413
  %arrayidx6.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %idxprom5.i, !dbg !413
  %66 = load double, ptr %arrayidx6.i, align 8, !dbg !413
  call void @llvm.dbg.value(metadata double %66, metadata !414, metadata !DIExpression()), !dbg !394
  %67 = zext i32 %65 to i64, !dbg !415
  %cmp7.not.i = icmp eq i64 %indvars.iv.i96, %67, !dbg !415
  br i1 %cmp7.not.i, label %if.end.i98, label %if.then8.i, !dbg !417

if.then8.i:                                       ; preds = %for.body.i95
  %arrayidx10.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.i96, !dbg !418
  %68 = load double, ptr %arrayidx10.i, align 8, !dbg !418
  store double %68, ptr %arrayidx6.i, align 8, !dbg !420
  store double %66, ptr %arrayidx10.i, align 8, !dbg !421
  br label %if.end.i98, !dbg !422

if.end.i98:                                       ; preds = %if.then8.i, %for.body.i95
  %indvars.iv.next.i99 = add nuw nsw i64 %indvars.iv.i96, 1, !dbg !423
  %69 = mul nuw nsw i64 %indvars.iv.i96, 201, !dbg !424
  %70 = add nuw nsw i64 %69, 1, !dbg !425
  %arrayidx19.i = getelementptr inbounds double, ptr %0, i64 %70, !dbg !426
  %arrayidx22.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next.i99, !dbg !427
  %71 = trunc i64 %indvars.iv.i96 to i32, !dbg !428
  %72 = sub i32 99, %71, !dbg !428
  call void @llvm.dbg.value(metadata i32 %72, metadata !338, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata double %66, metadata !344, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata ptr %arrayidx19.i, metadata !345, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata i32 1, metadata !346, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata ptr %arrayidx22.i, metadata !347, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata i32 1, metadata !348, metadata !DIExpression()), !dbg !429
  %cmp.i169 = icmp slt i32 %72, 1, !dbg !431
  %cmp1.i170 = fcmp oeq double %66, 0.000000e+00
  %or.cond1.i171 = or i1 %cmp.i169, %cmp1.i170, !dbg !432
  br i1 %or.cond1.i171, label %daxpy_r.exit194, label %for.body29.preheader.i172, !dbg !432

for.body29.preheader.i172:                        ; preds = %if.end.i98
  %wide.trip.count.i173 = zext i32 %72 to i64, !dbg !433
  %xtraiter.i174 = and i64 %wide.trip.count.i173, 1, !dbg !434
  %73 = icmp eq i32 %72, 1, !dbg !434
  br i1 %73, label %for.end39.loopexit.unr-lcssa.i188, label %for.body29.preheader.new.i175, !dbg !434

for.body29.preheader.new.i175:                    ; preds = %for.body29.preheader.i172
  %unroll_iter.i176 = and i64 %wide.trip.count.i173, 4294967294, !dbg !434
  br label %for.body29.i177, !dbg !434

for.body29.i177:                                  ; preds = %for.body29.i177, %for.body29.preheader.new.i175
  %indvars.iv.i178 = phi i64 [ 0, %for.body29.preheader.new.i175 ], [ %indvars.iv.next.1.i185, %for.body29.i177 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i178, metadata !356, metadata !DIExpression()), !dbg !429
  %arrayidx31.i180 = getelementptr inbounds double, ptr %arrayidx22.i, i64 %indvars.iv.i178, !dbg !435
  %74 = load double, ptr %arrayidx31.i180, align 8, !dbg !435
  %arrayidx33.i181 = getelementptr inbounds double, ptr %arrayidx19.i, i64 %indvars.iv.i178, !dbg !436
  %75 = load double, ptr %arrayidx33.i181, align 8, !dbg !436
  %76 = tail call double @llvm.fmuladd.f64(double %66, double %75, double %74), !dbg !437
  store double %76, ptr %arrayidx31.i180, align 8, !dbg !438
  %indvars.iv.next.i182 = or i64 %indvars.iv.i178, 1, !dbg !439
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i182, metadata !356, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i182, metadata !356, metadata !DIExpression()), !dbg !429
  %arrayidx31.1.i183 = getelementptr inbounds double, ptr %arrayidx22.i, i64 %indvars.iv.next.i182, !dbg !435
  %77 = load double, ptr %arrayidx31.1.i183, align 8, !dbg !435
  %arrayidx33.1.i184 = getelementptr inbounds double, ptr %arrayidx19.i, i64 %indvars.iv.next.i182, !dbg !436
  %78 = load double, ptr %arrayidx33.1.i184, align 8, !dbg !436
  %79 = tail call double @llvm.fmuladd.f64(double %66, double %78, double %77), !dbg !437
  store double %79, ptr %arrayidx31.1.i183, align 8, !dbg !438
  %indvars.iv.next.1.i185 = add nuw i64 %indvars.iv.i178, 2, !dbg !439
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i185, metadata !356, metadata !DIExpression()), !dbg !429
  %niter.ncmp.1.i187 = icmp eq i64 %indvars.iv.next.1.i185, %unroll_iter.i176, !dbg !434
  br i1 %niter.ncmp.1.i187, label %for.end39.loopexit.unr-lcssa.i188, label %for.body29.i177, !dbg !434, !llvm.loop !440

for.end39.loopexit.unr-lcssa.i188:                ; preds = %for.body29.i177, %for.body29.preheader.i172
  %indvars.iv.unr.i189 = phi i64 [ 0, %for.body29.preheader.i172 ], [ %indvars.iv.next.1.i185, %for.body29.i177 ]
  %lcmp.mod.not.i190 = icmp eq i64 %xtraiter.i174, 0, !dbg !434
  br i1 %lcmp.mod.not.i190, label %daxpy_r.exit194, label %for.body29.epil.i191, !dbg !434

for.body29.epil.i191:                             ; preds = %for.end39.loopexit.unr-lcssa.i188
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i189, metadata !356, metadata !DIExpression()), !dbg !429
  %arrayidx31.epil.i192 = getelementptr inbounds double, ptr %arrayidx22.i, i64 %indvars.iv.unr.i189, !dbg !435
  %80 = load double, ptr %arrayidx31.epil.i192, align 8, !dbg !435
  %arrayidx33.epil.i193 = getelementptr inbounds double, ptr %arrayidx19.i, i64 %indvars.iv.unr.i189, !dbg !436
  %81 = load double, ptr %arrayidx33.epil.i193, align 8, !dbg !436
  %82 = tail call double @llvm.fmuladd.f64(double %66, double %81, double %80), !dbg !437
  store double %82, ptr %arrayidx31.epil.i192, align 8, !dbg !438
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i189, metadata !356, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !429
  br label %daxpy_r.exit194, !dbg !442

daxpy_r.exit194:                                  ; preds = %if.end.i98, %for.end39.loopexit.unr-lcssa.i188, %for.body29.epil.i191
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i99, metadata !402, metadata !DIExpression()), !dbg !394
  %exitcond.not.i100 = icmp eq i64 %indvars.iv.next.i99, 99, !dbg !443
  br i1 %exitcond.not.i100, label %for.body26.i.preheader, label %for.body.i95, !dbg !444, !llvm.loop !445

for.body26.i.preheader:                           ; preds = %daxpy_r.exit194
  %add.i = fadd double %tdgefa.063.i, %sub.i, !dbg !447
  br label %for.body26.i, !dbg !448

for.body26.i:                                     ; preds = %for.body26.i.preheader, %daxpy_r.exit
  %indvars.iv195.i = phi i64 [ %indvars.iv.next196.i, %daxpy_r.exit ], [ 0, %for.body26.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv195.i, metadata !450, metadata !DIExpression()), !dbg !394
  %indvars.iv.next196.i = add nuw nsw i64 %indvars.iv195.i, 1, !dbg !451
  %83 = sub nuw nsw i64 99, %indvars.iv195.i, !dbg !454
  call void @llvm.dbg.value(metadata i64 %83, metadata !402, metadata !DIExpression()), !dbg !394
  %arrayidx30.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %83, !dbg !455
  %84 = load double, ptr %arrayidx30.i, align 8, !dbg !455
  %85 = mul nuw nsw i64 %83, 200, !dbg !456
  %86 = mul nuw nsw i64 %83, 201, !dbg !457
  %arrayidx34.i = getelementptr inbounds double, ptr %0, i64 %86, !dbg !458
  %87 = load double, ptr %arrayidx34.i, align 8, !dbg !458
  %div.i101 = fdiv double %84, %87, !dbg !459
  store double %div.i101, ptr %arrayidx30.i, align 8, !dbg !460
  %fneg.i = fneg double %div.i101, !dbg !461
  call void @llvm.dbg.value(metadata double %fneg.i, metadata !414, metadata !DIExpression()), !dbg !394
  %arrayidx42.i102 = getelementptr inbounds double, ptr %0, i64 %85, !dbg !462
  %88 = trunc i64 %83 to i32, !dbg !463
  call void @llvm.dbg.value(metadata i32 %88, metadata !338, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata double %fneg.i, metadata !344, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata ptr %arrayidx42.i102, metadata !345, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata i32 1, metadata !346, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !347, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata i32 1, metadata !348, metadata !DIExpression()), !dbg !464
  %cmp.i157 = icmp slt i32 %88, 1, !dbg !466
  %cmp1.i = fcmp oeq double %fneg.i, 0.000000e+00
  %or.cond1.i = or i1 %cmp.i157, %cmp1.i, !dbg !467
  br i1 %or.cond1.i, label %daxpy_r.exit, label %for.body29.preheader.i, !dbg !467

for.body29.preheader.i:                           ; preds = %for.body26.i
  %wide.trip.count.i158 = zext i32 %88 to i64, !dbg !468
  %xtraiter.i159 = and i64 %wide.trip.count.i158, 1, !dbg !469
  %89 = icmp eq i32 %88, 1, !dbg !469
  br i1 %89, label %for.end39.loopexit.unr-lcssa.i, label %for.body29.preheader.new.i, !dbg !469

for.body29.preheader.new.i:                       ; preds = %for.body29.preheader.i
  %unroll_iter.i160 = and i64 %wide.trip.count.i158, 4294967294, !dbg !469
  br label %for.body29.i, !dbg !469

for.body29.i:                                     ; preds = %for.body29.i, %for.body29.preheader.new.i
  %indvars.iv.i161 = phi i64 [ 0, %for.body29.preheader.new.i ], [ %indvars.iv.next.1.i164, %for.body29.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i161, metadata !356, metadata !DIExpression()), !dbg !464
  %arrayidx31.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.i161, !dbg !470
  %90 = load double, ptr %arrayidx31.i, align 8, !dbg !470
  %arrayidx33.i = getelementptr inbounds double, ptr %arrayidx42.i102, i64 %indvars.iv.i161, !dbg !471
  %91 = load double, ptr %arrayidx33.i, align 8, !dbg !471
  %92 = tail call double @llvm.fmuladd.f64(double %fneg.i, double %91, double %90), !dbg !472
  store double %92, ptr %arrayidx31.i, align 8, !dbg !473
  %indvars.iv.next.i163 = or i64 %indvars.iv.i161, 1, !dbg !474
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i163, metadata !356, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i163, metadata !356, metadata !DIExpression()), !dbg !464
  %arrayidx31.1.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next.i163, !dbg !470
  %93 = load double, ptr %arrayidx31.1.i, align 8, !dbg !470
  %arrayidx33.1.i = getelementptr inbounds double, ptr %arrayidx42.i102, i64 %indvars.iv.next.i163, !dbg !471
  %94 = load double, ptr %arrayidx33.1.i, align 8, !dbg !471
  %95 = tail call double @llvm.fmuladd.f64(double %fneg.i, double %94, double %93), !dbg !472
  store double %95, ptr %arrayidx31.1.i, align 8, !dbg !473
  %indvars.iv.next.1.i164 = add nuw i64 %indvars.iv.i161, 2, !dbg !474
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i164, metadata !356, metadata !DIExpression()), !dbg !464
  %niter.ncmp.1.i166 = icmp eq i64 %indvars.iv.next.1.i164, %unroll_iter.i160, !dbg !469
  br i1 %niter.ncmp.1.i166, label %for.end39.loopexit.unr-lcssa.i, label %for.body29.i, !dbg !469, !llvm.loop !475

for.end39.loopexit.unr-lcssa.i:                   ; preds = %for.body29.i, %for.body29.preheader.i
  %indvars.iv.unr.i167 = phi i64 [ 0, %for.body29.preheader.i ], [ %indvars.iv.next.1.i164, %for.body29.i ]
  %lcmp.mod.not.i168 = icmp eq i64 %xtraiter.i159, 0, !dbg !469
  br i1 %lcmp.mod.not.i168, label %daxpy_r.exit, label %for.body29.epil.i, !dbg !469

for.body29.epil.i:                                ; preds = %for.end39.loopexit.unr-lcssa.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i167, metadata !356, metadata !DIExpression()), !dbg !464
  %arrayidx31.epil.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.unr.i167, !dbg !470
  %96 = load double, ptr %arrayidx31.epil.i, align 8, !dbg !470
  %arrayidx33.epil.i = getelementptr inbounds double, ptr %arrayidx42.i102, i64 %indvars.iv.unr.i167, !dbg !471
  %97 = load double, ptr %arrayidx33.epil.i, align 8, !dbg !471
  %98 = tail call double @llvm.fmuladd.f64(double %fneg.i, double %97, double %96), !dbg !472
  store double %98, ptr %arrayidx31.epil.i, align 8, !dbg !473
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i167, metadata !356, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !464
  br label %daxpy_r.exit, !dbg !477

daxpy_r.exit:                                     ; preds = %for.body26.i, %for.end39.loopexit.unr-lcssa.i, %for.body29.epil.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next196.i, metadata !450, metadata !DIExpression()), !dbg !394
  %exitcond201.not.i = icmp eq i64 %indvars.iv.next196.i, 100, !dbg !478
  br i1 %exitcond201.not.i, label %dgesl.exit, label %for.body26.i, !dbg !448, !llvm.loop !479

dgesl.exit:                                       ; preds = %daxpy_r.exit
  %div.i21 = fdiv double %conv.i20, 1.000000e+06, !dbg !481
  %call.i18 = tail call i64 @clock() #11, !dbg !482
  %conv.i = sitofp i64 %call.i18 to double, !dbg !484
  %div.i = fdiv double %conv.i, 1.000000e+06, !dbg !485
  %sub18.i = fsub double %div.i, %div.i21, !dbg !486
  %add19.i = fadd double %tdgesl.064.i, %sub18.i, !dbg !487
  call void @llvm.dbg.value(metadata double %add19.i, metadata !126, metadata !DIExpression()), !dbg !109
  %inc.i = add nuw nsw i64 %i.065.i, 1, !dbg !488
  call void @llvm.dbg.value(metadata i64 %inc.i, metadata !136, metadata !DIExpression()), !dbg !109
  %exitcond.not.i = icmp eq i64 %inc.i, %nreps.0, !dbg !137
  br i1 %exitcond.not.i, label %for.cond20.preheader.i, label %for.body.i, !dbg !140, !llvm.loop !489

for.body23.i:                                     ; preds = %for.cond20.preheader.i, %dgesl.exit104
  %i.170.i = phi i64 [ %inc33.i, %dgesl.exit104 ], [ 0, %for.cond20.preheader.i ]
  %tdgesl.169.i = phi double [ %add31.i, %dgesl.exit104 ], [ %tdgesl.0.lcssa.i, %for.cond20.preheader.i ]
  %tdgefa.168.i = phi double [ %add27.i, %dgesl.exit104 ], [ %tdgefa.0.lcssa.i, %for.cond20.preheader.i ]
  call void @llvm.dbg.value(metadata i64 %i.170.i, metadata !136, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double %tdgesl.169.i, metadata !126, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata double %tdgefa.168.i, metadata !127, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata ptr %norma.i, metadata !145, metadata !DIExpression(DW_OP_deref)), !dbg !109
  call void @llvm.dbg.value(metadata ptr %0, metadata !146, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 200, metadata !153, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 100, metadata !154, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !155, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata ptr %norma.i, metadata !156, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 1325, metadata !157, metadata !DIExpression()), !dbg !491
  store double 0.000000e+00, ptr %norma.i, align 8, !dbg !494
  call void @llvm.dbg.value(metadata i32 0, metadata !159, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 1325, metadata !157, metadata !DIExpression()), !dbg !491
  br label %for.cond1.preheader.i50, !dbg !495

for.cond1.preheader.i50:                          ; preds = %for.inc17.i64, %for.body23.i
  %indvars.iv46.i51 = phi i64 [ 0, %for.body23.i ], [ %indvars.iv.next47.i65, %for.inc17.i64 ]
  %init.038.i52 = phi i32 [ 1325, %for.body23.i ], [ %.lcssa316, %for.inc17.i64 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv46.i51, metadata !159, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 %init.038.i52, metadata !157, metadata !DIExpression()), !dbg !491
  %99 = mul nuw nsw i64 %indvars.iv46.i51, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !162, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 %init.038.i52, metadata !157, metadata !DIExpression()), !dbg !491
  br label %for.body3.i53, !dbg !496

for.body3.i53:                                    ; preds = %for.body3.i53, %for.cond1.preheader.i50
  %indvars.iv.i54 = phi i64 [ 0, %for.cond1.preheader.i50 ], [ %indvars.iv.next.i62, %for.body3.i53 ]
  %init.136.i55 = phi i32 [ %init.038.i52, %for.cond1.preheader.i50 ], [ %101, %for.body3.i53 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i54, metadata !162, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 %init.136.i55, metadata !157, metadata !DIExpression()), !dbg !491
  %100 = mul nuw nsw i32 %init.136.i55, 3125
  %101 = and i32 %100, 65535
  call void @llvm.dbg.value(metadata i32 %101, metadata !157, metadata !DIExpression()), !dbg !491
  %addconv.i56 = add nsw i32 %101, -32768, !dbg !497
  %sub.i57 = sitofp i32 %addconv.i56 to double, !dbg !497
  %div.i58 = fmul double %sub.i57, 0x3F10000000000000, !dbg !498
  %102 = add nuw nsw i64 %indvars.iv.i54, %99, !dbg !499
  %arrayidx.i59 = getelementptr inbounds double, ptr %0, i64 %102, !dbg !500
  store double %div.i58, ptr %arrayidx.i59, align 8, !dbg !501
  %103 = load double, ptr %norma.i, align 8, !dbg !502
  %cmp11.i60 = fcmp ogt double %div.i58, %103, !dbg !503
  %div..i61 = select i1 %cmp11.i60, double %div.i58, double %103, !dbg !504
  store double %div..i61, ptr %norma.i, align 8, !dbg !505
  %indvars.iv.next.i62 = add nuw nsw i64 %indvars.iv.i54, 1, !dbg !506
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i62, metadata !162, metadata !DIExpression()), !dbg !491
  %exitcond.not.i63 = icmp eq i64 %indvars.iv.next.i62, 100, !dbg !507
  br i1 %exitcond.not.i63, label %for.inc17.i64, label %for.body3.i53, !dbg !496, !llvm.loop !508

for.inc17.i64:                                    ; preds = %for.body3.i53
  %.lcssa316 = phi i32 [ %101, %for.body3.i53 ]
  %indvars.iv.next47.i65 = add nuw nsw i64 %indvars.iv46.i51, 1, !dbg !510
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next47.i65, metadata !159, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i32 %.lcssa316, metadata !157, metadata !DIExpression()), !dbg !491
  %exitcond50.not.i66 = icmp eq i64 %indvars.iv.next47.i65, 100, !dbg !511
  br i1 %exitcond50.not.i66, label %for.body23.preheader.i67, label %for.cond1.preheader.i50, !dbg !495, !llvm.loop !512

for.body23.preheader.i67:                         ; preds = %for.inc17.i64
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(800) %add.ptr.i, i8 0, i64 800, i1 false), !dbg !514
  call void @llvm.dbg.value(metadata i64 poison, metadata !162, metadata !DIExpression()), !dbg !491
  br label %for.cond33.preheader.i68, !dbg !515

for.cond33.preheader.i68:                         ; preds = %for.inc49.i81, %for.body23.preheader.i67
  %indvars.iv59.i69 = phi i64 [ 0, %for.body23.preheader.i67 ], [ %indvars.iv.next60.i82, %for.inc49.i81 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv59.i69, metadata !159, metadata !DIExpression()), !dbg !491
  %104 = mul nuw nsw i64 %indvars.iv59.i69, 200
  call void @llvm.dbg.value(metadata i32 0, metadata !162, metadata !DIExpression()), !dbg !491
  br label %for.body36.i70, !dbg !516

for.body36.i70:                                   ; preds = %for.body36.i70, %for.cond33.preheader.i68
  %indvars.iv54.i71 = phi i64 [ 0, %for.cond33.preheader.i68 ], [ %indvars.iv.next55.1.i79, %for.body36.i70 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv54.i71, metadata !162, metadata !DIExpression()), !dbg !491
  %arrayidx38.i72 = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv54.i71, !dbg !517
  %105 = load double, ptr %arrayidx38.i72, align 8, !dbg !517
  %106 = add nuw nsw i64 %indvars.iv54.i71, %104, !dbg !518
  %arrayidx42.i73 = getelementptr inbounds double, ptr %0, i64 %106, !dbg !519
  %107 = load double, ptr %arrayidx42.i73, align 8, !dbg !519
  %add43.i74 = fadd double %105, %107, !dbg !520
  store double %add43.i74, ptr %arrayidx38.i72, align 8, !dbg !521
  %indvars.iv.next55.i75 = or i64 %indvars.iv54.i71, 1, !dbg !522
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next55.i75, metadata !162, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next55.i75, metadata !162, metadata !DIExpression()), !dbg !491
  %arrayidx38.1.i76 = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next55.i75, !dbg !517
  %108 = load double, ptr %arrayidx38.1.i76, align 8, !dbg !517
  %109 = add nuw nsw i64 %indvars.iv.next55.i75, %104, !dbg !518
  %arrayidx42.1.i77 = getelementptr inbounds double, ptr %0, i64 %109, !dbg !519
  %110 = load double, ptr %arrayidx42.1.i77, align 8, !dbg !519
  %add43.1.i78 = fadd double %108, %110, !dbg !520
  store double %add43.1.i78, ptr %arrayidx38.1.i76, align 8, !dbg !521
  %indvars.iv.next55.1.i79 = add nuw nsw i64 %indvars.iv54.i71, 2, !dbg !522
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next55.1.i79, metadata !162, metadata !DIExpression()), !dbg !491
  %exitcond58.not.1.i80 = icmp eq i64 %indvars.iv.next55.1.i79, 100, !dbg !523
  br i1 %exitcond58.not.1.i80, label %for.inc49.i81, label %for.body36.i70, !dbg !516, !llvm.loop !524

for.inc49.i81:                                    ; preds = %for.body36.i70
  %indvars.iv.next60.i82 = add nuw nsw i64 %indvars.iv59.i69, 1, !dbg !526
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next60.i82, metadata !159, metadata !DIExpression()), !dbg !491
  %exitcond63.not.i83 = icmp eq i64 %indvars.iv.next60.i82, 100, !dbg !527
  br i1 %exitcond63.not.i83, label %matgen.exit84, label %for.cond33.preheader.i68, !dbg !515, !llvm.loop !528

matgen.exit84:                                    ; preds = %for.inc49.i81
  %call.i37 = tail call i64 @clock() #11, !dbg !530
  %conv.i38 = sitofp i64 %call.i37 to double, !dbg !532
  call void @llvm.dbg.value(metadata double %div.i39, metadata !211, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata ptr %info.i, metadata !212, metadata !DIExpression(DW_OP_deref)), !dbg !109
  call void @llvm.dbg.value(metadata ptr %0, metadata !213, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata i32 200, metadata !219, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata i32 100, metadata !220, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !221, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata ptr %info.i, metadata !222, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata i32 0, metadata !223, metadata !DIExpression()), !dbg !533
  store i32 0, ptr %info.i, align 4, !dbg !535
  call void @llvm.dbg.value(metadata i32 99, metadata !226, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata i32 99, metadata !226, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata i32 0, metadata !227, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.value(metadata i32 0, metadata !227, metadata !DIExpression()), !dbg !533
  br label %for.body102.i

for.body102.i:                                    ; preds = %for.inc189.i, %matgen.exit84
  %indvars.iv216.i = phi i64 [ %indvars.iv.next217.i, %for.inc189.i ], [ 0, %matgen.exit84 ]
  %indvars.iv206.i = phi i64 [ %indvars.iv.next207.i, %for.inc189.i ], [ 1, %matgen.exit84 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv216.i, metadata !227, metadata !DIExpression()), !dbg !533
  %indvars.iv.next217.i = add nuw nsw i64 %indvars.iv216.i, 1, !dbg !536
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next217.i, metadata !234, metadata !DIExpression()), !dbg !533
  %111 = mul nuw nsw i64 %indvars.iv216.i, 200, !dbg !542
  %112 = mul nuw nsw i64 %indvars.iv216.i, 201, !dbg !543
  %arrayidx108.i = getelementptr inbounds double, ptr %0, i64 %112, !dbg !544
  %113 = trunc i64 %indvars.iv216.i to i32, !dbg !545
  %114 = sub i32 100, %113, !dbg !545
  call void @llvm.dbg.value(metadata i32 %114, metadata !239, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata ptr %arrayidx108.i, metadata !245, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 1, metadata !246, metadata !DIExpression()), !dbg !546
  %cmp.i = icmp slt i32 %114, 1, !dbg !548
  br i1 %cmp.i, label %idamax.exit, label %if.else.i105, !dbg !549

if.else.i105:                                     ; preds = %for.body102.i
  call void @llvm.dbg.value(metadata i32 0, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double poison, metadata !251, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 1, metadata !252, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 0, metadata !250, metadata !DIExpression()), !dbg !546
  %cmp1623.not.i = icmp eq i32 %114, 1, !dbg !550
  br i1 %cmp1623.not.i, label %idamax.exit, label %for.body17.preheader.i, !dbg !551

for.body17.preheader.i:                           ; preds = %if.else.i105
  %115 = load double, ptr %arrayidx108.i, align 8, !dbg !552
  %116 = call double @llvm.fabs.f64(double %115), !dbg !553
  call void @llvm.dbg.value(metadata double %116, metadata !251, metadata !DIExpression()), !dbg !546
  %wide.trip.count.i = zext i32 %114 to i64, !dbg !550
  %117 = add nsw i64 %wide.trip.count.i, -1, !dbg !551
  %xtraiter.i = and i64 %117, 1, !dbg !551
  %118 = icmp eq i32 %114, 2, !dbg !551
  br i1 %118, label %return.loopexit.unr-lcssa.i, label %for.body17.preheader.new.i, !dbg !551

for.body17.preheader.new.i:                       ; preds = %for.body17.preheader.i
  %unroll_iter.i = and i64 %117, -2, !dbg !551
  br label %for.body17.i, !dbg !551

for.body17.i:                                     ; preds = %for.body17.i, %for.body17.preheader.new.i
  %indvars.iv.i106 = phi i64 [ 1, %for.body17.preheader.new.i ], [ %indvars.iv.next.1.i, %for.body17.i ]
  %itemp.226.i = phi i32 [ 0, %for.body17.preheader.new.i ], [ %itemp.3.1.i, %for.body17.i ]
  %dmax.224.i = phi double [ %116, %for.body17.preheader.new.i ], [ %dmax.3.1.i, %for.body17.i ]
  %niter.i = phi i64 [ 0, %for.body17.preheader.new.i ], [ %niter.next.1.i, %for.body17.i ]
  call void @llvm.dbg.value(metadata i32 %itemp.226.i, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i106, metadata !252, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double %dmax.224.i, metadata !251, metadata !DIExpression()), !dbg !546
  %arrayidx19.i107 = getelementptr inbounds double, ptr %arrayidx108.i, i64 %indvars.iv.i106, !dbg !554
  %119 = load double, ptr %arrayidx19.i107, align 8, !dbg !554
  %120 = call double @llvm.fabs.f64(double %119), !dbg !555
  %cmp20.i = fcmp ogt double %120, %dmax.224.i, !dbg !556
  %dmax.3.i = select i1 %cmp20.i, double %120, double %dmax.224.i, !dbg !557
  %121 = trunc i64 %indvars.iv.i106 to i32, !dbg !557
  %itemp.3.i = select i1 %cmp20.i, i32 %121, i32 %itemp.226.i, !dbg !557
  call void @llvm.dbg.value(metadata i32 %itemp.3.i, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double %dmax.3.i, metadata !251, metadata !DIExpression()), !dbg !546
  %indvars.iv.next.i108 = add nuw nsw i64 %indvars.iv.i106, 1, !dbg !558
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i108, metadata !252, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 %itemp.3.i, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i108, metadata !252, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double %dmax.3.i, metadata !251, metadata !DIExpression()), !dbg !546
  %arrayidx19.1.i = getelementptr inbounds double, ptr %arrayidx108.i, i64 %indvars.iv.next.i108, !dbg !554
  %122 = load double, ptr %arrayidx19.1.i, align 8, !dbg !554
  %123 = call double @llvm.fabs.f64(double %122), !dbg !555
  %cmp20.1.i = fcmp ogt double %123, %dmax.3.i, !dbg !556
  %dmax.3.1.i = select i1 %cmp20.1.i, double %123, double %dmax.3.i, !dbg !557
  %124 = trunc i64 %indvars.iv.next.i108 to i32, !dbg !557
  %itemp.3.1.i = select i1 %cmp20.1.i, i32 %124, i32 %itemp.3.i, !dbg !557
  call void @llvm.dbg.value(metadata i32 %itemp.3.1.i, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double %dmax.3.1.i, metadata !251, metadata !DIExpression()), !dbg !546
  %indvars.iv.next.1.i = add nuw nsw i64 %indvars.iv.i106, 2, !dbg !558
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i, metadata !252, metadata !DIExpression()), !dbg !546
  %niter.next.1.i = add i64 %niter.i, 2, !dbg !551
  %niter.ncmp.1.i = icmp eq i64 %niter.next.1.i, %unroll_iter.i, !dbg !551
  br i1 %niter.ncmp.1.i, label %return.loopexit.unr-lcssa.i, label %for.body17.i, !dbg !551, !llvm.loop !559

return.loopexit.unr-lcssa.i:                      ; preds = %for.body17.i, %for.body17.preheader.i
  %itemp.3.lcssa.ph.i = phi i32 [ undef, %for.body17.preheader.i ], [ %itemp.3.1.i, %for.body17.i ]
  %indvars.iv.unr.i = phi i64 [ 1, %for.body17.preheader.i ], [ %indvars.iv.next.1.i, %for.body17.i ]
  %itemp.226.unr.i = phi i32 [ 0, %for.body17.preheader.i ], [ %itemp.3.1.i, %for.body17.i ]
  %dmax.224.unr.i = phi double [ %116, %for.body17.preheader.i ], [ %dmax.3.1.i, %for.body17.i ]
  %lcmp.mod.not.i = icmp eq i64 %xtraiter.i, 0, !dbg !551
  br i1 %lcmp.mod.not.i, label %idamax.exit, label %for.body17.epil.i, !dbg !551

for.body17.epil.i:                                ; preds = %return.loopexit.unr-lcssa.i
  call void @llvm.dbg.value(metadata i32 %itemp.226.unr.i, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i, metadata !252, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double %dmax.224.unr.i, metadata !251, metadata !DIExpression()), !dbg !546
  %arrayidx19.epil.i = getelementptr inbounds double, ptr %arrayidx108.i, i64 %indvars.iv.unr.i, !dbg !554
  %125 = load double, ptr %arrayidx19.epil.i, align 8, !dbg !554
  %126 = call double @llvm.fabs.f64(double %125), !dbg !555
  %cmp20.epil.i = fcmp ogt double %126, %dmax.224.unr.i, !dbg !556
  %127 = trunc i64 %indvars.iv.unr.i to i32, !dbg !557
  %itemp.3.epil.i = select i1 %cmp20.epil.i, i32 %127, i32 %itemp.226.unr.i, !dbg !557
  call void @llvm.dbg.value(metadata i32 %itemp.3.epil.i, metadata !250, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata double poison, metadata !251, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr.i, metadata !252, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !546
  br label %idamax.exit, !dbg !561

idamax.exit:                                      ; preds = %for.body102.i, %if.else.i105, %return.loopexit.unr-lcssa.i, %for.body17.epil.i
  %retval.0.i109 = phi i32 [ -1, %for.body102.i ], [ 0, %if.else.i105 ], [ %itemp.3.lcssa.ph.i, %return.loopexit.unr-lcssa.i ], [ %itemp.3.epil.i, %for.body17.epil.i ], !dbg !546
  %128 = trunc i64 %indvars.iv216.i to i32, !dbg !562
  %add110.i = add nsw i32 %retval.0.i109, %128, !dbg !562
  call void @llvm.dbg.value(metadata i32 %add110.i, metadata !271, metadata !DIExpression()), !dbg !533
  %arrayidx112.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv216.i, !dbg !563
  store i32 %add110.i, ptr %arrayidx112.i, align 4, !dbg !564
  %129 = sext i32 %add110.i to i64, !dbg !565
  %130 = add nsw i64 %111, %129, !dbg !565
  %arrayidx116.i = getelementptr inbounds double, ptr %0, i64 %130, !dbg !567
  %131 = load double, ptr %arrayidx116.i, align 8, !dbg !567
  %cmp117.i = fcmp une double %131, 0.000000e+00, !dbg !568
  br i1 %cmp117.i, label %if.then118.i, label %if.else187.i, !dbg !569

if.then118.i:                                     ; preds = %idamax.exit
  %cmp119.not.i = icmp eq i32 %retval.0.i109, 0, !dbg !570
  br i1 %cmp119.not.i, label %if.end137.i, label %if.then120.i, !dbg !573

if.then120.i:                                     ; preds = %if.then118.i
  call void @llvm.dbg.value(metadata double %131, metadata !283, metadata !DIExpression()), !dbg !533
  %132 = load double, ptr %arrayidx108.i, align 8, !dbg !574
  store double %132, ptr %arrayidx116.i, align 8, !dbg !576
  store double %131, ptr %arrayidx108.i, align 8, !dbg !577
  br label %if.end137.i, !dbg !578

if.end137.i:                                      ; preds = %if.then120.i, %if.then118.i
  %133 = load double, ptr %arrayidx108.i, align 8, !dbg !579
  %div142.i = fdiv double -1.000000e+00, %133, !dbg !580
  call void @llvm.dbg.value(metadata double %div142.i, metadata !283, metadata !DIExpression()), !dbg !533
  %134 = sub nuw nsw i64 99, %indvars.iv216.i, !dbg !581
  %135 = add nuw nsw i64 %112, 1, !dbg !582
  %arrayidx149.i = getelementptr inbounds double, ptr %0, i64 %135, !dbg !583
  %136 = trunc i64 %134 to i32, !dbg !584
  call void @llvm.dbg.value(metadata i32 %136, metadata !585, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata double %div142.i, metadata !589, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata ptr %arrayidx149.i, metadata !590, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i32 1, metadata !591, metadata !DIExpression()), !dbg !587
  %cmp.i221 = icmp slt i32 %136, 1, !dbg !592
  br i1 %cmp.i221, label %dscal_ur.exit, label %if.end7.i, !dbg !594

if.end7.i:                                        ; preds = %if.end137.i
  %rem.i = urem i32 %136, 5
  call void @llvm.dbg.value(metadata i32 %rem.i, metadata !595, metadata !DIExpression()), !dbg !587
  %cmp8.not.i = icmp eq i32 %rem.i, 0, !dbg !596
  br i1 %cmp8.not.i, label %if.end23.i, label %for.body12.preheader.i, !dbg !598

for.body12.preheader.i:                           ; preds = %if.end7.i
  %wide.trip.count.i222 = zext i32 %rem.i to i64, !dbg !599
  %137 = urem i32 %136, 5, !dbg !603
  %138 = zext i32 %137 to i64, !dbg !603
  %139 = add nsw i64 %138, -1, !dbg !603
  %xtraiter.i223 = and i64 %wide.trip.count.i222, 3, !dbg !603
  %140 = icmp ult i64 %139, 3, !dbg !603
  br i1 %140, label %for.end19.unr-lcssa.i, label %for.body12.preheader.new.i, !dbg !603

for.body12.preheader.new.i:                       ; preds = %for.body12.preheader.i
  %unroll_iter.i224 = and i64 %wide.trip.count.i222, 4, !dbg !603
  br label %for.body12.i, !dbg !603

for.body12.i:                                     ; preds = %for.body12.i, %for.body12.preheader.new.i
  %indvars.iv.i225 = phi i64 [ 0, %for.body12.preheader.new.i ], [ %indvars.iv.next.3.i230, %for.body12.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i225, metadata !604, metadata !DIExpression()), !dbg !587
  %arrayidx14.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv.i225, !dbg !605
  %141 = load double, ptr %arrayidx14.i, align 8, !dbg !605
  %mul15.i = fmul double %141, %div142.i, !dbg !606
  store double %mul15.i, ptr %arrayidx14.i, align 8, !dbg !607
  %indvars.iv.next.i227 = or i64 %indvars.iv.i225, 1, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i227, metadata !604, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i227, metadata !604, metadata !DIExpression()), !dbg !587
  %arrayidx14.1.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv.next.i227, !dbg !605
  %142 = load double, ptr %arrayidx14.1.i, align 8, !dbg !605
  %mul15.1.i = fmul double %142, %div142.i, !dbg !606
  store double %mul15.1.i, ptr %arrayidx14.1.i, align 8, !dbg !607
  %indvars.iv.next.1.i228 = or i64 %indvars.iv.i225, 2, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i228, metadata !604, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i228, metadata !604, metadata !DIExpression()), !dbg !587
  %arrayidx14.2.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv.next.1.i228, !dbg !605
  %143 = load double, ptr %arrayidx14.2.i, align 8, !dbg !605
  %mul15.2.i = fmul double %143, %div142.i, !dbg !606
  store double %mul15.2.i, ptr %arrayidx14.2.i, align 8, !dbg !607
  %indvars.iv.next.2.i229 = or i64 %indvars.iv.i225, 3, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i229, metadata !604, metadata !DIExpression()), !dbg !587
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i229, metadata !604, metadata !DIExpression()), !dbg !587
  %arrayidx14.3.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv.next.2.i229, !dbg !605
  %144 = load double, ptr %arrayidx14.3.i, align 8, !dbg !605
  %mul15.3.i = fmul double %144, %div142.i, !dbg !606
  store double %mul15.3.i, ptr %arrayidx14.3.i, align 8, !dbg !607
  %indvars.iv.next.3.i230 = add nuw i64 %indvars.iv.i225, 4, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3.i230, metadata !604, metadata !DIExpression()), !dbg !587
  %niter.ncmp.3.i232 = icmp eq i64 %indvars.iv.next.3.i230, %unroll_iter.i224, !dbg !603
  br i1 %niter.ncmp.3.i232, label %for.end19.unr-lcssa.i, label %for.body12.i, !dbg !603, !llvm.loop !609

for.end19.unr-lcssa.i:                            ; preds = %for.body12.i, %for.body12.preheader.i
  %indvars.iv.unr.i233 = phi i64 [ 0, %for.body12.preheader.i ], [ %indvars.iv.next.3.i230, %for.body12.i ]
  %lcmp.mod.not.i234 = icmp eq i64 %xtraiter.i223, 0, !dbg !603
  br i1 %lcmp.mod.not.i234, label %for.end19.i, label %for.body12.epil.i, !dbg !603

for.body12.epil.i:                                ; preds = %for.end19.unr-lcssa.i, %for.body12.epil.i
  %indvars.iv.epil.i235 = phi i64 [ %indvars.iv.next.epil.i237, %for.body12.epil.i ], [ %indvars.iv.unr.i233, %for.end19.unr-lcssa.i ]
  %epil.iter.i236 = phi i64 [ %epil.iter.next.i238, %for.body12.epil.i ], [ 0, %for.end19.unr-lcssa.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.epil.i235, metadata !604, metadata !DIExpression()), !dbg !587
  %arrayidx14.epil.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv.epil.i235, !dbg !605
  %145 = load double, ptr %arrayidx14.epil.i, align 8, !dbg !605
  %mul15.epil.i = fmul double %145, %div142.i, !dbg !606
  store double %mul15.epil.i, ptr %arrayidx14.epil.i, align 8, !dbg !607
  %indvars.iv.next.epil.i237 = add nuw nsw i64 %indvars.iv.epil.i235, 1, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.epil.i237, metadata !604, metadata !DIExpression()), !dbg !587
  %epil.iter.next.i238 = add nuw nsw i64 %epil.iter.i236, 1, !dbg !603
  %epil.iter.cmp.not.i239 = icmp eq i64 %epil.iter.next.i238, %xtraiter.i223, !dbg !603
  br i1 %epil.iter.cmp.not.i239, label %for.end19.i, label %for.body12.epil.i, !dbg !603, !llvm.loop !611

for.end19.i:                                      ; preds = %for.body12.epil.i, %for.end19.unr-lcssa.i
  %cmp20.i240 = icmp sgt i32 %136, 4, !dbg !612
  %cmp2548.i = icmp slt i32 %rem.i, %136
  %or.cond.i = and i1 %cmp20.i240, %cmp2548.i, !dbg !614
  call void @llvm.dbg.value(metadata i32 %rem.i, metadata !604, metadata !DIExpression()), !dbg !587
  br i1 %or.cond.i, label %for.body26.preheader.i, label %dscal_ur.exit, !dbg !614

if.end23.i:                                       ; preds = %if.end7.i
  call void @llvm.dbg.value(metadata i32 %rem.i, metadata !604, metadata !DIExpression()), !dbg !587
  %cmp2548.old.i = icmp slt i32 %rem.i, %136, !dbg !615
  br i1 %cmp2548.old.i, label %for.body26.preheader.i, label %dscal_ur.exit, !dbg !618

for.body26.preheader.i:                           ; preds = %if.end23.i, %for.end19.i
  %146 = urem i32 %136, 5, !dbg !618
  %147 = zext i32 %146 to i64, !dbg !618
  br label %for.body26.i241, !dbg !618

for.body26.i241:                                  ; preds = %for.body26.i241, %for.body26.preheader.i
  %indvars.iv51.i = phi i64 [ %147, %for.body26.preheader.i ], [ %indvars.iv.next52.i, %for.body26.i241 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv51.i, metadata !604, metadata !DIExpression()), !dbg !587
  %arrayidx28.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv51.i, !dbg !619
  %148 = load double, ptr %arrayidx28.i, align 8, !dbg !619
  %mul29.i = fmul double %148, %div142.i, !dbg !621
  store double %mul29.i, ptr %arrayidx28.i, align 8, !dbg !622
  %149 = add nuw nsw i64 %indvars.iv51.i, 1, !dbg !623
  %arrayidx34.i242 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %149, !dbg !624
  %150 = load double, ptr %arrayidx34.i242, align 8, !dbg !624
  %mul35.i = fmul double %150, %div142.i, !dbg !625
  store double %mul35.i, ptr %arrayidx34.i242, align 8, !dbg !626
  %151 = add nuw nsw i64 %indvars.iv51.i, 2, !dbg !627
  %arrayidx41.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %151, !dbg !628
  %152 = load double, ptr %arrayidx41.i, align 8, !dbg !628
  %mul42.i = fmul double %152, %div142.i, !dbg !629
  store double %mul42.i, ptr %arrayidx41.i, align 8, !dbg !630
  %153 = add nuw nsw i64 %indvars.iv51.i, 3, !dbg !631
  %arrayidx48.i = getelementptr inbounds double, ptr %arrayidx149.i, i64 %153, !dbg !632
  %154 = load double, ptr %arrayidx48.i, align 8, !dbg !632
  %mul49.i = fmul double %154, %div142.i, !dbg !633
  store double %mul49.i, ptr %arrayidx48.i, align 8, !dbg !634
  %155 = add nuw nsw i64 %indvars.iv51.i, 4, !dbg !635
  %arrayidx55.i243 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %155, !dbg !636
  %156 = load double, ptr %arrayidx55.i243, align 8, !dbg !636
  %mul56.i = fmul double %156, %div142.i, !dbg !637
  store double %mul56.i, ptr %arrayidx55.i243, align 8, !dbg !638
  %indvars.iv.next52.i = add nuw nsw i64 %indvars.iv51.i, 5, !dbg !639
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next52.i, metadata !604, metadata !DIExpression()), !dbg !587
  %157 = trunc i64 %indvars.iv.next52.i to i32, !dbg !615
  %cmp25.i = icmp slt i32 %157, %136, !dbg !615
  br i1 %cmp25.i, label %for.body26.i241, label %dscal_ur.exit, !dbg !618, !llvm.loop !640

dscal_ur.exit:                                    ; preds = %for.body26.i241, %if.end137.i, %for.end19.i, %if.end23.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next217.i, metadata !320, metadata !DIExpression()), !dbg !533
  %158 = sext i32 %add110.i to i64, !dbg !642
  %159 = trunc i64 %134 to i32
  br label %for.body152.i, !dbg !642

for.body152.i:                                    ; preds = %daxpy_ur.exit315, %dscal_ur.exit
  %indvars.iv208.i = phi i64 [ %indvars.iv206.i, %dscal_ur.exit ], [ %indvars.iv.next209.i, %daxpy_ur.exit315 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv208.i, metadata !320, metadata !DIExpression()), !dbg !533
  %160 = mul nuw nsw i64 %indvars.iv208.i, 200, !dbg !644
  %161 = add nsw i64 %160, %158, !dbg !647
  %arrayidx156.i = getelementptr inbounds double, ptr %0, i64 %161, !dbg !648
  %162 = load double, ptr %arrayidx156.i, align 8, !dbg !648
  call void @llvm.dbg.value(metadata double %162, metadata !283, metadata !DIExpression()), !dbg !533
  br i1 %cmp119.not.i, label %if.end171.i, label %if.then158.i, !dbg !649

if.then158.i:                                     ; preds = %for.body152.i
  %163 = add nuw nsw i64 %160, %indvars.iv216.i, !dbg !650
  %arrayidx162.i = getelementptr inbounds double, ptr %0, i64 %163, !dbg !653
  %164 = load double, ptr %arrayidx162.i, align 8, !dbg !653
  store double %164, ptr %arrayidx156.i, align 8, !dbg !654
  store double %162, ptr %arrayidx162.i, align 8, !dbg !655
  br label %if.end171.i, !dbg !656

if.end171.i:                                      ; preds = %if.then158.i, %for.body152.i
  %165 = add nuw nsw i64 %indvars.iv.next217.i, %160, !dbg !657
  %arrayidx183.i = getelementptr inbounds double, ptr %0, i64 %165, !dbg !658
  call void @llvm.dbg.value(metadata i32 %159, metadata !659, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata double %162, metadata !663, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata ptr %arrayidx149.i, metadata !664, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata i32 1, metadata !665, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata ptr %arrayidx183.i, metadata !666, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata i32 1, metadata !667, metadata !DIExpression()), !dbg !661
  %cmp.i283 = icmp slt i32 %159, 1, !dbg !668
  %cmp1.i284 = fcmp oeq double %162, 0.000000e+00
  %or.cond1.i285 = or i1 %cmp.i283, %cmp1.i284, !dbg !670
  br i1 %or.cond1.i285, label %daxpy_ur.exit315, label %if.end26.i286, !dbg !670

if.end26.i286:                                    ; preds = %if.end171.i
  %rem.i287 = and i32 %159, 3
  call void @llvm.dbg.value(metadata i32 %rem.i287, metadata !671, metadata !DIExpression()), !dbg !661
  %cmp27.not.i288 = icmp eq i32 %rem.i287, 0, !dbg !672
  br i1 %cmp27.not.i288, label %if.end45.i313, label %for.body31.i289, !dbg !674

for.body31.i289:                                  ; preds = %if.end26.i286
  call void @llvm.dbg.value(metadata i64 0, metadata !675, metadata !DIExpression()), !dbg !661
  %166 = load double, ptr %arrayidx183.i, align 8, !dbg !676
  %167 = load double, ptr %arrayidx149.i, align 8, !dbg !680
  %168 = call double @llvm.fmuladd.f64(double %162, double %167, double %166), !dbg !681
  store double %168, ptr %arrayidx183.i, align 8, !dbg !682
  call void @llvm.dbg.value(metadata i64 1, metadata !675, metadata !DIExpression()), !dbg !661
  %exitcond.not.i290 = icmp eq i32 %rem.i287, 1, !dbg !683
  br i1 %exitcond.not.i290, label %for.end41.i298, label %for.body31.1.i291, !dbg !684, !llvm.loop !685

for.body31.1.i291:                                ; preds = %for.body31.i289
  call void @llvm.dbg.value(metadata i64 1, metadata !675, metadata !DIExpression()), !dbg !661
  %arrayidx33.1.i292 = getelementptr inbounds double, ptr %arrayidx183.i, i64 1, !dbg !676
  %169 = load double, ptr %arrayidx33.1.i292, align 8, !dbg !676
  %arrayidx35.1.i293 = getelementptr inbounds double, ptr %arrayidx149.i, i64 1, !dbg !680
  %170 = load double, ptr %arrayidx35.1.i293, align 8, !dbg !680
  %171 = call double @llvm.fmuladd.f64(double %162, double %170, double %169), !dbg !681
  store double %171, ptr %arrayidx33.1.i292, align 8, !dbg !682
  call void @llvm.dbg.value(metadata i64 2, metadata !675, metadata !DIExpression()), !dbg !661
  %exitcond.not.1.i294 = icmp eq i32 %rem.i287, 2, !dbg !683
  br i1 %exitcond.not.1.i294, label %for.end41.i298, label %for.body31.2.i295, !dbg !684, !llvm.loop !687

for.body31.2.i295:                                ; preds = %for.body31.1.i291
  call void @llvm.dbg.value(metadata i64 2, metadata !675, metadata !DIExpression()), !dbg !661
  %arrayidx33.2.i296 = getelementptr inbounds double, ptr %arrayidx183.i, i64 2, !dbg !676
  %172 = load double, ptr %arrayidx33.2.i296, align 8, !dbg !676
  %arrayidx35.2.i297 = getelementptr inbounds double, ptr %arrayidx149.i, i64 2, !dbg !680
  %173 = load double, ptr %arrayidx35.2.i297, align 8, !dbg !680
  %174 = call double @llvm.fmuladd.f64(double %162, double %173, double %172), !dbg !681
  store double %174, ptr %arrayidx33.2.i296, align 8, !dbg !682
  call void @llvm.dbg.value(metadata i64 3, metadata !675, metadata !DIExpression()), !dbg !661
  br label %for.end41.i298

for.end41.i298:                                   ; preds = %for.body31.2.i295, %for.body31.1.i291, %for.body31.i289
  %cmp4762.i299 = icmp sgt i32 %159, 3
  call void @llvm.dbg.value(metadata i32 %rem.i287, metadata !675, metadata !DIExpression()), !dbg !661
  br i1 %cmp4762.i299, label %for.body48.preheader.i300, label %daxpy_ur.exit315, !dbg !688

if.end45.i313:                                    ; preds = %if.end26.i286
  call void @llvm.dbg.value(metadata i32 %rem.i287, metadata !675, metadata !DIExpression()), !dbg !661
  %cmp4762.old.i314 = icmp sgt i32 %159, 3, !dbg !689
  br i1 %cmp4762.old.i314, label %for.body48.preheader.i300, label %daxpy_ur.exit315, !dbg !692

for.body48.preheader.i300:                        ; preds = %if.end45.i313, %for.end41.i298
  %175 = and i32 %159, 3, !dbg !692
  %176 = zext i32 %175 to i64, !dbg !692
  %177 = sext i32 %159 to i64, !dbg !692
  br label %for.body48.i301, !dbg !692

for.body48.i301:                                  ; preds = %for.body48.i301, %for.body48.preheader.i300
  %indvars.iv65.i302 = phi i64 [ %176, %for.body48.preheader.i300 ], [ %indvars.iv.next66.i311, %for.body48.i301 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv65.i302, metadata !675, metadata !DIExpression()), !dbg !661
  %arrayidx50.i303 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %indvars.iv65.i302, !dbg !693
  %178 = load double, ptr %arrayidx50.i303, align 8, !dbg !693
  %arrayidx52.i304 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %indvars.iv65.i302, !dbg !695
  %179 = load double, ptr %arrayidx52.i304, align 8, !dbg !695
  %180 = call double @llvm.fmuladd.f64(double %162, double %179, double %178), !dbg !696
  store double %180, ptr %arrayidx50.i303, align 8, !dbg !697
  %181 = add nuw nsw i64 %indvars.iv65.i302, 1, !dbg !698
  %arrayidx58.i305 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %181, !dbg !699
  %182 = load double, ptr %arrayidx58.i305, align 8, !dbg !699
  %arrayidx61.i306 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %181, !dbg !700
  %183 = load double, ptr %arrayidx61.i306, align 8, !dbg !700
  %184 = call double @llvm.fmuladd.f64(double %162, double %183, double %182), !dbg !701
  store double %184, ptr %arrayidx58.i305, align 8, !dbg !702
  %185 = add nuw nsw i64 %indvars.iv65.i302, 2, !dbg !703
  %arrayidx68.i307 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %185, !dbg !704
  %186 = load double, ptr %arrayidx68.i307, align 8, !dbg !704
  %arrayidx71.i308 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %185, !dbg !705
  %187 = load double, ptr %arrayidx71.i308, align 8, !dbg !705
  %188 = call double @llvm.fmuladd.f64(double %162, double %187, double %186), !dbg !706
  store double %188, ptr %arrayidx68.i307, align 8, !dbg !707
  %189 = add nuw nsw i64 %indvars.iv65.i302, 3, !dbg !708
  %arrayidx78.i309 = getelementptr inbounds double, ptr %arrayidx183.i, i64 %189, !dbg !709
  %190 = load double, ptr %arrayidx78.i309, align 8, !dbg !709
  %arrayidx81.i310 = getelementptr inbounds double, ptr %arrayidx149.i, i64 %189, !dbg !710
  %191 = load double, ptr %arrayidx81.i310, align 8, !dbg !710
  %192 = call double @llvm.fmuladd.f64(double %162, double %191, double %190), !dbg !711
  store double %192, ptr %arrayidx78.i309, align 8, !dbg !712
  %indvars.iv.next66.i311 = add nuw nsw i64 %indvars.iv65.i302, 4, !dbg !713
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next66.i311, metadata !675, metadata !DIExpression()), !dbg !661
  %cmp47.i312 = icmp ult i64 %indvars.iv.next66.i311, %177, !dbg !689
  br i1 %cmp47.i312, label %for.body48.i301, label %daxpy_ur.exit315, !dbg !692, !llvm.loop !714

daxpy_ur.exit315:                                 ; preds = %for.body48.i301, %if.end171.i, %for.end41.i298, %if.end45.i313
  %indvars.iv.next209.i = add nuw nsw i64 %indvars.iv208.i, 1, !dbg !716
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next209.i, metadata !320, metadata !DIExpression()), !dbg !533
  %exitcond215.not.i = icmp eq i64 %indvars.iv.next209.i, 100, !dbg !717
  br i1 %exitcond215.not.i, label %for.inc189.i, label %for.body152.i, !dbg !642, !llvm.loop !718

if.else187.i:                                     ; preds = %idamax.exit
  %193 = trunc i64 %indvars.iv216.i to i32, !dbg !720
  store i32 %193, ptr %info.i, align 4, !dbg !720
  br label %for.inc189.i

for.inc189.i:                                     ; preds = %daxpy_ur.exit315, %if.else187.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next217.i, metadata !227, metadata !DIExpression()), !dbg !533
  %indvars.iv.next207.i = add nuw nsw i64 %indvars.iv206.i, 1, !dbg !721
  %exitcond225.not.i = icmp eq i64 %indvars.iv.next217.i, 99, !dbg !722
  br i1 %exitcond225.not.i, label %if.end192.i, label %for.body102.i, !dbg !721, !llvm.loop !723

if.end192.i:                                      ; preds = %for.inc189.i
  %div.i39 = fdiv double %conv.i38, 1.000000e+06, !dbg !725
  %arrayidx196.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 99, !dbg !726
  store i32 99, ptr %arrayidx196.i, align 4, !dbg !727
  %arrayidx202.i = getelementptr inbounds double, ptr %0, i64 19899, !dbg !728
  %194 = load double, ptr %arrayidx202.i, align 8, !dbg !728
  %cmp203.i = fcmp oeq double %194, 0.000000e+00, !dbg !730
  br i1 %cmp203.i, label %if.end207.sink.split.i93, label %dgefa.exit94, !dbg !731

if.end207.sink.split.i93:                         ; preds = %if.end192.i
  store i32 99, ptr %info.i, align 4, !dbg !535
  br label %dgefa.exit94, !dbg !732

dgefa.exit94:                                     ; preds = %if.end192.i, %if.end207.sink.split.i93
  %call.i34 = tail call i64 @clock() #11, !dbg !733
  %conv.i35 = sitofp i64 %call.i34 to double, !dbg !735
  %div.i36 = fdiv double %conv.i35, 1.000000e+06, !dbg !736
  %sub26.i = fsub double %div.i36, %div.i39, !dbg !737
  call void @llvm.dbg.value(metadata double %add27.i, metadata !127, metadata !DIExpression()), !dbg !109
  %call.i31 = tail call i64 @clock() #11, !dbg !738
  %conv.i32 = sitofp i64 %call.i31 to double, !dbg !740
  call void @llvm.dbg.value(metadata double %div.i33, metadata !211, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.value(metadata ptr %0, metadata !390, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.value(metadata i32 200, metadata !396, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.value(metadata i32 100, metadata !397, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.value(metadata ptr %arrayidx.i, metadata !398, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !399, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.value(metadata i32 0, metadata !400, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.value(metadata i32 0, metadata !401, metadata !DIExpression()), !dbg !741
  br label %for.body117.i

for.body117.i:                                    ; preds = %daxpy_ur.exit282, %dgefa.exit94
  %indvars.iv202.i = phi i64 [ %indvars.iv.next203.i, %daxpy_ur.exit282 ], [ 0, %dgefa.exit94 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv202.i, metadata !402, metadata !DIExpression()), !dbg !741
  %arrayidx119.i = getelementptr inbounds i32, ptr %arrayidx.i, i64 %indvars.iv202.i, !dbg !743
  %195 = load i32, ptr %arrayidx119.i, align 4, !dbg !743
  call void @llvm.dbg.value(metadata i32 %195, metadata !412, metadata !DIExpression()), !dbg !741
  %idxprom120.i = sext i32 %195 to i64, !dbg !751
  %arrayidx121.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %idxprom120.i, !dbg !751
  %196 = load double, ptr %arrayidx121.i, align 8, !dbg !751
  call void @llvm.dbg.value(metadata double %196, metadata !414, metadata !DIExpression()), !dbg !741
  %197 = zext i32 %195 to i64, !dbg !752
  %cmp122.not.i = icmp eq i64 %indvars.iv202.i, %197, !dbg !752
  br i1 %cmp122.not.i, label %if.end130.i, label %if.then123.i, !dbg !754

if.then123.i:                                     ; preds = %for.body117.i
  %arrayidx125.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv202.i, !dbg !755
  %198 = load double, ptr %arrayidx125.i, align 8, !dbg !755
  store double %198, ptr %arrayidx121.i, align 8, !dbg !757
  store double %196, ptr %arrayidx125.i, align 8, !dbg !758
  br label %if.end130.i, !dbg !759

if.end130.i:                                      ; preds = %if.then123.i, %for.body117.i
  %indvars.iv.next203.i = add nuw nsw i64 %indvars.iv202.i, 1, !dbg !760
  %199 = mul nuw nsw i64 %indvars.iv202.i, 201, !dbg !761
  %200 = add nuw nsw i64 %199, 1, !dbg !762
  %arrayidx137.i = getelementptr inbounds double, ptr %0, i64 %200, !dbg !763
  %arrayidx140.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv.next203.i, !dbg !764
  %201 = trunc i64 %indvars.iv202.i to i32, !dbg !765
  %202 = sub i32 99, %201, !dbg !765
  call void @llvm.dbg.value(metadata i32 %202, metadata !659, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata double %196, metadata !663, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata ptr %arrayidx137.i, metadata !664, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata i32 1, metadata !665, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata ptr %arrayidx140.i, metadata !666, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata i32 1, metadata !667, metadata !DIExpression()), !dbg !766
  %cmp.i250 = icmp slt i32 %202, 1, !dbg !768
  %cmp1.i251 = fcmp oeq double %196, 0.000000e+00
  %or.cond1.i252 = or i1 %cmp.i250, %cmp1.i251, !dbg !769
  br i1 %or.cond1.i252, label %daxpy_ur.exit282, label %if.end26.i253, !dbg !769

if.end26.i253:                                    ; preds = %if.end130.i
  %rem.i254 = and i32 %202, 3
  call void @llvm.dbg.value(metadata i32 %rem.i254, metadata !671, metadata !DIExpression()), !dbg !766
  %cmp27.not.i255 = icmp eq i32 %rem.i254, 0, !dbg !770
  br i1 %cmp27.not.i255, label %if.end45.i280, label %for.body31.i256, !dbg !771

for.body31.i256:                                  ; preds = %if.end26.i253
  call void @llvm.dbg.value(metadata i64 0, metadata !675, metadata !DIExpression()), !dbg !766
  %203 = load double, ptr %arrayidx140.i, align 8, !dbg !772
  %204 = load double, ptr %arrayidx137.i, align 8, !dbg !773
  %205 = tail call double @llvm.fmuladd.f64(double %196, double %204, double %203), !dbg !774
  store double %205, ptr %arrayidx140.i, align 8, !dbg !775
  call void @llvm.dbg.value(metadata i64 1, metadata !675, metadata !DIExpression()), !dbg !766
  %exitcond.not.i257 = icmp eq i32 %rem.i254, 1, !dbg !776
  br i1 %exitcond.not.i257, label %for.end41.i265, label %for.body31.1.i258, !dbg !777, !llvm.loop !778

for.body31.1.i258:                                ; preds = %for.body31.i256
  call void @llvm.dbg.value(metadata i64 1, metadata !675, metadata !DIExpression()), !dbg !766
  %arrayidx33.1.i259 = getelementptr inbounds double, ptr %arrayidx140.i, i64 1, !dbg !772
  %206 = load double, ptr %arrayidx33.1.i259, align 8, !dbg !772
  %arrayidx35.1.i260 = getelementptr inbounds double, ptr %arrayidx137.i, i64 1, !dbg !773
  %207 = load double, ptr %arrayidx35.1.i260, align 8, !dbg !773
  %208 = tail call double @llvm.fmuladd.f64(double %196, double %207, double %206), !dbg !774
  store double %208, ptr %arrayidx33.1.i259, align 8, !dbg !775
  call void @llvm.dbg.value(metadata i64 2, metadata !675, metadata !DIExpression()), !dbg !766
  %exitcond.not.1.i261 = icmp eq i32 %rem.i254, 2, !dbg !776
  br i1 %exitcond.not.1.i261, label %for.end41.i265, label %for.body31.2.i262, !dbg !777, !llvm.loop !780

for.body31.2.i262:                                ; preds = %for.body31.1.i258
  call void @llvm.dbg.value(metadata i64 2, metadata !675, metadata !DIExpression()), !dbg !766
  %arrayidx33.2.i263 = getelementptr inbounds double, ptr %arrayidx140.i, i64 2, !dbg !772
  %209 = load double, ptr %arrayidx33.2.i263, align 8, !dbg !772
  %arrayidx35.2.i264 = getelementptr inbounds double, ptr %arrayidx137.i, i64 2, !dbg !773
  %210 = load double, ptr %arrayidx35.2.i264, align 8, !dbg !773
  %211 = tail call double @llvm.fmuladd.f64(double %196, double %210, double %209), !dbg !774
  store double %211, ptr %arrayidx33.2.i263, align 8, !dbg !775
  call void @llvm.dbg.value(metadata i64 3, metadata !675, metadata !DIExpression()), !dbg !766
  br label %for.end41.i265

for.end41.i265:                                   ; preds = %for.body31.2.i262, %for.body31.1.i258, %for.body31.i256
  %cmp4762.i266 = icmp sgt i32 %202, 3
  call void @llvm.dbg.value(metadata i32 %rem.i254, metadata !675, metadata !DIExpression()), !dbg !766
  br i1 %cmp4762.i266, label %for.body48.preheader.i267, label %daxpy_ur.exit282, !dbg !781

if.end45.i280:                                    ; preds = %if.end26.i253
  call void @llvm.dbg.value(metadata i32 %rem.i254, metadata !675, metadata !DIExpression()), !dbg !766
  %cmp4762.old.i281 = icmp sgt i32 %202, 3, !dbg !782
  br i1 %cmp4762.old.i281, label %for.body48.preheader.i267, label %daxpy_ur.exit282, !dbg !783

for.body48.preheader.i267:                        ; preds = %if.end45.i280, %for.end41.i265
  %212 = and i32 %202, 3, !dbg !783
  %213 = zext i32 %212 to i64, !dbg !783
  %214 = sext i32 %202 to i64, !dbg !783
  br label %for.body48.i268, !dbg !783

for.body48.i268:                                  ; preds = %for.body48.i268, %for.body48.preheader.i267
  %indvars.iv65.i269 = phi i64 [ %213, %for.body48.preheader.i267 ], [ %indvars.iv.next66.i278, %for.body48.i268 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv65.i269, metadata !675, metadata !DIExpression()), !dbg !766
  %arrayidx50.i270 = getelementptr inbounds double, ptr %arrayidx140.i, i64 %indvars.iv65.i269, !dbg !784
  %215 = load double, ptr %arrayidx50.i270, align 8, !dbg !784
  %arrayidx52.i271 = getelementptr inbounds double, ptr %arrayidx137.i, i64 %indvars.iv65.i269, !dbg !785
  %216 = load double, ptr %arrayidx52.i271, align 8, !dbg !785
  %217 = tail call double @llvm.fmuladd.f64(double %196, double %216, double %215), !dbg !786
  store double %217, ptr %arrayidx50.i270, align 8, !dbg !787
  %218 = add nuw nsw i64 %indvars.iv65.i269, 1, !dbg !788
  %arrayidx58.i272 = getelementptr inbounds double, ptr %arrayidx140.i, i64 %218, !dbg !789
  %219 = load double, ptr %arrayidx58.i272, align 8, !dbg !789
  %arrayidx61.i273 = getelementptr inbounds double, ptr %arrayidx137.i, i64 %218, !dbg !790
  %220 = load double, ptr %arrayidx61.i273, align 8, !dbg !790
  %221 = tail call double @llvm.fmuladd.f64(double %196, double %220, double %219), !dbg !791
  store double %221, ptr %arrayidx58.i272, align 8, !dbg !792
  %222 = add nuw nsw i64 %indvars.iv65.i269, 2, !dbg !793
  %arrayidx68.i274 = getelementptr inbounds double, ptr %arrayidx140.i, i64 %222, !dbg !794
  %223 = load double, ptr %arrayidx68.i274, align 8, !dbg !794
  %arrayidx71.i275 = getelementptr inbounds double, ptr %arrayidx137.i, i64 %222, !dbg !795
  %224 = load double, ptr %arrayidx71.i275, align 8, !dbg !795
  %225 = tail call double @llvm.fmuladd.f64(double %196, double %224, double %223), !dbg !796
  store double %225, ptr %arrayidx68.i274, align 8, !dbg !797
  %226 = add nuw nsw i64 %indvars.iv65.i269, 3, !dbg !798
  %arrayidx78.i276 = getelementptr inbounds double, ptr %arrayidx140.i, i64 %226, !dbg !799
  %227 = load double, ptr %arrayidx78.i276, align 8, !dbg !799
  %arrayidx81.i277 = getelementptr inbounds double, ptr %arrayidx137.i, i64 %226, !dbg !800
  %228 = load double, ptr %arrayidx81.i277, align 8, !dbg !800
  %229 = tail call double @llvm.fmuladd.f64(double %196, double %228, double %227), !dbg !801
  store double %229, ptr %arrayidx78.i276, align 8, !dbg !802
  %indvars.iv.next66.i278 = add nuw nsw i64 %indvars.iv65.i269, 4, !dbg !803
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next66.i278, metadata !675, metadata !DIExpression()), !dbg !766
  %cmp47.i279 = icmp ult i64 %indvars.iv.next66.i278, %214, !dbg !782
  br i1 %cmp47.i279, label %for.body48.i268, label %daxpy_ur.exit282, !dbg !783, !llvm.loop !804

daxpy_ur.exit282:                                 ; preds = %for.body48.i268, %if.end130.i, %for.end41.i265, %if.end45.i280
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next203.i, metadata !402, metadata !DIExpression()), !dbg !741
  %exitcond208.not.i = icmp eq i64 %indvars.iv.next203.i, 99, !dbg !806
  br i1 %exitcond208.not.i, label %for.body147.i.preheader, label %for.body117.i, !dbg !807, !llvm.loop !808

for.body147.i.preheader:                          ; preds = %daxpy_ur.exit282
  %add27.i = fadd double %tdgefa.168.i, %sub26.i, !dbg !810
  br label %for.body147.i, !dbg !811

for.body147.i:                                    ; preds = %for.body147.i.preheader, %daxpy_ur.exit
  %indvars.iv209.i = phi i64 [ %indvars.iv.next210.i, %daxpy_ur.exit ], [ 0, %for.body147.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv209.i, metadata !450, metadata !DIExpression()), !dbg !741
  %indvars.iv.next210.i = add nuw nsw i64 %indvars.iv209.i, 1, !dbg !813
  %230 = sub nuw nsw i64 99, %indvars.iv209.i, !dbg !816
  call void @llvm.dbg.value(metadata i64 %230, metadata !402, metadata !DIExpression()), !dbg !741
  %arrayidx151.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %230, !dbg !817
  %231 = load double, ptr %arrayidx151.i, align 8, !dbg !817
  %232 = mul nuw nsw i64 %230, 200, !dbg !818
  %233 = mul nuw nsw i64 %230, 201, !dbg !819
  %arrayidx155.i = getelementptr inbounds double, ptr %0, i64 %233, !dbg !820
  %234 = load double, ptr %arrayidx155.i, align 8, !dbg !820
  %div156.i = fdiv double %231, %234, !dbg !821
  store double %div156.i, ptr %arrayidx151.i, align 8, !dbg !822
  %fneg161.i = fneg double %div156.i, !dbg !823
  call void @llvm.dbg.value(metadata double %fneg161.i, metadata !414, metadata !DIExpression()), !dbg !741
  %arrayidx165.i = getelementptr inbounds double, ptr %0, i64 %232, !dbg !824
  %235 = trunc i64 %230 to i32, !dbg !825
  call void @llvm.dbg.value(metadata i32 %235, metadata !659, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata double %fneg161.i, metadata !663, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata ptr %arrayidx165.i, metadata !664, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata i32 1, metadata !665, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata ptr %add.ptr.i, metadata !666, metadata !DIExpression()), !dbg !826
  call void @llvm.dbg.value(metadata i32 1, metadata !667, metadata !DIExpression()), !dbg !826
  %cmp.i244 = icmp slt i32 %235, 1, !dbg !828
  %cmp1.i245 = fcmp oeq double %fneg161.i, 0.000000e+00
  %or.cond1.i246 = or i1 %cmp.i244, %cmp1.i245, !dbg !829
  br i1 %or.cond1.i246, label %daxpy_ur.exit, label %if.end26.i, !dbg !829

if.end26.i:                                       ; preds = %for.body147.i
  %rem.i247 = and i32 %235, 3
  call void @llvm.dbg.value(metadata i32 %rem.i247, metadata !671, metadata !DIExpression()), !dbg !826
  %cmp27.not.i = icmp eq i32 %rem.i247, 0, !dbg !830
  br i1 %cmp27.not.i, label %if.end45.i, label %for.body31.i, !dbg !831

for.body31.i:                                     ; preds = %if.end26.i
  call void @llvm.dbg.value(metadata i64 0, metadata !675, metadata !DIExpression()), !dbg !826
  %236 = load double, ptr %add.ptr.i, align 8, !dbg !832
  %237 = load double, ptr %arrayidx165.i, align 8, !dbg !833
  %238 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %237, double %236), !dbg !834
  store double %238, ptr %add.ptr.i, align 8, !dbg !835
  call void @llvm.dbg.value(metadata i64 1, metadata !675, metadata !DIExpression()), !dbg !826
  %exitcond.not.i248 = icmp eq i32 %rem.i247, 1, !dbg !836
  br i1 %exitcond.not.i248, label %for.end41.i, label %for.body31.1.i, !dbg !837, !llvm.loop !838

for.body31.1.i:                                   ; preds = %for.body31.i
  call void @llvm.dbg.value(metadata i64 1, metadata !675, metadata !DIExpression()), !dbg !826
  %arrayidx33.1.i249 = getelementptr inbounds double, ptr %add.ptr.i, i64 1, !dbg !832
  %239 = load double, ptr %arrayidx33.1.i249, align 8, !dbg !832
  %arrayidx35.1.i = getelementptr inbounds double, ptr %arrayidx165.i, i64 1, !dbg !833
  %240 = load double, ptr %arrayidx35.1.i, align 8, !dbg !833
  %241 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %240, double %239), !dbg !834
  store double %241, ptr %arrayidx33.1.i249, align 8, !dbg !835
  call void @llvm.dbg.value(metadata i64 2, metadata !675, metadata !DIExpression()), !dbg !826
  %exitcond.not.1.i = icmp eq i32 %rem.i247, 2, !dbg !836
  br i1 %exitcond.not.1.i, label %for.end41.i, label %for.body31.2.i, !dbg !837, !llvm.loop !840

for.body31.2.i:                                   ; preds = %for.body31.1.i
  call void @llvm.dbg.value(metadata i64 2, metadata !675, metadata !DIExpression()), !dbg !826
  %arrayidx33.2.i = getelementptr inbounds double, ptr %add.ptr.i, i64 2, !dbg !832
  %242 = load double, ptr %arrayidx33.2.i, align 8, !dbg !832
  %arrayidx35.2.i = getelementptr inbounds double, ptr %arrayidx165.i, i64 2, !dbg !833
  %243 = load double, ptr %arrayidx35.2.i, align 8, !dbg !833
  %244 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %243, double %242), !dbg !834
  store double %244, ptr %arrayidx33.2.i, align 8, !dbg !835
  call void @llvm.dbg.value(metadata i64 3, metadata !675, metadata !DIExpression()), !dbg !826
  br label %for.end41.i

for.end41.i:                                      ; preds = %for.body31.2.i, %for.body31.1.i, %for.body31.i
  %cmp4762.i = icmp sgt i32 %235, 3
  call void @llvm.dbg.value(metadata i32 %rem.i247, metadata !675, metadata !DIExpression()), !dbg !826
  br i1 %cmp4762.i, label %for.body48.preheader.i, label %daxpy_ur.exit, !dbg !841

if.end45.i:                                       ; preds = %if.end26.i
  call void @llvm.dbg.value(metadata i32 %rem.i247, metadata !675, metadata !DIExpression()), !dbg !826
  %cmp4762.old.i = icmp sgt i32 %235, 3, !dbg !842
  br i1 %cmp4762.old.i, label %for.body48.preheader.i, label %daxpy_ur.exit, !dbg !843

for.body48.preheader.i:                           ; preds = %if.end45.i, %for.end41.i
  %245 = and i32 %235, 3, !dbg !843
  %246 = zext i32 %245 to i64, !dbg !843
  %247 = sext i32 %235 to i64, !dbg !843
  br label %for.body48.i, !dbg !843

for.body48.i:                                     ; preds = %for.body48.i, %for.body48.preheader.i
  %indvars.iv65.i = phi i64 [ %246, %for.body48.preheader.i ], [ %indvars.iv.next66.i, %for.body48.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv65.i, metadata !675, metadata !DIExpression()), !dbg !826
  %arrayidx50.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %indvars.iv65.i, !dbg !844
  %248 = load double, ptr %arrayidx50.i, align 8, !dbg !844
  %arrayidx52.i = getelementptr inbounds double, ptr %arrayidx165.i, i64 %indvars.iv65.i, !dbg !845
  %249 = load double, ptr %arrayidx52.i, align 8, !dbg !845
  %250 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %249, double %248), !dbg !846
  store double %250, ptr %arrayidx50.i, align 8, !dbg !847
  %251 = add nuw nsw i64 %indvars.iv65.i, 1, !dbg !848
  %arrayidx58.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %251, !dbg !849
  %252 = load double, ptr %arrayidx58.i, align 8, !dbg !849
  %arrayidx61.i = getelementptr inbounds double, ptr %arrayidx165.i, i64 %251, !dbg !850
  %253 = load double, ptr %arrayidx61.i, align 8, !dbg !850
  %254 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %253, double %252), !dbg !851
  store double %254, ptr %arrayidx58.i, align 8, !dbg !852
  %255 = add nuw nsw i64 %indvars.iv65.i, 2, !dbg !853
  %arrayidx68.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %255, !dbg !854
  %256 = load double, ptr %arrayidx68.i, align 8, !dbg !854
  %arrayidx71.i = getelementptr inbounds double, ptr %arrayidx165.i, i64 %255, !dbg !855
  %257 = load double, ptr %arrayidx71.i, align 8, !dbg !855
  %258 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %257, double %256), !dbg !856
  store double %258, ptr %arrayidx68.i, align 8, !dbg !857
  %259 = add nuw nsw i64 %indvars.iv65.i, 3, !dbg !858
  %arrayidx78.i = getelementptr inbounds double, ptr %add.ptr.i, i64 %259, !dbg !859
  %260 = load double, ptr %arrayidx78.i, align 8, !dbg !859
  %arrayidx81.i = getelementptr inbounds double, ptr %arrayidx165.i, i64 %259, !dbg !860
  %261 = load double, ptr %arrayidx81.i, align 8, !dbg !860
  %262 = tail call double @llvm.fmuladd.f64(double %fneg161.i, double %261, double %260), !dbg !861
  store double %262, ptr %arrayidx78.i, align 8, !dbg !862
  %indvars.iv.next66.i = add nuw nsw i64 %indvars.iv65.i, 4, !dbg !863
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next66.i, metadata !675, metadata !DIExpression()), !dbg !826
  %cmp47.i = icmp ult i64 %indvars.iv.next66.i, %247, !dbg !842
  br i1 %cmp47.i, label %for.body48.i, label %daxpy_ur.exit, !dbg !843, !llvm.loop !864

daxpy_ur.exit:                                    ; preds = %for.body48.i, %for.body147.i, %for.end41.i, %if.end45.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next210.i, metadata !450, metadata !DIExpression()), !dbg !741
  %exitcond215.not.i103 = icmp eq i64 %indvars.iv.next210.i, 100, !dbg !866
  br i1 %exitcond215.not.i103, label %dgesl.exit104, label %for.body147.i, !dbg !811, !llvm.loop !867

dgesl.exit104:                                    ; preds = %daxpy_ur.exit
  %div.i33 = fdiv double %conv.i32, 1.000000e+06, !dbg !869
  %call.i28 = tail call i64 @clock() #11, !dbg !870
  %conv.i29 = sitofp i64 %call.i28 to double, !dbg !872
  %div.i30 = fdiv double %conv.i29, 1.000000e+06, !dbg !873
  %sub30.i = fsub double %div.i30, %div.i33, !dbg !874
  %add31.i = fadd double %tdgesl.169.i, %sub30.i, !dbg !875
  call void @llvm.dbg.value(metadata double %add31.i, metadata !126, metadata !DIExpression()), !dbg !109
  %inc33.i = add nuw nsw i64 %i.170.i, 1, !dbg !876
  call void @llvm.dbg.value(metadata i64 %inc33.i, metadata !136, metadata !DIExpression()), !dbg !109
  %exitcond73.not.i = icmp eq i64 %inc33.i, %nreps.0, !dbg !141
  br i1 %exitcond73.not.i, label %for.end34.i, label %for.body23.i, !dbg !144, !llvm.loop !877

for.end34.i:                                      ; preds = %dgesl.exit104, %for.cond20.preheader.i
  %tdgefa.1.lcssa.i = phi double [ %tdgefa.0.lcssa.i, %for.cond20.preheader.i ], [ %add27.i, %dgesl.exit104 ], !dbg !109
  %tdgesl.1.lcssa.i = phi double [ %tdgesl.0.lcssa.i, %for.cond20.preheader.i ], [ %add31.i, %dgesl.exit104 ], !dbg !109
  %call.i40 = tail call i64 @clock() #11, !dbg !879
  %conv.i41 = sitofp i64 %call.i40 to double, !dbg !881
  %div.i42 = fdiv double %conv.i41, 1.000000e+06, !dbg !882
  %sub36.i = fsub double %div.i42, %div.i45, !dbg !883
  call void @llvm.dbg.value(metadata double %sub36.i, metadata !135, metadata !DIExpression()), !dbg !109
  %cmp37.i = fcmp olt double %sub36.i, 5.000000e-01, !dbg !884
  br i1 %cmp37.i, label %linpack.exit, label %lor.lhs.false.i, !dbg !886

lor.lhs.false.i:                                  ; preds = %for.end34.i
  %add39.i = fadd double %tdgefa.1.lcssa.i, %tdgesl.1.lcssa.i, !dbg !887
  %cmp40.i = fcmp olt double %add39.i, 2.000000e-01, !dbg !888
  br i1 %cmp40.i, label %linpack.exit, label %if.end.i, !dbg !889

if.end.i:                                         ; preds = %lor.lhs.false.i
  %conv42.i = sitofp i64 %nreps.0 to double, !dbg !890
  %mul43.i = fmul double %conv42.i, 2.000000e+00, !dbg !891
  %mul44.i = fmul double %mul43.i, 0x4124F49555555555, !dbg !892
  %mul46.i = fmul double %add39.i, 1.000000e+03, !dbg !893
  %div47.i = fdiv double %mul44.i, %mul46.i, !dbg !894
  call void @llvm.dbg.value(metadata double %div47.i, metadata !895, metadata !DIExpression()), !dbg !109
  %sub48.i = fsub double %sub36.i, %tdgefa.1.lcssa.i, !dbg !896
  %sub49.i = fsub double %sub48.i, %tdgesl.1.lcssa.i, !dbg !897
  call void @llvm.dbg.value(metadata double %sub49.i, metadata !898, metadata !DIExpression()), !dbg !109
  %cmp50.i = fcmp olt double %tdgefa.1.lcssa.i, 0.000000e+00, !dbg !899
  %263 = fmul double %tdgefa.1.lcssa.i, 1.000000e+02, !dbg !901
  call void @llvm.dbg.value(metadata double poison, metadata !127, metadata !DIExpression()), !dbg !109
  %cmp54.i = fcmp olt double %tdgesl.1.lcssa.i, 0.000000e+00, !dbg !902
  %264 = fmul double %tdgesl.1.lcssa.i, 1.000000e+02, !dbg !904
  call void @llvm.dbg.value(metadata double poison, metadata !126, metadata !DIExpression()), !dbg !109
  %cmp58.i = fcmp olt double %sub49.i, 0.000000e+00, !dbg !905
  %265 = fmul double %sub49.i, 1.000000e+02, !dbg !907
  call void @llvm.dbg.value(metadata double poison, metadata !898, metadata !DIExpression()), !dbg !109
  %mul62.i = select i1 %cmp50.i, double 0.000000e+00, double %263, !dbg !901
  %div63.i = fdiv double %mul62.i, %sub36.i, !dbg !908
  %mul64.i = select i1 %cmp54.i, double 0.000000e+00, double %264, !dbg !904
  %div65.i = fdiv double %mul64.i, %sub36.i, !dbg !909
  %mul66.i = select i1 %cmp58.i, double 0.000000e+00, double %265, !dbg !907
  %div67.i = fdiv double %mul66.i, %sub36.i, !dbg !910
  %call68.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i64 noundef %nreps.0, double noundef %sub36.i, double noundef %div63.i, double noundef %div65.i, double noundef %div67.i, double noundef %div47.i), !dbg !911
  br label %linpack.exit, !dbg !912

linpack.exit:                                     ; preds = %for.end34.i, %lor.lhs.false.i, %if.end.i
  %retval.0.i = phi double [ %sub36.i, %if.end.i ], [ 0.000000e+00, %lor.lhs.false.i ], [ 0.000000e+00, %for.end34.i ], !dbg !109
  call void @llvm.lifetime.end.p0(i64 8, ptr %norma.i), !dbg !913
  call void @llvm.lifetime.end.p0(i64 4, ptr %info.i), !dbg !913
  %cmp30 = fcmp olt double %retval.0.i, 1.000000e+01, !dbg !914
  %mul32 = shl nsw i64 %nreps.0, 1, !dbg !915
  call void @llvm.dbg.value(metadata i64 %mul32, metadata !107, metadata !DIExpression()), !dbg !87
  br i1 %cmp30, label %while.cond, label %while.end, !dbg !108, !llvm.loop !916

while.end:                                        ; preds = %linpack.exit
  %266 = load ptr, ptr @mempool, align 8, !dbg !918
  tail call void @free(ptr noundef %266) #11, !dbg !919
  %putchar = tail call i32 @putchar(i32 10), !dbg !920
  br label %return, !dbg !921

return:                                           ; preds = %while.end, %if.then20
  %retval.0 = phi i32 [ 2, %if.then20 ], [ 0, %while.end ]
  ret i32 %retval.0, !dbg !921
}

; Function Attrs: alwaysinline nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: alwaysinline mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: alwaysinline mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #3

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

; Function Attrs: alwaysinline nounwind
declare i64 @clock() local_unnamed_addr #5

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #4

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #6

; Function Attrs: alwaysinline nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #7

; Function Attrs: alwaysinline nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #7

; Function Attrs: alwaysinline nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #9

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #9

attributes #0 = { alwaysinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { alwaysinline nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { alwaysinline mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { alwaysinline mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { alwaysinline nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { alwaysinline nofree nounwind }
attributes #8 = { alwaysinline nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!9}
!llvm.module.flags = !{!73, !74, !75, !76, !77, !78, !79}
!llvm.ident = !{!80}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 90, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../test/testInputs/linpack.c", directory: "/home/madison.bradley/llvm-detect-strided-accesses/llvm-passes/build", checksumkind: CSK_MD5, checksum: "a7264ed25255195eda2cf2d086f7387a")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 25)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "mempool", scope: !9, file: !2, line: 64, type: !11, isLocal: true, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !10, globals: !23, splitDebugInlining: false, nameTableKind: None)
!10 = !{!11, !12, !13, !16, !19, !17, !21, !20, !18}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !14, line: 46, baseType: !15)
!14 = !DIFile(filename: "llvm/llvm-17/lib/clang/17/include/stddef.h", directory: "/home/madison.bradley", checksumkind: CSK_MD5, checksum: "d1776268f398bd1ca997c840ad581432")
!15 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "REAL", file: !2, line: 48, baseType: !18)
!18 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !22, line: 156, baseType: !12)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "f6304b1a6dcfc6bee76e9a51043b5090")
!23 = !{!24, !0, !29, !34, !39, !44, !49, !54, !59, !61, !66, !7, !71}
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 85, type: !26, isLocal: true, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 12)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(scope: null, file: !2, line: 94, type: !31, isLocal: true, isDefinition: true)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 416, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 52)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(scope: null, file: !2, line: 97, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 288, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 36)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(scope: null, file: !2, line: 97, type: !41, isLocal: true, isDefinition: true)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 7)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(scope: null, file: !2, line: 98, type: !46, isLocal: true, isDefinition: true)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 32)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(scope: null, file: !2, line: 99, type: !51, isLocal: true, isDefinition: true)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 21)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(scope: null, file: !2, line: 100, type: !56, isLocal: true, isDefinition: true)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 344, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 43)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(scope: null, file: !2, line: 101, type: !31, isLocal: true, isDefinition: true)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(scope: null, file: !2, line: 102, type: !63, isLocal: true, isDefinition: true)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 432, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 54)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !2, line: 107, type: !68, isLocal: true, isDefinition: true)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 2)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !2, line: 160, type: !56, isLocal: true, isDefinition: true)
!73 = !{i32 7, !"Dwarf Version", i32 5}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 4}
!76 = !{i32 8, !"PIC Level", i32 2}
!77 = !{i32 7, !"PIE Level", i32 2}
!78 = !{i32 7, !"uwtable", i32 2}
!79 = !{i32 7, !"frame-pointer", i32 2}
!80 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 88bf774c565080e30e0a073676c316ab175303af)"}
!81 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 67, type: !82, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !84)
!82 = !DISubroutineType(types: !83)
!83 = !{!20}
!84 = !{}
!85 = !DILocalVariable(name: "arsize_input", scope: !81, file: !2, line: 69, type: !86)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!87 = !DILocation(line: 0, scope: !81)
!88 = !DILocalVariable(name: "arsize", scope: !81, file: !2, line: 70, type: !20)
!89 = !DILocalVariable(name: "arsize2d", scope: !81, file: !2, line: 71, type: !12)
!90 = !DILocalVariable(name: "memreq", scope: !81, file: !2, line: 72, type: !13)
!91 = !DILocation(line: 90, column: 9, scope: !81)
!92 = !DILocalVariable(name: "malloc_arg", scope: !81, file: !2, line: 72, type: !13)
!93 = !DILocation(line: 92, column: 44, scope: !94)
!94 = distinct !DILexicalBlock(scope: !81, file: !2, line: 92, column: 13)
!95 = !DILocation(line: 92, column: 43, scope: !94)
!96 = !DILocation(line: 92, column: 63, scope: !94)
!97 = !DILocation(line: 92, column: 13, scope: !81)
!98 = !DILocation(line: 94, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !2, line: 93, column: 13)
!100 = !DILocation(line: 95, column: 13, scope: !99)
!101 = !DILocation(line: 97, column: 9, scope: !81)
!102 = !DILocation(line: 98, column: 9, scope: !81)
!103 = !DILocation(line: 99, column: 9, scope: !81)
!104 = !DILocation(line: 100, column: 9, scope: !81)
!105 = !DILocation(line: 101, column: 9, scope: !81)
!106 = !DILocation(line: 102, column: 9, scope: !81)
!107 = !DILocalVariable(name: "nreps", scope: !81, file: !2, line: 71, type: !12)
!108 = !DILocation(line: 104, column: 9, scope: !81)
!109 = !DILocation(line: 0, scope: !110, inlinedAt: !113)
!110 = distinct !DISubprogram(name: "linpack", scope: !2, file: !2, line: 111, type: !111, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!111 = !DISubroutineType(cc: DW_CC_nocall, types: !112)
!112 = !{!17, !12, !20}
!113 = distinct !DILocation(line: 104, column: 16, scope: !81)
!114 = !DILocalVariable(name: "nreps", arg: 1, scope: !110, file: !2, line: 111, type: !12)
!115 = !DILocalVariable(name: "arsize", arg: 2, scope: !110, file: !2, line: 111, type: !20)
!116 = !DILocalVariable(name: "lda", scope: !110, file: !2, line: 116, type: !20)
!117 = !DILocalVariable(name: "n", scope: !110, file: !2, line: 116, type: !20)
!118 = !DILocalVariable(name: "arsize2d", scope: !110, file: !2, line: 117, type: !12)
!119 = !DILocalVariable(name: "ops", scope: !110, file: !2, line: 115, type: !17)
!120 = !DILocation(line: 123, column: 15, scope: !110, inlinedAt: !113)
!121 = !DILocalVariable(name: "a", scope: !110, file: !2, line: 114, type: !16)
!122 = !DILocation(line: 124, column: 8, scope: !110, inlinedAt: !113)
!123 = !DILocalVariable(name: "b", scope: !110, file: !2, line: 114, type: !16)
!124 = !DILocation(line: 125, column: 18, scope: !110, inlinedAt: !113)
!125 = !DILocalVariable(name: "ipvt", scope: !110, file: !2, line: 116, type: !19)
!126 = !DILocalVariable(name: "tdgesl", scope: !110, file: !2, line: 115, type: !17)
!127 = !DILocalVariable(name: "tdgefa", scope: !110, file: !2, line: 115, type: !17)
!128 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !132)
!129 = distinct !DISubprogram(name: "second", scope: !2, file: !2, line: 871, type: !130, scopeLine: 873, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9)
!130 = !DISubroutineType(types: !131)
!131 = !{!17}
!132 = distinct !DILocation(line: 128, column: 12, scope: !110, inlinedAt: !113)
!133 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !132)
!134 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !132)
!135 = !DILocalVariable(name: "totalt", scope: !110, file: !2, line: 115, type: !17)
!136 = !DILocalVariable(name: "i", scope: !110, file: !2, line: 117, type: !12)
!137 = !DILocation(line: 129, column: 15, scope: !138, inlinedAt: !113)
!138 = distinct !DILexicalBlock(scope: !139, file: !2, line: 129, column: 5)
!139 = distinct !DILexicalBlock(scope: !110, file: !2, line: 129, column: 5)
!140 = !DILocation(line: 129, column: 5, scope: !139, inlinedAt: !113)
!141 = !DILocation(line: 139, column: 15, scope: !142, inlinedAt: !113)
!142 = distinct !DILexicalBlock(scope: !143, file: !2, line: 139, column: 5)
!143 = distinct !DILexicalBlock(scope: !110, file: !2, line: 139, column: 5)
!144 = !DILocation(line: 139, column: 5, scope: !143, inlinedAt: !113)
!145 = !DILocalVariable(name: "norma", scope: !110, file: !2, line: 115, type: !17)
!146 = !DILocalVariable(name: "a", arg: 1, scope: !147, file: !2, line: 173, type: !16)
!147 = distinct !DISubprogram(name: "matgen", scope: !2, file: !2, line: 173, type: !148, scopeLine: 175, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!148 = !DISubroutineType(cc: DW_CC_nocall, types: !149)
!149 = !{null, !16, !20, !20, !16, !16}
!150 = !DILocation(line: 0, scope: !147, inlinedAt: !151)
!151 = distinct !DILocation(line: 131, column: 9, scope: !152, inlinedAt: !113)
!152 = distinct !DILexicalBlock(scope: !138, file: !2, line: 130, column: 9)
!153 = !DILocalVariable(name: "lda", arg: 2, scope: !147, file: !2, line: 173, type: !20)
!154 = !DILocalVariable(name: "n", arg: 3, scope: !147, file: !2, line: 173, type: !20)
!155 = !DILocalVariable(name: "b", arg: 4, scope: !147, file: !2, line: 173, type: !16)
!156 = !DILocalVariable(name: "norma", arg: 5, scope: !147, file: !2, line: 173, type: !16)
!157 = !DILocalVariable(name: "init", scope: !147, file: !2, line: 176, type: !20)
!158 = !DILocation(line: 179, column: 12, scope: !147, inlinedAt: !151)
!159 = !DILocalVariable(name: "j", scope: !147, file: !2, line: 176, type: !20)
!160 = !DILocation(line: 180, column: 5, scope: !161, inlinedAt: !151)
!161 = distinct !DILexicalBlock(scope: !147, file: !2, line: 180, column: 5)
!162 = !DILocalVariable(name: "i", scope: !147, file: !2, line: 176, type: !20)
!163 = !DILocation(line: 181, column: 9, scope: !164, inlinedAt: !151)
!164 = distinct !DILexicalBlock(scope: !165, file: !2, line: 181, column: 9)
!165 = distinct !DILexicalBlock(scope: !161, file: !2, line: 180, column: 5)
!166 = !DILocation(line: 184, column: 32, scope: !167, inlinedAt: !151)
!167 = distinct !DILexicalBlock(scope: !168, file: !2, line: 182, column: 13)
!168 = distinct !DILexicalBlock(scope: !164, file: !2, line: 181, column: 9)
!169 = !DILocation(line: 184, column: 42, scope: !167, inlinedAt: !151)
!170 = !DILocation(line: 184, column: 20, scope: !167, inlinedAt: !151)
!171 = !DILocation(line: 184, column: 13, scope: !167, inlinedAt: !151)
!172 = !DILocation(line: 184, column: 24, scope: !167, inlinedAt: !151)
!173 = !DILocation(line: 185, column: 36, scope: !167, inlinedAt: !151)
!174 = !DILocation(line: 185, column: 34, scope: !167, inlinedAt: !151)
!175 = !DILocation(line: 185, column: 22, scope: !167, inlinedAt: !151)
!176 = !DILocation(line: 185, column: 20, scope: !167, inlinedAt: !151)
!177 = !DILocation(line: 181, column: 29, scope: !168, inlinedAt: !151)
!178 = !DILocation(line: 181, column: 23, scope: !168, inlinedAt: !151)
!179 = distinct !{!179, !163, !180, !181}
!180 = !DILocation(line: 186, column: 13, scope: !164, inlinedAt: !151)
!181 = !{!"llvm.loop.mustprogress"}
!182 = !DILocation(line: 180, column: 25, scope: !165, inlinedAt: !151)
!183 = !DILocation(line: 180, column: 19, scope: !165, inlinedAt: !151)
!184 = distinct !{!184, !160, !185, !181}
!185 = !DILocation(line: 186, column: 13, scope: !161, inlinedAt: !151)
!186 = !DILocation(line: 188, column: 14, scope: !187, inlinedAt: !151)
!187 = distinct !DILexicalBlock(scope: !188, file: !2, line: 187, column: 5)
!188 = distinct !DILexicalBlock(scope: !147, file: !2, line: 187, column: 5)
!189 = !DILocation(line: 189, column: 5, scope: !190, inlinedAt: !151)
!190 = distinct !DILexicalBlock(scope: !147, file: !2, line: 189, column: 5)
!191 = !DILocation(line: 190, column: 9, scope: !192, inlinedAt: !151)
!192 = distinct !DILexicalBlock(scope: !193, file: !2, line: 190, column: 9)
!193 = distinct !DILexicalBlock(scope: !190, file: !2, line: 189, column: 5)
!194 = !DILocation(line: 191, column: 20, scope: !195, inlinedAt: !151)
!195 = distinct !DILexicalBlock(scope: !192, file: !2, line: 190, column: 9)
!196 = !DILocation(line: 191, column: 34, scope: !195, inlinedAt: !151)
!197 = !DILocation(line: 191, column: 27, scope: !195, inlinedAt: !151)
!198 = !DILocation(line: 191, column: 25, scope: !195, inlinedAt: !151)
!199 = !DILocation(line: 191, column: 18, scope: !195, inlinedAt: !151)
!200 = !DILocation(line: 190, column: 29, scope: !195, inlinedAt: !151)
!201 = !DILocation(line: 190, column: 23, scope: !195, inlinedAt: !151)
!202 = distinct !{!202, !191, !203, !181}
!203 = !DILocation(line: 191, column: 36, scope: !192, inlinedAt: !151)
!204 = !DILocation(line: 189, column: 25, scope: !193, inlinedAt: !151)
!205 = !DILocation(line: 189, column: 19, scope: !193, inlinedAt: !151)
!206 = distinct !{!206, !189, !207, !181}
!207 = !DILocation(line: 191, column: 36, scope: !190, inlinedAt: !151)
!208 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !209)
!209 = distinct !DILocation(line: 132, column: 14, scope: !152, inlinedAt: !113)
!210 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !209)
!211 = !DILocalVariable(name: "t1", scope: !110, file: !2, line: 115, type: !17)
!212 = !DILocalVariable(name: "info", scope: !110, file: !2, line: 116, type: !20)
!213 = !DILocalVariable(name: "a", arg: 1, scope: !214, file: !2, line: 246, type: !16)
!214 = distinct !DISubprogram(name: "dgefa", scope: !2, file: !2, line: 246, type: !215, scopeLine: 248, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!215 = !DISubroutineType(cc: DW_CC_nocall, types: !216)
!216 = !{null, !16, !20, !20, !19, !19, !20}
!217 = !DILocation(line: 0, scope: !214, inlinedAt: !218)
!218 = distinct !DILocation(line: 133, column: 9, scope: !152, inlinedAt: !113)
!219 = !DILocalVariable(name: "lda", arg: 2, scope: !214, file: !2, line: 246, type: !20)
!220 = !DILocalVariable(name: "n", arg: 3, scope: !214, file: !2, line: 246, type: !20)
!221 = !DILocalVariable(name: "ipvt", arg: 4, scope: !214, file: !2, line: 246, type: !19)
!222 = !DILocalVariable(name: "info", arg: 5, scope: !214, file: !2, line: 246, type: !19)
!223 = !DILocalVariable(name: "roll", arg: 6, scope: !214, file: !2, line: 246, type: !20)
!224 = !DILocation(line: 0, scope: !225, inlinedAt: !218)
!225 = distinct !DILexicalBlock(scope: !214, file: !2, line: 254, column: 9)
!226 = !DILocalVariable(name: "nm1", scope: !214, file: !2, line: 250, type: !20)
!227 = !DILocalVariable(name: "k", scope: !214, file: !2, line: 250, type: !20)
!228 = !DILocation(line: 261, column: 25, scope: !229, inlinedAt: !218)
!229 = distinct !DILexicalBlock(scope: !230, file: !2, line: 260, column: 17)
!230 = distinct !DILexicalBlock(scope: !231, file: !2, line: 259, column: 13)
!231 = distinct !DILexicalBlock(scope: !232, file: !2, line: 259, column: 13)
!232 = distinct !DILexicalBlock(scope: !233, file: !2, line: 258, column: 13)
!233 = distinct !DILexicalBlock(scope: !225, file: !2, line: 255, column: 9)
!234 = !DILocalVariable(name: "kp1", scope: !214, file: !2, line: 250, type: !20)
!235 = !DILocation(line: 265, column: 38, scope: !229, inlinedAt: !218)
!236 = !DILocation(line: 265, column: 40, scope: !229, inlinedAt: !218)
!237 = !DILocation(line: 265, column: 33, scope: !229, inlinedAt: !218)
!238 = !DILocation(line: 265, column: 21, scope: !229, inlinedAt: !218)
!239 = !DILocalVariable(name: "n", arg: 1, scope: !240, file: !2, line: 825, type: !20)
!240 = distinct !DISubprogram(name: "idamax", scope: !2, file: !2, line: 825, type: !241, scopeLine: 827, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!241 = !DISubroutineType(cc: DW_CC_nocall, types: !242)
!242 = !{!20, !20, !16, !20}
!243 = !DILocation(line: 0, scope: !240, inlinedAt: !244)
!244 = distinct !DILocation(line: 265, column: 21, scope: !229, inlinedAt: !218)
!245 = !DILocalVariable(name: "dx", arg: 2, scope: !240, file: !2, line: 825, type: !16)
!246 = !DILocalVariable(name: "incx", arg: 3, scope: !240, file: !2, line: 825, type: !20)
!247 = !DILocation(line: 831, column: 11, scope: !248, inlinedAt: !244)
!248 = distinct !DILexicalBlock(scope: !240, file: !2, line: 831, column: 9)
!249 = !DILocation(line: 831, column: 9, scope: !240, inlinedAt: !244)
!250 = !DILocalVariable(name: "itemp", scope: !240, file: !2, line: 829, type: !20)
!251 = !DILocalVariable(name: "dmax", scope: !240, file: !2, line: 828, type: !17)
!252 = !DILocalVariable(name: "i", scope: !240, file: !2, line: 829, type: !20)
!253 = !DILocation(line: 860, column: 23, scope: !254, inlinedAt: !244)
!254 = distinct !DILexicalBlock(scope: !255, file: !2, line: 860, column: 9)
!255 = distinct !DILexicalBlock(scope: !256, file: !2, line: 860, column: 9)
!256 = distinct !DILexicalBlock(scope: !257, file: !2, line: 854, column: 9)
!257 = distinct !DILexicalBlock(scope: !240, file: !2, line: 835, column: 8)
!258 = !DILocation(line: 860, column: 9, scope: !255, inlinedAt: !244)
!259 = !DILocation(line: 859, column: 29, scope: !256, inlinedAt: !244)
!260 = !DILocation(line: 859, column: 16, scope: !256, inlinedAt: !244)
!261 = !DILocation(line: 861, column: 29, scope: !262, inlinedAt: !244)
!262 = distinct !DILexicalBlock(scope: !254, file: !2, line: 861, column: 16)
!263 = !DILocation(line: 861, column: 16, scope: !262, inlinedAt: !244)
!264 = !DILocation(line: 861, column: 36, scope: !262, inlinedAt: !244)
!265 = !DILocation(line: 861, column: 16, scope: !254, inlinedAt: !244)
!266 = !DILocation(line: 860, column: 29, scope: !254, inlinedAt: !244)
!267 = distinct !{!267, !258, !268, !181}
!268 = !DILocation(line: 865, column: 17, scope: !255, inlinedAt: !244)
!269 = !DILocation(line: 868, column: 5, scope: !240, inlinedAt: !244)
!270 = !DILocation(line: 265, column: 47, scope: !229, inlinedAt: !218)
!271 = !DILocalVariable(name: "l", scope: !214, file: !2, line: 250, type: !20)
!272 = !DILocation(line: 266, column: 17, scope: !229, inlinedAt: !218)
!273 = !DILocation(line: 266, column: 25, scope: !229, inlinedAt: !218)
!274 = !DILocation(line: 271, column: 28, scope: !275, inlinedAt: !218)
!275 = distinct !DILexicalBlock(scope: !229, file: !2, line: 271, column: 21)
!276 = !DILocation(line: 271, column: 21, scope: !275, inlinedAt: !218)
!277 = !DILocation(line: 271, column: 32, scope: !275, inlinedAt: !218)
!278 = !DILocation(line: 271, column: 21, scope: !229, inlinedAt: !218)
!279 = !DILocation(line: 276, column: 27, scope: !280, inlinedAt: !218)
!280 = distinct !DILexicalBlock(scope: !281, file: !2, line: 276, column: 25)
!281 = distinct !DILexicalBlock(scope: !275, file: !2, line: 272, column: 21)
!282 = !DILocation(line: 276, column: 25, scope: !281, inlinedAt: !218)
!283 = !DILocalVariable(name: "t", scope: !214, file: !2, line: 249, type: !17)
!284 = !DILocation(line: 279, column: 38, scope: !285, inlinedAt: !218)
!285 = distinct !DILexicalBlock(scope: !280, file: !2, line: 277, column: 25)
!286 = !DILocation(line: 279, column: 36, scope: !285, inlinedAt: !218)
!287 = !DILocation(line: 280, column: 36, scope: !285, inlinedAt: !218)
!288 = !DILocation(line: 281, column: 25, scope: !285, inlinedAt: !218)
!289 = !DILocation(line: 285, column: 30, scope: !281, inlinedAt: !218)
!290 = !DILocation(line: 285, column: 29, scope: !281, inlinedAt: !218)
!291 = !DILocation(line: 286, column: 30, scope: !281, inlinedAt: !218)
!292 = !DILocation(line: 286, column: 49, scope: !281, inlinedAt: !218)
!293 = !DILocation(line: 286, column: 40, scope: !281, inlinedAt: !218)
!294 = !DILocation(line: 286, column: 21, scope: !281, inlinedAt: !218)
!295 = !DILocalVariable(name: "n", arg: 1, scope: !296, file: !2, line: 645, type: !20)
!296 = distinct !DISubprogram(name: "dscal_r", scope: !2, file: !2, line: 645, type: !297, scopeLine: 647, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!297 = !DISubroutineType(cc: DW_CC_nocall, types: !298)
!298 = !{null, !20, !17, !16, !20}
!299 = !DILocation(line: 0, scope: !296, inlinedAt: !300)
!300 = distinct !DILocation(line: 286, column: 21, scope: !281, inlinedAt: !218)
!301 = !DILocalVariable(name: "da", arg: 2, scope: !296, file: !2, line: 645, type: !17)
!302 = !DILocalVariable(name: "dx", arg: 3, scope: !296, file: !2, line: 645, type: !16)
!303 = !DILocalVariable(name: "incx", arg: 4, scope: !296, file: !2, line: 645, type: !20)
!304 = !DILocation(line: 650, column: 11, scope: !305, inlinedAt: !300)
!305 = distinct !DILexicalBlock(scope: !296, file: !2, line: 650, column: 9)
!306 = !DILocation(line: 650, column: 9, scope: !296, inlinedAt: !300)
!307 = !DILocation(line: 665, column: 19, scope: !308, inlinedAt: !300)
!308 = distinct !DILexicalBlock(scope: !309, file: !2, line: 665, column: 5)
!309 = distinct !DILexicalBlock(scope: !296, file: !2, line: 665, column: 5)
!310 = !DILocation(line: 665, column: 5, scope: !309, inlinedAt: !300)
!311 = !DILocalVariable(name: "i", scope: !296, file: !2, line: 648, type: !20)
!312 = !DILocation(line: 666, column: 20, scope: !308, inlinedAt: !300)
!313 = !DILocation(line: 666, column: 19, scope: !308, inlinedAt: !300)
!314 = !DILocation(line: 666, column: 15, scope: !308, inlinedAt: !300)
!315 = !DILocation(line: 665, column: 25, scope: !308, inlinedAt: !300)
!316 = distinct !{!316, !310, !317, !181}
!317 = !DILocation(line: 666, column: 24, scope: !309, inlinedAt: !300)
!318 = distinct !{!318, !319}
!319 = !{!"llvm.loop.unroll.disable"}
!320 = !DILocalVariable(name: "j", scope: !214, file: !2, line: 250, type: !20)
!321 = !DILocation(line: 290, column: 21, scope: !322, inlinedAt: !218)
!322 = distinct !DILexicalBlock(scope: !281, file: !2, line: 290, column: 21)
!323 = !DILocation(line: 292, column: 34, scope: !324, inlinedAt: !218)
!324 = distinct !DILexicalBlock(scope: !325, file: !2, line: 291, column: 25)
!325 = distinct !DILexicalBlock(scope: !322, file: !2, line: 290, column: 21)
!326 = !DILocation(line: 292, column: 36, scope: !324, inlinedAt: !218)
!327 = !DILocation(line: 292, column: 29, scope: !324, inlinedAt: !218)
!328 = !DILocation(line: 293, column: 29, scope: !324, inlinedAt: !218)
!329 = !DILocation(line: 295, column: 49, scope: !330, inlinedAt: !218)
!330 = distinct !DILexicalBlock(scope: !331, file: !2, line: 294, column: 29)
!331 = distinct !DILexicalBlock(scope: !324, file: !2, line: 293, column: 29)
!332 = !DILocation(line: 295, column: 42, scope: !330, inlinedAt: !218)
!333 = !DILocation(line: 295, column: 40, scope: !330, inlinedAt: !218)
!334 = !DILocation(line: 296, column: 40, scope: !330, inlinedAt: !218)
!335 = !DILocation(line: 297, column: 29, scope: !330, inlinedAt: !218)
!336 = !DILocation(line: 298, column: 69, scope: !324, inlinedAt: !218)
!337 = !DILocation(line: 298, column: 60, scope: !324, inlinedAt: !218)
!338 = !DILocalVariable(name: "n", arg: 1, scope: !339, file: !2, line: 563, type: !20)
!339 = distinct !DISubprogram(name: "daxpy_r", scope: !2, file: !2, line: 563, type: !340, scopeLine: 565, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!340 = !DISubroutineType(cc: DW_CC_nocall, types: !341)
!341 = !{null, !20, !17, !16, !20, !16, !20}
!342 = !DILocation(line: 0, scope: !339, inlinedAt: !343)
!343 = distinct !DILocation(line: 298, column: 25, scope: !324, inlinedAt: !218)
!344 = !DILocalVariable(name: "da", arg: 2, scope: !339, file: !2, line: 563, type: !17)
!345 = !DILocalVariable(name: "dx", arg: 3, scope: !339, file: !2, line: 563, type: !16)
!346 = !DILocalVariable(name: "incx", arg: 4, scope: !339, file: !2, line: 563, type: !20)
!347 = !DILocalVariable(name: "dy", arg: 5, scope: !339, file: !2, line: 563, type: !16)
!348 = !DILocalVariable(name: "incy", arg: 6, scope: !339, file: !2, line: 563, type: !20)
!349 = !DILocation(line: 568, column: 11, scope: !350, inlinedAt: !343)
!350 = distinct !DILexicalBlock(scope: !339, file: !2, line: 568, column: 9)
!351 = !DILocation(line: 568, column: 9, scope: !339, inlinedAt: !343)
!352 = !DILocation(line: 593, column: 18, scope: !353, inlinedAt: !343)
!353 = distinct !DILexicalBlock(scope: !354, file: !2, line: 593, column: 5)
!354 = distinct !DILexicalBlock(scope: !339, file: !2, line: 593, column: 5)
!355 = !DILocation(line: 593, column: 5, scope: !354, inlinedAt: !343)
!356 = !DILocalVariable(name: "i", scope: !339, file: !2, line: 566, type: !20)
!357 = !DILocation(line: 594, column: 17, scope: !353, inlinedAt: !343)
!358 = !DILocation(line: 594, column: 28, scope: !353, inlinedAt: !343)
!359 = !DILocation(line: 594, column: 23, scope: !353, inlinedAt: !343)
!360 = !DILocation(line: 594, column: 15, scope: !353, inlinedAt: !343)
!361 = !DILocation(line: 593, column: 24, scope: !353, inlinedAt: !343)
!362 = distinct !{!362, !355, !363, !181}
!363 = !DILocation(line: 594, column: 32, scope: !354, inlinedAt: !343)
!364 = !DILocation(line: 595, column: 5, scope: !339, inlinedAt: !343)
!365 = !DILocation(line: 290, column: 43, scope: !325, inlinedAt: !218)
!366 = !DILocation(line: 290, column: 37, scope: !325, inlinedAt: !218)
!367 = distinct !{!367, !321, !368, !181}
!368 = !DILocation(line: 299, column: 25, scope: !322, inlinedAt: !218)
!369 = !DILocation(line: 302, column: 29, scope: !275, inlinedAt: !218)
!370 = !DILocation(line: 259, column: 13, scope: !231, inlinedAt: !218)
!371 = !DILocation(line: 259, column: 27, scope: !230, inlinedAt: !218)
!372 = distinct !{!372, !370, !373, !181}
!373 = !DILocation(line: 303, column: 17, scope: !231, inlinedAt: !218)
!374 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !209)
!375 = !DILocation(line: 304, column: 9, scope: !233, inlinedAt: !218)
!376 = !DILocation(line: 304, column: 19, scope: !233, inlinedAt: !218)
!377 = !DILocation(line: 305, column: 13, scope: !378, inlinedAt: !218)
!378 = distinct !DILexicalBlock(scope: !233, file: !2, line: 305, column: 13)
!379 = !DILocation(line: 305, column: 32, scope: !378, inlinedAt: !218)
!380 = !DILocation(line: 305, column: 13, scope: !233, inlinedAt: !218)
!381 = !DILocation(line: 362, column: 5, scope: !214, inlinedAt: !218)
!382 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !383)
!383 = distinct !DILocation(line: 134, column: 19, scope: !152, inlinedAt: !113)
!384 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !383)
!385 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !383)
!386 = !DILocation(line: 134, column: 27, scope: !152, inlinedAt: !113)
!387 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !388)
!388 = distinct !DILocation(line: 135, column: 14, scope: !152, inlinedAt: !113)
!389 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !388)
!390 = !DILocalVariable(name: "a", arg: 1, scope: !391, file: !2, line: 426, type: !16)
!391 = distinct !DISubprogram(name: "dgesl", scope: !2, file: !2, line: 426, type: !392, scopeLine: 428, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!392 = !DISubroutineType(cc: DW_CC_nocall, types: !393)
!393 = !{null, !16, !20, !20, !19, !16, !20, !20}
!394 = !DILocation(line: 0, scope: !391, inlinedAt: !395)
!395 = distinct !DILocation(line: 136, column: 9, scope: !152, inlinedAt: !113)
!396 = !DILocalVariable(name: "lda", arg: 2, scope: !391, file: !2, line: 426, type: !20)
!397 = !DILocalVariable(name: "n", arg: 3, scope: !391, file: !2, line: 426, type: !20)
!398 = !DILocalVariable(name: "ipvt", arg: 4, scope: !391, file: !2, line: 426, type: !19)
!399 = !DILocalVariable(name: "b", arg: 5, scope: !391, file: !2, line: 426, type: !16)
!400 = !DILocalVariable(name: "job", arg: 6, scope: !391, file: !2, line: 426, type: !20)
!401 = !DILocalVariable(name: "roll", arg: 7, scope: !391, file: !2, line: 426, type: !20)
!402 = !DILocalVariable(name: "k", scope: !391, file: !2, line: 430, type: !20)
!403 = !DILocation(line: 444, column: 25, scope: !404, inlinedAt: !395)
!404 = distinct !DILexicalBlock(scope: !405, file: !2, line: 443, column: 21)
!405 = distinct !DILexicalBlock(scope: !406, file: !2, line: 442, column: 17)
!406 = distinct !DILexicalBlock(scope: !407, file: !2, line: 442, column: 17)
!407 = distinct !DILexicalBlock(scope: !408, file: !2, line: 441, column: 17)
!408 = distinct !DILexicalBlock(scope: !409, file: !2, line: 436, column: 13)
!409 = distinct !DILexicalBlock(scope: !410, file: !2, line: 435, column: 13)
!410 = distinct !DILexicalBlock(scope: !411, file: !2, line: 433, column: 9)
!411 = distinct !DILexicalBlock(scope: !391, file: !2, line: 432, column: 9)
!412 = !DILocalVariable(name: "l", scope: !391, file: !2, line: 430, type: !20)
!413 = !DILocation(line: 445, column: 25, scope: !404, inlinedAt: !395)
!414 = !DILocalVariable(name: "t", scope: !391, file: !2, line: 429, type: !17)
!415 = !DILocation(line: 446, column: 27, scope: !416, inlinedAt: !395)
!416 = distinct !DILexicalBlock(scope: !404, file: !2, line: 446, column: 25)
!417 = !DILocation(line: 446, column: 25, scope: !404, inlinedAt: !395)
!418 = !DILocation(line: 448, column: 32, scope: !419, inlinedAt: !395)
!419 = distinct !DILexicalBlock(scope: !416, file: !2, line: 447, column: 25)
!420 = !DILocation(line: 448, column: 30, scope: !419, inlinedAt: !395)
!421 = !DILocation(line: 449, column: 30, scope: !419, inlinedAt: !395)
!422 = !DILocation(line: 450, column: 25, scope: !419, inlinedAt: !395)
!423 = !DILocation(line: 451, column: 33, scope: !404, inlinedAt: !395)
!424 = !DILocation(line: 451, column: 47, scope: !404, inlinedAt: !395)
!425 = !DILocation(line: 451, column: 49, scope: !404, inlinedAt: !395)
!426 = !DILocation(line: 451, column: 40, scope: !404, inlinedAt: !395)
!427 = !DILocation(line: 451, column: 56, scope: !404, inlinedAt: !395)
!428 = !DILocation(line: 451, column: 21, scope: !404, inlinedAt: !395)
!429 = !DILocation(line: 0, scope: !339, inlinedAt: !430)
!430 = distinct !DILocation(line: 451, column: 21, scope: !404, inlinedAt: !395)
!431 = !DILocation(line: 568, column: 11, scope: !350, inlinedAt: !430)
!432 = !DILocation(line: 568, column: 9, scope: !339, inlinedAt: !430)
!433 = !DILocation(line: 593, column: 18, scope: !353, inlinedAt: !430)
!434 = !DILocation(line: 593, column: 5, scope: !354, inlinedAt: !430)
!435 = !DILocation(line: 594, column: 17, scope: !353, inlinedAt: !430)
!436 = !DILocation(line: 594, column: 28, scope: !353, inlinedAt: !430)
!437 = !DILocation(line: 594, column: 23, scope: !353, inlinedAt: !430)
!438 = !DILocation(line: 594, column: 15, scope: !353, inlinedAt: !430)
!439 = !DILocation(line: 593, column: 24, scope: !353, inlinedAt: !430)
!440 = distinct !{!440, !434, !441, !181}
!441 = !DILocation(line: 594, column: 32, scope: !354, inlinedAt: !430)
!442 = !DILocation(line: 595, column: 5, scope: !339, inlinedAt: !430)
!443 = !DILocation(line: 442, column: 31, scope: !405, inlinedAt: !395)
!444 = !DILocation(line: 442, column: 17, scope: !406, inlinedAt: !395)
!445 = distinct !{!445, !444, !446, !181}
!446 = !DILocation(line: 452, column: 21, scope: !406, inlinedAt: !395)
!447 = !DILocation(line: 134, column: 16, scope: !152, inlinedAt: !113)
!448 = !DILocation(line: 456, column: 13, scope: !449, inlinedAt: !395)
!449 = distinct !DILexicalBlock(scope: !408, file: !2, line: 456, column: 13)
!450 = !DILocalVariable(name: "kb", scope: !391, file: !2, line: 430, type: !20)
!451 = !DILocation(line: 458, column: 29, scope: !452, inlinedAt: !395)
!452 = distinct !DILexicalBlock(scope: !453, file: !2, line: 457, column: 17)
!453 = distinct !DILexicalBlock(scope: !449, file: !2, line: 456, column: 13)
!454 = !DILocation(line: 458, column: 23, scope: !452, inlinedAt: !395)
!455 = !DILocation(line: 459, column: 24, scope: !452, inlinedAt: !395)
!456 = !DILocation(line: 459, column: 34, scope: !452, inlinedAt: !395)
!457 = !DILocation(line: 459, column: 36, scope: !452, inlinedAt: !395)
!458 = !DILocation(line: 459, column: 29, scope: !452, inlinedAt: !395)
!459 = !DILocation(line: 459, column: 28, scope: !452, inlinedAt: !395)
!460 = !DILocation(line: 459, column: 22, scope: !452, inlinedAt: !395)
!461 = !DILocation(line: 460, column: 21, scope: !452, inlinedAt: !395)
!462 = !DILocation(line: 461, column: 30, scope: !452, inlinedAt: !395)
!463 = !DILocation(line: 461, column: 17, scope: !452, inlinedAt: !395)
!464 = !DILocation(line: 0, scope: !339, inlinedAt: !465)
!465 = distinct !DILocation(line: 461, column: 17, scope: !452, inlinedAt: !395)
!466 = !DILocation(line: 568, column: 11, scope: !350, inlinedAt: !465)
!467 = !DILocation(line: 568, column: 9, scope: !339, inlinedAt: !465)
!468 = !DILocation(line: 593, column: 18, scope: !353, inlinedAt: !465)
!469 = !DILocation(line: 593, column: 5, scope: !354, inlinedAt: !465)
!470 = !DILocation(line: 594, column: 17, scope: !353, inlinedAt: !465)
!471 = !DILocation(line: 594, column: 28, scope: !353, inlinedAt: !465)
!472 = !DILocation(line: 594, column: 23, scope: !353, inlinedAt: !465)
!473 = !DILocation(line: 594, column: 15, scope: !353, inlinedAt: !465)
!474 = !DILocation(line: 593, column: 24, scope: !353, inlinedAt: !465)
!475 = distinct !{!475, !469, !476, !181}
!476 = !DILocation(line: 594, column: 32, scope: !354, inlinedAt: !465)
!477 = !DILocation(line: 595, column: 5, scope: !339, inlinedAt: !465)
!478 = !DILocation(line: 456, column: 29, scope: !453, inlinedAt: !395)
!479 = distinct !{!479, !448, !480, !181}
!480 = !DILocation(line: 462, column: 17, scope: !449, inlinedAt: !395)
!481 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !388)
!482 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !483)
!483 = distinct !DILocation(line: 137, column: 19, scope: !152, inlinedAt: !113)
!484 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !483)
!485 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !483)
!486 = !DILocation(line: 137, column: 27, scope: !152, inlinedAt: !113)
!487 = !DILocation(line: 137, column: 16, scope: !152, inlinedAt: !113)
!488 = !DILocation(line: 129, column: 23, scope: !138, inlinedAt: !113)
!489 = distinct !{!489, !140, !490, !181}
!490 = !DILocation(line: 138, column: 9, scope: !139, inlinedAt: !113)
!491 = !DILocation(line: 0, scope: !147, inlinedAt: !492)
!492 = distinct !DILocation(line: 141, column: 9, scope: !493, inlinedAt: !113)
!493 = distinct !DILexicalBlock(scope: !142, file: !2, line: 140, column: 9)
!494 = !DILocation(line: 179, column: 12, scope: !147, inlinedAt: !492)
!495 = !DILocation(line: 180, column: 5, scope: !161, inlinedAt: !492)
!496 = !DILocation(line: 181, column: 9, scope: !164, inlinedAt: !492)
!497 = !DILocation(line: 184, column: 32, scope: !167, inlinedAt: !492)
!498 = !DILocation(line: 184, column: 42, scope: !167, inlinedAt: !492)
!499 = !DILocation(line: 184, column: 20, scope: !167, inlinedAt: !492)
!500 = !DILocation(line: 184, column: 13, scope: !167, inlinedAt: !492)
!501 = !DILocation(line: 184, column: 24, scope: !167, inlinedAt: !492)
!502 = !DILocation(line: 185, column: 36, scope: !167, inlinedAt: !492)
!503 = !DILocation(line: 185, column: 34, scope: !167, inlinedAt: !492)
!504 = !DILocation(line: 185, column: 22, scope: !167, inlinedAt: !492)
!505 = !DILocation(line: 185, column: 20, scope: !167, inlinedAt: !492)
!506 = !DILocation(line: 181, column: 29, scope: !168, inlinedAt: !492)
!507 = !DILocation(line: 181, column: 23, scope: !168, inlinedAt: !492)
!508 = distinct !{!508, !496, !509, !181}
!509 = !DILocation(line: 186, column: 13, scope: !164, inlinedAt: !492)
!510 = !DILocation(line: 180, column: 25, scope: !165, inlinedAt: !492)
!511 = !DILocation(line: 180, column: 19, scope: !165, inlinedAt: !492)
!512 = distinct !{!512, !495, !513, !181}
!513 = !DILocation(line: 186, column: 13, scope: !161, inlinedAt: !492)
!514 = !DILocation(line: 188, column: 14, scope: !187, inlinedAt: !492)
!515 = !DILocation(line: 189, column: 5, scope: !190, inlinedAt: !492)
!516 = !DILocation(line: 190, column: 9, scope: !192, inlinedAt: !492)
!517 = !DILocation(line: 191, column: 20, scope: !195, inlinedAt: !492)
!518 = !DILocation(line: 191, column: 34, scope: !195, inlinedAt: !492)
!519 = !DILocation(line: 191, column: 27, scope: !195, inlinedAt: !492)
!520 = !DILocation(line: 191, column: 25, scope: !195, inlinedAt: !492)
!521 = !DILocation(line: 191, column: 18, scope: !195, inlinedAt: !492)
!522 = !DILocation(line: 190, column: 29, scope: !195, inlinedAt: !492)
!523 = !DILocation(line: 190, column: 23, scope: !195, inlinedAt: !492)
!524 = distinct !{!524, !516, !525, !181}
!525 = !DILocation(line: 191, column: 36, scope: !192, inlinedAt: !492)
!526 = !DILocation(line: 189, column: 25, scope: !193, inlinedAt: !492)
!527 = !DILocation(line: 189, column: 19, scope: !193, inlinedAt: !492)
!528 = distinct !{!528, !515, !529, !181}
!529 = !DILocation(line: 191, column: 36, scope: !190, inlinedAt: !492)
!530 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !531)
!531 = distinct !DILocation(line: 142, column: 14, scope: !493, inlinedAt: !113)
!532 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !531)
!533 = !DILocation(line: 0, scope: !214, inlinedAt: !534)
!534 = distinct !DILocation(line: 143, column: 9, scope: !493, inlinedAt: !113)
!535 = !DILocation(line: 0, scope: !225, inlinedAt: !534)
!536 = !DILocation(line: 315, column: 25, scope: !537, inlinedAt: !534)
!537 = distinct !DILexicalBlock(scope: !538, file: !2, line: 314, column: 17)
!538 = distinct !DILexicalBlock(scope: !539, file: !2, line: 313, column: 13)
!539 = distinct !DILexicalBlock(scope: !540, file: !2, line: 313, column: 13)
!540 = distinct !DILexicalBlock(scope: !541, file: !2, line: 312, column: 13)
!541 = distinct !DILexicalBlock(scope: !225, file: !2, line: 309, column: 9)
!542 = !DILocation(line: 319, column: 38, scope: !537, inlinedAt: !534)
!543 = !DILocation(line: 319, column: 40, scope: !537, inlinedAt: !534)
!544 = !DILocation(line: 319, column: 33, scope: !537, inlinedAt: !534)
!545 = !DILocation(line: 319, column: 21, scope: !537, inlinedAt: !534)
!546 = !DILocation(line: 0, scope: !240, inlinedAt: !547)
!547 = distinct !DILocation(line: 319, column: 21, scope: !537, inlinedAt: !534)
!548 = !DILocation(line: 831, column: 11, scope: !248, inlinedAt: !547)
!549 = !DILocation(line: 831, column: 9, scope: !240, inlinedAt: !547)
!550 = !DILocation(line: 860, column: 23, scope: !254, inlinedAt: !547)
!551 = !DILocation(line: 860, column: 9, scope: !255, inlinedAt: !547)
!552 = !DILocation(line: 859, column: 29, scope: !256, inlinedAt: !547)
!553 = !DILocation(line: 859, column: 16, scope: !256, inlinedAt: !547)
!554 = !DILocation(line: 861, column: 29, scope: !262, inlinedAt: !547)
!555 = !DILocation(line: 861, column: 16, scope: !262, inlinedAt: !547)
!556 = !DILocation(line: 861, column: 36, scope: !262, inlinedAt: !547)
!557 = !DILocation(line: 861, column: 16, scope: !254, inlinedAt: !547)
!558 = !DILocation(line: 860, column: 29, scope: !254, inlinedAt: !547)
!559 = distinct !{!559, !551, !560, !181}
!560 = !DILocation(line: 865, column: 17, scope: !255, inlinedAt: !547)
!561 = !DILocation(line: 868, column: 5, scope: !240, inlinedAt: !547)
!562 = !DILocation(line: 319, column: 47, scope: !537, inlinedAt: !534)
!563 = !DILocation(line: 320, column: 17, scope: !537, inlinedAt: !534)
!564 = !DILocation(line: 320, column: 25, scope: !537, inlinedAt: !534)
!565 = !DILocation(line: 325, column: 28, scope: !566, inlinedAt: !534)
!566 = distinct !DILexicalBlock(scope: !537, file: !2, line: 325, column: 21)
!567 = !DILocation(line: 325, column: 21, scope: !566, inlinedAt: !534)
!568 = !DILocation(line: 325, column: 32, scope: !566, inlinedAt: !534)
!569 = !DILocation(line: 325, column: 21, scope: !537, inlinedAt: !534)
!570 = !DILocation(line: 330, column: 27, scope: !571, inlinedAt: !534)
!571 = distinct !DILexicalBlock(scope: !572, file: !2, line: 330, column: 25)
!572 = distinct !DILexicalBlock(scope: !566, file: !2, line: 326, column: 21)
!573 = !DILocation(line: 330, column: 25, scope: !572, inlinedAt: !534)
!574 = !DILocation(line: 333, column: 38, scope: !575, inlinedAt: !534)
!575 = distinct !DILexicalBlock(scope: !571, file: !2, line: 331, column: 25)
!576 = !DILocation(line: 333, column: 36, scope: !575, inlinedAt: !534)
!577 = !DILocation(line: 334, column: 36, scope: !575, inlinedAt: !534)
!578 = !DILocation(line: 335, column: 25, scope: !575, inlinedAt: !534)
!579 = !DILocation(line: 339, column: 30, scope: !572, inlinedAt: !534)
!580 = !DILocation(line: 339, column: 29, scope: !572, inlinedAt: !534)
!581 = !DILocation(line: 340, column: 31, scope: !572, inlinedAt: !534)
!582 = !DILocation(line: 340, column: 50, scope: !572, inlinedAt: !534)
!583 = !DILocation(line: 340, column: 41, scope: !572, inlinedAt: !534)
!584 = !DILocation(line: 340, column: 21, scope: !572, inlinedAt: !534)
!585 = !DILocalVariable(name: "n", arg: 1, scope: !586, file: !2, line: 782, type: !20)
!586 = distinct !DISubprogram(name: "dscal_ur", scope: !2, file: !2, line: 782, type: !297, scopeLine: 784, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!587 = !DILocation(line: 0, scope: !586, inlinedAt: !588)
!588 = distinct !DILocation(line: 340, column: 21, scope: !572, inlinedAt: !534)
!589 = !DILocalVariable(name: "da", arg: 2, scope: !586, file: !2, line: 782, type: !17)
!590 = !DILocalVariable(name: "dx", arg: 3, scope: !586, file: !2, line: 782, type: !16)
!591 = !DILocalVariable(name: "incx", arg: 4, scope: !586, file: !2, line: 782, type: !20)
!592 = !DILocation(line: 787, column: 11, scope: !593, inlinedAt: !588)
!593 = distinct !DILexicalBlock(scope: !586, file: !2, line: 787, column: 9)
!594 = !DILocation(line: 787, column: 9, scope: !586, inlinedAt: !588)
!595 = !DILocalVariable(name: "m", scope: !586, file: !2, line: 785, type: !20)
!596 = !DILocation(line: 803, column: 11, scope: !597, inlinedAt: !588)
!597 = distinct !DILexicalBlock(scope: !586, file: !2, line: 803, column: 9)
!598 = !DILocation(line: 803, column: 9, scope: !586, inlinedAt: !588)
!599 = !DILocation(line: 805, column: 23, scope: !600, inlinedAt: !588)
!600 = distinct !DILexicalBlock(scope: !601, file: !2, line: 805, column: 9)
!601 = distinct !DILexicalBlock(scope: !602, file: !2, line: 805, column: 9)
!602 = distinct !DILexicalBlock(scope: !597, file: !2, line: 804, column: 9)
!603 = !DILocation(line: 805, column: 9, scope: !601, inlinedAt: !588)
!604 = !DILocalVariable(name: "i", scope: !586, file: !2, line: 785, type: !20)
!605 = !DILocation(line: 806, column: 24, scope: !600, inlinedAt: !588)
!606 = !DILocation(line: 806, column: 23, scope: !600, inlinedAt: !588)
!607 = !DILocation(line: 806, column: 19, scope: !600, inlinedAt: !588)
!608 = !DILocation(line: 805, column: 29, scope: !600, inlinedAt: !588)
!609 = distinct !{!609, !603, !610, !181}
!610 = !DILocation(line: 806, column: 28, scope: !601, inlinedAt: !588)
!611 = distinct !{!611, !319}
!612 = !DILocation(line: 807, column: 15, scope: !613, inlinedAt: !588)
!613 = distinct !DILexicalBlock(scope: !602, file: !2, line: 807, column: 13)
!614 = !DILocation(line: 807, column: 13, scope: !602, inlinedAt: !588)
!615 = !DILocation(line: 810, column: 19, scope: !616, inlinedAt: !588)
!616 = distinct !DILexicalBlock(scope: !617, file: !2, line: 810, column: 5)
!617 = distinct !DILexicalBlock(scope: !586, file: !2, line: 810, column: 5)
!618 = !DILocation(line: 810, column: 5, scope: !617, inlinedAt: !588)
!619 = !DILocation(line: 812, column: 20, scope: !620, inlinedAt: !588)
!620 = distinct !DILexicalBlock(scope: !616, file: !2, line: 811, column: 9)
!621 = !DILocation(line: 812, column: 19, scope: !620, inlinedAt: !588)
!622 = !DILocation(line: 812, column: 15, scope: !620, inlinedAt: !588)
!623 = !DILocation(line: 813, column: 26, scope: !620, inlinedAt: !588)
!624 = !DILocation(line: 813, column: 22, scope: !620, inlinedAt: !588)
!625 = !DILocation(line: 813, column: 21, scope: !620, inlinedAt: !588)
!626 = !DILocation(line: 813, column: 17, scope: !620, inlinedAt: !588)
!627 = !DILocation(line: 814, column: 26, scope: !620, inlinedAt: !588)
!628 = !DILocation(line: 814, column: 22, scope: !620, inlinedAt: !588)
!629 = !DILocation(line: 814, column: 21, scope: !620, inlinedAt: !588)
!630 = !DILocation(line: 814, column: 17, scope: !620, inlinedAt: !588)
!631 = !DILocation(line: 815, column: 26, scope: !620, inlinedAt: !588)
!632 = !DILocation(line: 815, column: 22, scope: !620, inlinedAt: !588)
!633 = !DILocation(line: 815, column: 21, scope: !620, inlinedAt: !588)
!634 = !DILocation(line: 815, column: 17, scope: !620, inlinedAt: !588)
!635 = !DILocation(line: 816, column: 26, scope: !620, inlinedAt: !588)
!636 = !DILocation(line: 816, column: 22, scope: !620, inlinedAt: !588)
!637 = !DILocation(line: 816, column: 21, scope: !620, inlinedAt: !588)
!638 = !DILocation(line: 816, column: 17, scope: !620, inlinedAt: !588)
!639 = !DILocation(line: 810, column: 30, scope: !616, inlinedAt: !588)
!640 = distinct !{!640, !618, !641, !181}
!641 = !DILocation(line: 817, column: 9, scope: !617, inlinedAt: !588)
!642 = !DILocation(line: 344, column: 21, scope: !643, inlinedAt: !534)
!643 = distinct !DILexicalBlock(scope: !572, file: !2, line: 344, column: 21)
!644 = !DILocation(line: 346, column: 34, scope: !645, inlinedAt: !534)
!645 = distinct !DILexicalBlock(scope: !646, file: !2, line: 345, column: 25)
!646 = distinct !DILexicalBlock(scope: !643, file: !2, line: 344, column: 21)
!647 = !DILocation(line: 346, column: 36, scope: !645, inlinedAt: !534)
!648 = !DILocation(line: 346, column: 29, scope: !645, inlinedAt: !534)
!649 = !DILocation(line: 347, column: 29, scope: !645, inlinedAt: !534)
!650 = !DILocation(line: 349, column: 49, scope: !651, inlinedAt: !534)
!651 = distinct !DILexicalBlock(scope: !652, file: !2, line: 348, column: 29)
!652 = distinct !DILexicalBlock(scope: !645, file: !2, line: 347, column: 29)
!653 = !DILocation(line: 349, column: 42, scope: !651, inlinedAt: !534)
!654 = !DILocation(line: 349, column: 40, scope: !651, inlinedAt: !534)
!655 = !DILocation(line: 350, column: 40, scope: !651, inlinedAt: !534)
!656 = !DILocation(line: 351, column: 29, scope: !651, inlinedAt: !534)
!657 = !DILocation(line: 352, column: 70, scope: !645, inlinedAt: !534)
!658 = !DILocation(line: 352, column: 61, scope: !645, inlinedAt: !534)
!659 = !DILocalVariable(name: "n", arg: 1, scope: !660, file: !2, line: 675, type: !20)
!660 = distinct !DISubprogram(name: "daxpy_ur", scope: !2, file: !2, line: 675, type: !340, scopeLine: 677, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !84)
!661 = !DILocation(line: 0, scope: !660, inlinedAt: !662)
!662 = distinct !DILocation(line: 352, column: 25, scope: !645, inlinedAt: !534)
!663 = !DILocalVariable(name: "da", arg: 2, scope: !660, file: !2, line: 675, type: !17)
!664 = !DILocalVariable(name: "dx", arg: 3, scope: !660, file: !2, line: 675, type: !16)
!665 = !DILocalVariable(name: "incx", arg: 4, scope: !660, file: !2, line: 675, type: !20)
!666 = !DILocalVariable(name: "dy", arg: 5, scope: !660, file: !2, line: 675, type: !16)
!667 = !DILocalVariable(name: "incy", arg: 6, scope: !660, file: !2, line: 675, type: !20)
!668 = !DILocation(line: 680, column: 11, scope: !669, inlinedAt: !662)
!669 = distinct !DILexicalBlock(scope: !660, file: !2, line: 680, column: 9)
!670 = !DILocation(line: 680, column: 9, scope: !660, inlinedAt: !662)
!671 = !DILocalVariable(name: "m", scope: !660, file: !2, line: 678, type: !20)
!672 = !DILocation(line: 706, column: 12, scope: !673, inlinedAt: !662)
!673 = distinct !DILexicalBlock(scope: !660, file: !2, line: 706, column: 10)
!674 = !DILocation(line: 706, column: 10, scope: !660, inlinedAt: !662)
!675 = !DILocalVariable(name: "i", scope: !660, file: !2, line: 678, type: !20)
!676 = !DILocation(line: 709, column: 21, scope: !677, inlinedAt: !662)
!677 = distinct !DILexicalBlock(scope: !678, file: !2, line: 708, column: 9)
!678 = distinct !DILexicalBlock(scope: !679, file: !2, line: 708, column: 9)
!679 = distinct !DILexicalBlock(scope: !673, file: !2, line: 707, column: 9)
!680 = !DILocation(line: 709, column: 32, scope: !677, inlinedAt: !662)
!681 = !DILocation(line: 709, column: 27, scope: !677, inlinedAt: !662)
!682 = !DILocation(line: 709, column: 19, scope: !677, inlinedAt: !662)
!683 = !DILocation(line: 708, column: 23, scope: !677, inlinedAt: !662)
!684 = !DILocation(line: 708, column: 9, scope: !678, inlinedAt: !662)
!685 = distinct !{!685, !684, !686, !181}
!686 = !DILocation(line: 709, column: 36, scope: !678, inlinedAt: !662)
!687 = distinct !{!687, !684, !686, !181}
!688 = !DILocation(line: 710, column: 13, scope: !679, inlinedAt: !662)
!689 = !DILocation(line: 713, column: 19, scope: !690, inlinedAt: !662)
!690 = distinct !DILexicalBlock(scope: !691, file: !2, line: 713, column: 5)
!691 = distinct !DILexicalBlock(scope: !660, file: !2, line: 713, column: 5)
!692 = !DILocation(line: 713, column: 5, scope: !691, inlinedAt: !662)
!693 = !DILocation(line: 715, column: 17, scope: !694, inlinedAt: !662)
!694 = distinct !DILexicalBlock(scope: !690, file: !2, line: 714, column: 9)
!695 = !DILocation(line: 715, column: 28, scope: !694, inlinedAt: !662)
!696 = !DILocation(line: 715, column: 23, scope: !694, inlinedAt: !662)
!697 = !DILocation(line: 715, column: 15, scope: !694, inlinedAt: !662)
!698 = !DILocation(line: 716, column: 23, scope: !694, inlinedAt: !662)
!699 = !DILocation(line: 716, column: 19, scope: !694, inlinedAt: !662)
!700 = !DILocation(line: 716, column: 32, scope: !694, inlinedAt: !662)
!701 = !DILocation(line: 716, column: 27, scope: !694, inlinedAt: !662)
!702 = !DILocation(line: 716, column: 17, scope: !694, inlinedAt: !662)
!703 = !DILocation(line: 717, column: 23, scope: !694, inlinedAt: !662)
!704 = !DILocation(line: 717, column: 19, scope: !694, inlinedAt: !662)
!705 = !DILocation(line: 717, column: 32, scope: !694, inlinedAt: !662)
!706 = !DILocation(line: 717, column: 27, scope: !694, inlinedAt: !662)
!707 = !DILocation(line: 717, column: 17, scope: !694, inlinedAt: !662)
!708 = !DILocation(line: 718, column: 23, scope: !694, inlinedAt: !662)
!709 = !DILocation(line: 718, column: 19, scope: !694, inlinedAt: !662)
!710 = !DILocation(line: 718, column: 32, scope: !694, inlinedAt: !662)
!711 = !DILocation(line: 718, column: 27, scope: !694, inlinedAt: !662)
!712 = !DILocation(line: 718, column: 17, scope: !694, inlinedAt: !662)
!713 = !DILocation(line: 713, column: 30, scope: !690, inlinedAt: !662)
!714 = distinct !{!714, !692, !715, !181}
!715 = !DILocation(line: 719, column: 9, scope: !691, inlinedAt: !662)
!716 = !DILocation(line: 344, column: 43, scope: !646, inlinedAt: !534)
!717 = !DILocation(line: 344, column: 37, scope: !646, inlinedAt: !534)
!718 = distinct !{!718, !642, !719, !181}
!719 = !DILocation(line: 353, column: 25, scope: !643, inlinedAt: !534)
!720 = !DILocation(line: 356, column: 29, scope: !566, inlinedAt: !534)
!721 = !DILocation(line: 313, column: 13, scope: !539, inlinedAt: !534)
!722 = !DILocation(line: 313, column: 27, scope: !538, inlinedAt: !534)
!723 = distinct !{!723, !721, !724, !181}
!724 = !DILocation(line: 357, column: 17, scope: !539, inlinedAt: !534)
!725 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !531)
!726 = !DILocation(line: 358, column: 9, scope: !541, inlinedAt: !534)
!727 = !DILocation(line: 358, column: 19, scope: !541, inlinedAt: !534)
!728 = !DILocation(line: 359, column: 13, scope: !729, inlinedAt: !534)
!729 = distinct !DILexicalBlock(scope: !541, file: !2, line: 359, column: 13)
!730 = !DILocation(line: 359, column: 32, scope: !729, inlinedAt: !534)
!731 = !DILocation(line: 359, column: 13, scope: !541, inlinedAt: !534)
!732 = !DILocation(line: 362, column: 5, scope: !214, inlinedAt: !534)
!733 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !734)
!734 = distinct !DILocation(line: 144, column: 19, scope: !493, inlinedAt: !113)
!735 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !734)
!736 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !734)
!737 = !DILocation(line: 144, column: 27, scope: !493, inlinedAt: !113)
!738 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !739)
!739 = distinct !DILocation(line: 145, column: 14, scope: !493, inlinedAt: !113)
!740 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !739)
!741 = !DILocation(line: 0, scope: !391, inlinedAt: !742)
!742 = distinct !DILocation(line: 146, column: 9, scope: !493, inlinedAt: !113)
!743 = !DILocation(line: 505, column: 25, scope: !744, inlinedAt: !742)
!744 = distinct !DILexicalBlock(scope: !745, file: !2, line: 504, column: 21)
!745 = distinct !DILexicalBlock(scope: !746, file: !2, line: 503, column: 17)
!746 = distinct !DILexicalBlock(scope: !747, file: !2, line: 503, column: 17)
!747 = distinct !DILexicalBlock(scope: !748, file: !2, line: 502, column: 17)
!748 = distinct !DILexicalBlock(scope: !749, file: !2, line: 497, column: 13)
!749 = distinct !DILexicalBlock(scope: !750, file: !2, line: 496, column: 13)
!750 = distinct !DILexicalBlock(scope: !411, file: !2, line: 494, column: 9)
!751 = !DILocation(line: 506, column: 25, scope: !744, inlinedAt: !742)
!752 = !DILocation(line: 507, column: 27, scope: !753, inlinedAt: !742)
!753 = distinct !DILexicalBlock(scope: !744, file: !2, line: 507, column: 25)
!754 = !DILocation(line: 507, column: 25, scope: !744, inlinedAt: !742)
!755 = !DILocation(line: 509, column: 32, scope: !756, inlinedAt: !742)
!756 = distinct !DILexicalBlock(scope: !753, file: !2, line: 508, column: 25)
!757 = !DILocation(line: 509, column: 30, scope: !756, inlinedAt: !742)
!758 = !DILocation(line: 510, column: 30, scope: !756, inlinedAt: !742)
!759 = !DILocation(line: 511, column: 25, scope: !756, inlinedAt: !742)
!760 = !DILocation(line: 512, column: 34, scope: !744, inlinedAt: !742)
!761 = !DILocation(line: 512, column: 48, scope: !744, inlinedAt: !742)
!762 = !DILocation(line: 512, column: 50, scope: !744, inlinedAt: !742)
!763 = !DILocation(line: 512, column: 41, scope: !744, inlinedAt: !742)
!764 = !DILocation(line: 512, column: 57, scope: !744, inlinedAt: !742)
!765 = !DILocation(line: 512, column: 21, scope: !744, inlinedAt: !742)
!766 = !DILocation(line: 0, scope: !660, inlinedAt: !767)
!767 = distinct !DILocation(line: 512, column: 21, scope: !744, inlinedAt: !742)
!768 = !DILocation(line: 680, column: 11, scope: !669, inlinedAt: !767)
!769 = !DILocation(line: 680, column: 9, scope: !660, inlinedAt: !767)
!770 = !DILocation(line: 706, column: 12, scope: !673, inlinedAt: !767)
!771 = !DILocation(line: 706, column: 10, scope: !660, inlinedAt: !767)
!772 = !DILocation(line: 709, column: 21, scope: !677, inlinedAt: !767)
!773 = !DILocation(line: 709, column: 32, scope: !677, inlinedAt: !767)
!774 = !DILocation(line: 709, column: 27, scope: !677, inlinedAt: !767)
!775 = !DILocation(line: 709, column: 19, scope: !677, inlinedAt: !767)
!776 = !DILocation(line: 708, column: 23, scope: !677, inlinedAt: !767)
!777 = !DILocation(line: 708, column: 9, scope: !678, inlinedAt: !767)
!778 = distinct !{!778, !777, !779, !181}
!779 = !DILocation(line: 709, column: 36, scope: !678, inlinedAt: !767)
!780 = distinct !{!780, !777, !779, !181}
!781 = !DILocation(line: 710, column: 13, scope: !679, inlinedAt: !767)
!782 = !DILocation(line: 713, column: 19, scope: !690, inlinedAt: !767)
!783 = !DILocation(line: 713, column: 5, scope: !691, inlinedAt: !767)
!784 = !DILocation(line: 715, column: 17, scope: !694, inlinedAt: !767)
!785 = !DILocation(line: 715, column: 28, scope: !694, inlinedAt: !767)
!786 = !DILocation(line: 715, column: 23, scope: !694, inlinedAt: !767)
!787 = !DILocation(line: 715, column: 15, scope: !694, inlinedAt: !767)
!788 = !DILocation(line: 716, column: 23, scope: !694, inlinedAt: !767)
!789 = !DILocation(line: 716, column: 19, scope: !694, inlinedAt: !767)
!790 = !DILocation(line: 716, column: 32, scope: !694, inlinedAt: !767)
!791 = !DILocation(line: 716, column: 27, scope: !694, inlinedAt: !767)
!792 = !DILocation(line: 716, column: 17, scope: !694, inlinedAt: !767)
!793 = !DILocation(line: 717, column: 23, scope: !694, inlinedAt: !767)
!794 = !DILocation(line: 717, column: 19, scope: !694, inlinedAt: !767)
!795 = !DILocation(line: 717, column: 32, scope: !694, inlinedAt: !767)
!796 = !DILocation(line: 717, column: 27, scope: !694, inlinedAt: !767)
!797 = !DILocation(line: 717, column: 17, scope: !694, inlinedAt: !767)
!798 = !DILocation(line: 718, column: 23, scope: !694, inlinedAt: !767)
!799 = !DILocation(line: 718, column: 19, scope: !694, inlinedAt: !767)
!800 = !DILocation(line: 718, column: 32, scope: !694, inlinedAt: !767)
!801 = !DILocation(line: 718, column: 27, scope: !694, inlinedAt: !767)
!802 = !DILocation(line: 718, column: 17, scope: !694, inlinedAt: !767)
!803 = !DILocation(line: 713, column: 30, scope: !690, inlinedAt: !767)
!804 = distinct !{!804, !783, !805, !181}
!805 = !DILocation(line: 719, column: 9, scope: !691, inlinedAt: !767)
!806 = !DILocation(line: 503, column: 31, scope: !745, inlinedAt: !742)
!807 = !DILocation(line: 503, column: 17, scope: !746, inlinedAt: !742)
!808 = distinct !{!808, !807, !809, !181}
!809 = !DILocation(line: 513, column: 21, scope: !746, inlinedAt: !742)
!810 = !DILocation(line: 144, column: 16, scope: !493, inlinedAt: !113)
!811 = !DILocation(line: 517, column: 13, scope: !812, inlinedAt: !742)
!812 = distinct !DILexicalBlock(scope: !748, file: !2, line: 517, column: 13)
!813 = !DILocation(line: 519, column: 29, scope: !814, inlinedAt: !742)
!814 = distinct !DILexicalBlock(scope: !815, file: !2, line: 518, column: 17)
!815 = distinct !DILexicalBlock(scope: !812, file: !2, line: 517, column: 13)
!816 = !DILocation(line: 519, column: 23, scope: !814, inlinedAt: !742)
!817 = !DILocation(line: 520, column: 24, scope: !814, inlinedAt: !742)
!818 = !DILocation(line: 520, column: 34, scope: !814, inlinedAt: !742)
!819 = !DILocation(line: 520, column: 36, scope: !814, inlinedAt: !742)
!820 = !DILocation(line: 520, column: 29, scope: !814, inlinedAt: !742)
!821 = !DILocation(line: 520, column: 28, scope: !814, inlinedAt: !742)
!822 = !DILocation(line: 520, column: 22, scope: !814, inlinedAt: !742)
!823 = !DILocation(line: 521, column: 21, scope: !814, inlinedAt: !742)
!824 = !DILocation(line: 522, column: 31, scope: !814, inlinedAt: !742)
!825 = !DILocation(line: 522, column: 17, scope: !814, inlinedAt: !742)
!826 = !DILocation(line: 0, scope: !660, inlinedAt: !827)
!827 = distinct !DILocation(line: 522, column: 17, scope: !814, inlinedAt: !742)
!828 = !DILocation(line: 680, column: 11, scope: !669, inlinedAt: !827)
!829 = !DILocation(line: 680, column: 9, scope: !660, inlinedAt: !827)
!830 = !DILocation(line: 706, column: 12, scope: !673, inlinedAt: !827)
!831 = !DILocation(line: 706, column: 10, scope: !660, inlinedAt: !827)
!832 = !DILocation(line: 709, column: 21, scope: !677, inlinedAt: !827)
!833 = !DILocation(line: 709, column: 32, scope: !677, inlinedAt: !827)
!834 = !DILocation(line: 709, column: 27, scope: !677, inlinedAt: !827)
!835 = !DILocation(line: 709, column: 19, scope: !677, inlinedAt: !827)
!836 = !DILocation(line: 708, column: 23, scope: !677, inlinedAt: !827)
!837 = !DILocation(line: 708, column: 9, scope: !678, inlinedAt: !827)
!838 = distinct !{!838, !837, !839, !181}
!839 = !DILocation(line: 709, column: 36, scope: !678, inlinedAt: !827)
!840 = distinct !{!840, !837, !839, !181}
!841 = !DILocation(line: 710, column: 13, scope: !679, inlinedAt: !827)
!842 = !DILocation(line: 713, column: 19, scope: !690, inlinedAt: !827)
!843 = !DILocation(line: 713, column: 5, scope: !691, inlinedAt: !827)
!844 = !DILocation(line: 715, column: 17, scope: !694, inlinedAt: !827)
!845 = !DILocation(line: 715, column: 28, scope: !694, inlinedAt: !827)
!846 = !DILocation(line: 715, column: 23, scope: !694, inlinedAt: !827)
!847 = !DILocation(line: 715, column: 15, scope: !694, inlinedAt: !827)
!848 = !DILocation(line: 716, column: 23, scope: !694, inlinedAt: !827)
!849 = !DILocation(line: 716, column: 19, scope: !694, inlinedAt: !827)
!850 = !DILocation(line: 716, column: 32, scope: !694, inlinedAt: !827)
!851 = !DILocation(line: 716, column: 27, scope: !694, inlinedAt: !827)
!852 = !DILocation(line: 716, column: 17, scope: !694, inlinedAt: !827)
!853 = !DILocation(line: 717, column: 23, scope: !694, inlinedAt: !827)
!854 = !DILocation(line: 717, column: 19, scope: !694, inlinedAt: !827)
!855 = !DILocation(line: 717, column: 32, scope: !694, inlinedAt: !827)
!856 = !DILocation(line: 717, column: 27, scope: !694, inlinedAt: !827)
!857 = !DILocation(line: 717, column: 17, scope: !694, inlinedAt: !827)
!858 = !DILocation(line: 718, column: 23, scope: !694, inlinedAt: !827)
!859 = !DILocation(line: 718, column: 19, scope: !694, inlinedAt: !827)
!860 = !DILocation(line: 718, column: 32, scope: !694, inlinedAt: !827)
!861 = !DILocation(line: 718, column: 27, scope: !694, inlinedAt: !827)
!862 = !DILocation(line: 718, column: 17, scope: !694, inlinedAt: !827)
!863 = !DILocation(line: 713, column: 30, scope: !690, inlinedAt: !827)
!864 = distinct !{!864, !843, !865, !181}
!865 = !DILocation(line: 719, column: 9, scope: !691, inlinedAt: !827)
!866 = !DILocation(line: 517, column: 29, scope: !815, inlinedAt: !742)
!867 = distinct !{!867, !811, !868, !181}
!868 = !DILocation(line: 523, column: 17, scope: !812, inlinedAt: !742)
!869 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !739)
!870 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !871)
!871 = distinct !DILocation(line: 147, column: 19, scope: !493, inlinedAt: !113)
!872 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !871)
!873 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !871)
!874 = !DILocation(line: 147, column: 27, scope: !493, inlinedAt: !113)
!875 = !DILocation(line: 147, column: 16, scope: !493, inlinedAt: !113)
!876 = !DILocation(line: 139, column: 23, scope: !142, inlinedAt: !113)
!877 = distinct !{!877, !144, !878, !181}
!878 = !DILocation(line: 148, column: 9, scope: !143, inlinedAt: !113)
!879 = !DILocation(line: 874, column: 26, scope: !129, inlinedAt: !880)
!880 = distinct !DILocation(line: 149, column: 12, scope: !110, inlinedAt: !113)
!881 = !DILocation(line: 874, column: 20, scope: !129, inlinedAt: !880)
!882 = !DILocation(line: 874, column: 33, scope: !129, inlinedAt: !880)
!883 = !DILocation(line: 149, column: 20, scope: !110, inlinedAt: !113)
!884 = !DILocation(line: 150, column: 15, scope: !885, inlinedAt: !113)
!885 = distinct !DILexicalBlock(scope: !110, file: !2, line: 150, column: 9)
!886 = !DILocation(line: 150, column: 20, scope: !885, inlinedAt: !113)
!887 = !DILocation(line: 150, column: 29, scope: !885, inlinedAt: !113)
!888 = !DILocation(line: 150, column: 36, scope: !885, inlinedAt: !113)
!889 = !DILocation(line: 150, column: 9, scope: !110, inlinedAt: !113)
!890 = !DILocation(line: 152, column: 15, scope: !110, inlinedAt: !113)
!891 = !DILocation(line: 152, column: 14, scope: !110, inlinedAt: !113)
!892 = !DILocation(line: 152, column: 20, scope: !110, inlinedAt: !113)
!893 = !DILocation(line: 152, column: 31, scope: !110, inlinedAt: !113)
!894 = !DILocation(line: 152, column: 24, scope: !110, inlinedAt: !113)
!895 = !DILocalVariable(name: "kflops", scope: !110, file: !2, line: 115, type: !17)
!896 = !DILocation(line: 153, column: 21, scope: !110, inlinedAt: !113)
!897 = !DILocation(line: 153, column: 28, scope: !110, inlinedAt: !113)
!898 = !DILocalVariable(name: "toverhead", scope: !110, file: !2, line: 115, type: !17)
!899 = !DILocation(line: 154, column: 15, scope: !900, inlinedAt: !113)
!900 = distinct !DILexicalBlock(scope: !110, file: !2, line: 154, column: 9)
!901 = !DILocation(line: 161, column: 30, scope: !110, inlinedAt: !113)
!902 = !DILocation(line: 156, column: 15, scope: !903, inlinedAt: !113)
!903 = distinct !DILexicalBlock(scope: !110, file: !2, line: 156, column: 9)
!904 = !DILocation(line: 162, column: 17, scope: !110, inlinedAt: !113)
!905 = !DILocation(line: 158, column: 18, scope: !906, inlinedAt: !113)
!906 = distinct !DILexicalBlock(scope: !110, file: !2, line: 158, column: 9)
!907 = !DILocation(line: 162, column: 36, scope: !110, inlinedAt: !113)
!908 = !DILocation(line: 161, column: 37, scope: !110, inlinedAt: !113)
!909 = !DILocation(line: 162, column: 24, scope: !110, inlinedAt: !113)
!910 = !DILocation(line: 162, column: 46, scope: !110, inlinedAt: !113)
!911 = !DILocation(line: 160, column: 5, scope: !110, inlinedAt: !113)
!912 = !DILocation(line: 164, column: 5, scope: !110, inlinedAt: !113)
!913 = !DILocation(line: 165, column: 5, scope: !110, inlinedAt: !113)
!914 = !DILocation(line: 104, column: 37, scope: !81)
!915 = !DILocation(line: 105, column: 18, scope: !81)
!916 = distinct !{!916, !108, !917, !181}
!917 = !DILocation(line: 105, column: 20, scope: !81)
!918 = !DILocation(line: 106, column: 14, scope: !81)
!919 = !DILocation(line: 106, column: 9, scope: !81)
!920 = !DILocation(line: 107, column: 9, scope: !81)
!921 = !DILocation(line: 108, column: 1, scope: !81)
