.class public final Lcom/android/systemui/biometrics/SideFpsController;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Lcom/android/systemui/Dumpable;


# instance fields
.field public final activityTaskManager:Landroid/app/ActivityTaskManager;

.field public final alternateBouncerInteractor:Lcom/android/systemui/keyguard/domain/interactor/AlternateBouncerInteractor;

.field public final context:Landroid/content/Context;

.field public final displayInfo:Landroid/view/DisplayInfo;

.field public final displayStateInteractor:Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractor;

.field public final isReverseDefaultRotation:Z

.field public final layoutInflater:Landroid/view/LayoutInflater;

.field public final mainExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

.field public final orientationListener:Lcom/android/systemui/biometrics/BiometricDisplayListener;

.field public final orientationReasonListener:Lcom/android/systemui/biometrics/OrientationReasonListener;

.field public overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

.field public overlayView:Landroid/view/View;

.field public final overlayViewParams:Landroid/view/WindowManager$LayoutParams;

.field public final requests:Ljava/util/HashSet;

.field public final sensorProps:Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;

.field public final windowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/hardware/fingerprint/FingerprintManager;Landroid/view/WindowManager;Landroid/app/ActivityTaskManager;Landroid/hardware/display/DisplayManager;Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractor;Lcom/android/systemui/util/concurrency/DelayableExecutor;Landroid/os/Handler;Lcom/android/systemui/keyguard/domain/interactor/AlternateBouncerInteractor;Lkotlinx/coroutines/CoroutineScope;Lcom/android/systemui/dump/DumpManager;)V
    .locals 11

    move-object v0, p0

    move-object v1, p3

    move-object/from16 v2, p10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v9, p1

    iput-object v9, v0, Lcom/android/systemui/biometrics/SideFpsController;->context:Landroid/content/Context;

    move-object v3, p2

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->layoutInflater:Landroid/view/LayoutInflater;

    move-object v3, p4

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->windowManager:Landroid/view/WindowManager;

    move-object/from16 v3, p5

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->activityTaskManager:Landroid/app/ActivityTaskManager;

    move-object/from16 v3, p7

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->displayStateInteractor:Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractor;

    move-object/from16 v3, p8

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->mainExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

    iput-object v2, v0, Lcom/android/systemui/biometrics/SideFpsController;->alternateBouncerInteractor:Lcom/android/systemui/keyguard/domain/interactor/AlternateBouncerInteractor;

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->requests:Ljava/util/HashSet;

    if-eqz v1, :cond_0

    invoke-static {p3}, Lcom/android/systemui/biometrics/SideFpsControllerKt;->getSideFpsSensorProperties(Landroid/hardware/fingerprint/FingerprintManager;)Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;

    move-result-object v7

    if-eqz v7, :cond_0

    iput-object v7, v0, Lcom/android/systemui/biometrics/SideFpsController;->sensorProps:Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;

    new-instance v10, Lcom/android/systemui/biometrics/OrientationReasonListener;

    new-instance v8, Lcom/android/systemui/biometrics/SideFpsController$orientationReasonListener$1;

    invoke-direct {v8, p0}, Lcom/android/systemui/biometrics/SideFpsController$orientationReasonListener$1;-><init>(Lcom/android/systemui/biometrics/SideFpsController;)V

    move-object v3, v10

    move-object v4, p1

    move-object/from16 v5, p6

    move-object/from16 v6, p9

    invoke-direct/range {v3 .. v8}, Lcom/android/systemui/biometrics/OrientationReasonListener;-><init>(Landroid/content/Context;Landroid/hardware/display/DisplayManager;Landroid/os/Handler;Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;Lkotlin/jvm/functions/Function1;)V

    iput-object v10, v0, Lcom/android/systemui/biometrics/SideFpsController;->orientationReasonListener:Lcom/android/systemui/biometrics/OrientationReasonListener;

    iget-object v3, v10, Lcom/android/systemui/biometrics/OrientationReasonListener;->orientationListener:Lcom/android/systemui/biometrics/BiometricDisplayListener;

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->orientationListener:Lcom/android/systemui/biometrics/BiometricDisplayListener;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x11101cf

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    iput-boolean v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->isReverseDefaultRotation:Z

    sget-object v3, Landroid/hardware/biometrics/SensorLocationInternal;->DEFAULT:Landroid/hardware/biometrics/SensorLocationInternal;

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

    new-instance v3, Landroid/view/DisplayInfo;

    invoke-direct {v3}, Landroid/view/DisplayInfo;-><init>()V

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->displayInfo:Landroid/view/DisplayInfo;

    new-instance v3, Landroid/view/WindowManager$LayoutParams;

    const/4 v4, -0x2

    const/4 v5, -0x2

    const/16 v6, 0x7e8

    const v7, 0x1000128

    const/4 v8, -0x3

    move-object p4, v3

    move/from16 p5, v4

    move/from16 p6, v5

    move/from16 p7, v6

    move/from16 p8, v7

    move/from16 p9, v8

    invoke-direct/range {p4 .. p9}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const-string v4, "SideFpsController"

    invoke-virtual {v3, v4}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/WindowManager$LayoutParams;->setFitInsetsTypes(I)V

    const/16 v4, 0x33

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v4, 0x3

    iput v4, v3, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    const v5, 0x20000040

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    iput-object v3, v0, Lcom/android/systemui/biometrics/SideFpsController;->overlayViewParams:Landroid/view/WindowManager$LayoutParams;

    new-instance v3, Lcom/android/systemui/biometrics/SideFpsController$1;

    invoke-direct {v3, p0}, Lcom/android/systemui/biometrics/SideFpsController$1;-><init>(Lcom/android/systemui/biometrics/SideFpsController;)V

    invoke-virtual {p3, v3}, Landroid/hardware/fingerprint/FingerprintManager;->setSidefpsController(Landroid/hardware/fingerprint/ISidefpsController;)V

    iget-object v1, v2, Lcom/android/systemui/keyguard/domain/interactor/AlternateBouncerInteractor;->bouncerRepository:Lcom/android/systemui/keyguard/data/repository/KeyguardBouncerRepository;

    check-cast v1, Lcom/android/systemui/keyguard/data/repository/KeyguardBouncerRepositoryImpl;

    iget-object v1, v1, Lcom/android/systemui/keyguard/data/repository/KeyguardBouncerRepositoryImpl;->_alternateBouncerUIAvailable:Lkotlinx/coroutines/flow/StateFlowImpl;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Lkotlinx/coroutines/flow/StateFlowImpl;->setValue(Ljava/lang/Object;)V

    new-instance v1, Lcom/android/systemui/biometrics/SideFpsController$listenForAlternateBouncerVisibility$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/systemui/biometrics/SideFpsController$listenForAlternateBouncerVisibility$1;-><init>(Lcom/android/systemui/biometrics/SideFpsController;Lkotlin/coroutines/Continuation;)V

    move-object/from16 v3, p11

    invoke-static {v3, v2, v2, v1, v4}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;I)Lkotlinx/coroutines/StandaloneCoroutine;

    move-object/from16 v1, p12

    invoke-virtual {v1, p0}, Lcom/android/systemui/dump/DumpManager;->registerDumpable(Lcom/android/systemui/Dumpable;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no side fingerprint sensor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic getOrientationListener$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getOrientationReasonListener$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getOverlayOffsets$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getSensorProps$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final createOverlayForDisplay(I)V
    .locals 13

    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->layoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0d0246

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/systemui/biometrics/SideFpsController;->setOverlayView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/android/systemui/biometrics/SideFpsController;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/android/systemui/biometrics/SideFpsController;->displayInfo:Landroid/view/DisplayInfo;

    invoke-virtual {v2, v4}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    invoke-virtual {v2}, Landroid/view/Display;->getUniqueId()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/android/systemui/biometrics/SideFpsController;->sensorProps:Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;

    invoke-virtual {v6, v5}, Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;->getLocation(Ljava/lang/String;)Landroid/hardware/biometrics/SensorLocationInternal;

    move-result-object v5

    if-nez v5, :cond_0

    invoke-virtual {v2}, Landroid/view/Display;->getUniqueId()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "No location specified for display: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "SideFpsController"

    invoke-static {v8, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    if-nez v5, :cond_1

    invoke-virtual {v6}, Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;->getLocation()Landroid/hardware/biometrics/SensorLocationInternal;

    move-result-object v5

    :cond_1
    iput-object v5, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

    const v6, 0x7f0a0699

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/airbnb/lottie/LottieAnimationView;

    iget v7, v5, Landroid/hardware/biometrics/SensorLocationInternal;->sensorLocationY:I

    const/4 v8, 0x1

    if-eqz v7, :cond_2

    move v7, v8

    goto :goto_0

    :cond_2
    move v7, v3

    :goto_0
    iget v9, v4, Landroid/view/DisplayInfo;->rotation:I

    iget-boolean v10, p0, Lcom/android/systemui/biometrics/SideFpsController;->isReverseDefaultRotation:Z

    if-eqz v10, :cond_3

    add-int/lit8 v9, v9, 0x1

    rem-int/lit8 v9, v9, 0x4

    :cond_3
    const/4 v11, 0x2

    if-eq v9, v8, :cond_5

    if-eq v9, v11, :cond_7

    const/4 v12, 0x3

    if-eq v9, v12, :cond_4

    goto :goto_1

    :cond_4
    if-eqz v7, :cond_6

    goto :goto_2

    :cond_5
    if-eqz v7, :cond_7

    :cond_6
    :goto_1
    const/4 v7, 0x0

    goto :goto_3

    :cond_7
    :goto_2
    const/high16 v7, 0x43340000    # 180.0f

    :goto_3
    invoke-virtual {v0, v7}, Landroid/view/View;->setRotation(F)V

    iget v5, v5, Landroid/hardware/biometrics/SensorLocationInternal;->sensorLocationY:I

    if-eqz v5, :cond_8

    move v3, v8

    :cond_8
    iget v4, v4, Landroid/view/DisplayInfo;->rotation:I

    if-eqz v10, :cond_9

    add-int/lit8 v4, v4, 0x1

    rem-int/lit8 v4, v4, 0x4

    :cond_9
    if-eqz v4, :cond_b

    if-eq v4, v11, :cond_a

    if-eqz v3, :cond_c

    goto :goto_5

    :cond_a
    if-eqz v3, :cond_d

    goto :goto_4

    :cond_b
    if-eqz v3, :cond_d

    :cond_c
    :goto_4
    const v3, 0x7f120022

    goto :goto_6

    :cond_d
    :goto_5
    const v3, 0x7f120023

    :goto_6
    invoke-virtual {v6, v3}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    new-instance v3, Lcom/android/systemui/biometrics/SideFpsController$createOverlayForDisplay$1;

    invoke-direct {v3, p0, v0, v2}, Lcom/android/systemui/biometrics/SideFpsController$createOverlayForDisplay$1;-><init>(Lcom/android/systemui/biometrics/SideFpsController;Landroid/view/View;Landroid/view/Display;)V

    invoke-virtual {v6, v3}, Lcom/airbnb/lottie/LottieAnimationView;->addLottieOnCompositionLoadedListener(Lcom/airbnb/lottie/LottieOnCompositionLoadedListener;)Z

    iget-object p0, p0, Lcom/android/systemui/biometrics/SideFpsController;->orientationReasonListener:Lcom/android/systemui/biometrics/OrientationReasonListener;

    iput p1, p0, Lcom/android/systemui/biometrics/OrientationReasonListener;->reason:I

    invoke-virtual {v6}, Lcom/airbnb/lottie/LottieAnimationView;->getComposition()Lcom/airbnb/lottie/LottieComposition;

    move-result-object p0

    if-eqz p0, :cond_e

    invoke-static {p1, v1, v6}, Lcom/android/systemui/biometrics/SideFpsControllerKt;->addOverlayDynamicColor$update(ILandroid/content/Context;Lcom/airbnb/lottie/LottieAnimationView;)V

    goto :goto_7

    :cond_e
    new-instance p0, Lcom/android/systemui/biometrics/SideFpsControllerKt$addOverlayDynamicColor$1;

    invoke-direct {p0, p1, v1, v6}, Lcom/android/systemui/biometrics/SideFpsControllerKt$addOverlayDynamicColor$1;-><init>(ILandroid/content/Context;Lcom/airbnb/lottie/LottieAnimationView;)V

    invoke-virtual {v6, p0}, Lcom/airbnb/lottie/LottieAnimationView;->addLottieOnCompositionLoadedListener(Lcom/airbnb/lottie/LottieOnCompositionLoadedListener;)Z

    :goto_7
    new-instance p0, Lcom/android/systemui/biometrics/SideFpsController$createOverlayForDisplay$2;

    invoke-direct {p0}, Lcom/android/systemui/biometrics/SideFpsController$createOverlayForDisplay$2;-><init>()V

    invoke-virtual {v0, p0}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    return-void
.end method

.method public final dump(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 5

    const-string p2, "requests:"

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/systemui/biometrics/SideFpsController;->requests:Ljava/util/HashSet;

    invoke-virtual {p2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "     "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ".name"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p2, "overlayView:"

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayView:Landroid/view/View;

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    goto :goto_1

    :cond_1
    move-object p2, v0

    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "     width="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayView:Landroid/view/View;

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    goto :goto_2

    :cond_2
    move-object p2, v0

    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "     height="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayView:Landroid/view/View;

    if-eqz p2, :cond_3

    invoke-static {p2}, Lcom/android/systemui/util/ConvenienceExtensionsKt;->getBoundsOnScreen(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p2

    goto :goto_3

    :cond_3
    move-object p2, v0

    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "     boundsOnScreen="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p2, "displayStateInteractor:"

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/systemui/biometrics/SideFpsController;->displayStateInteractor:Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractor;

    if-eqz p2, :cond_4

    check-cast p2, Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractorImpl;

    iget-object p2, p2, Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractorImpl;->isInRearDisplayMode:Lkotlinx/coroutines/flow/ReadonlyStateFlow;

    if-eqz p2, :cond_4

    invoke-virtual {p2}, Lkotlinx/coroutines/flow/ReadonlyStateFlow;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    goto :goto_4

    :cond_4
    move-object p2, v0

    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "     isInRearDisplayMode="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string/jumbo p2, "sensorProps:"

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/systemui/biometrics/SideFpsController;->displayInfo:Landroid/view/DisplayInfo;

    iget-object v1, p2, Landroid/view/DisplayInfo;->uniqueId:Ljava/lang/String;

    const-string v2, "     displayId="

    invoke-static {v2, v1, p1}, Lcom/android/keyguard/FaceWakeUpTriggersConfig$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/io/PrintWriter;)V

    iget-object v1, p0, Lcom/android/systemui/biometrics/SideFpsController;->sensorProps:Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;

    if-eqz v1, :cond_5

    iget v2, v1, Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;->sensorType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_5

    :cond_5
    move-object v2, v0

    :goto_5
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "     sensorType="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    if-eqz v1, :cond_6

    iget-object v0, p2, Landroid/view/DisplayInfo;->uniqueId:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/hardware/fingerprint/FingerprintSensorPropertiesInternal;->getLocation(Ljava/lang/String;)Landroid/hardware/biometrics/SensorLocationInternal;

    move-result-object v0

    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "     location="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "overlayOffsets="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "isReverseDefaultRotation="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean p0, p0, Lcom/android/systemui/biometrics/SideFpsController;->isReverseDefaultRotation:Z

    invoke-static {v0, p0, p1}, Lcom/android/keyguard/KeyguardClockSwitchController$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ZLjava/io/PrintWriter;)V

    iget p0, p2, Landroid/view/DisplayInfo;->rotation:I

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "currentRotation="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void
.end method

.method public final hide(Lcom/android/systemui/biometrics/SideFpsUiRequestSource;)V
    .locals 1

    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->requests:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    new-instance v0, Lcom/android/systemui/biometrics/SideFpsController$hide$1;

    invoke-direct {v0, p0, p1}, Lcom/android/systemui/biometrics/SideFpsController$hide$1;-><init>(Lcom/android/systemui/biometrics/SideFpsController;Lcom/android/systemui/biometrics/SideFpsUiRequestSource;)V

    iget-object p0, p0, Lcom/android/systemui/biometrics/SideFpsController;->mainExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

    check-cast p0, Lcom/android/systemui/util/concurrency/ExecutorImpl;

    invoke-virtual {p0, v0}, Lcom/android/systemui/util/concurrency/ExecutorImpl;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final setOverlayView(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayView:Landroid/view/View;

    iget-object v1, p0, Lcom/android/systemui/biometrics/SideFpsController;->orientationListener:Lcom/android/systemui/biometrics/BiometricDisplayListener;

    iget-object v2, p0, Lcom/android/systemui/biometrics/SideFpsController;->windowManager:Landroid/view/WindowManager;

    if-eqz v0, :cond_0

    const v3, 0x7f0a0699

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v3}, Lcom/airbnb/lottie/LottieAnimationView;->pauseAnimation()V

    invoke-interface {v2, v0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    iget-object v0, v1, Lcom/android/systemui/biometrics/BiometricDisplayListener;->displayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v0, v1}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    :cond_0
    iput-object p1, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayView:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p0, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayViewParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v2, p1, p0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1}, Lcom/android/systemui/biometrics/BiometricDisplayListener;->enable()V

    :cond_1
    return-void
.end method

.method public final show(Lcom/android/systemui/biometrics/SideFpsUiRequestSource;I)V
    .locals 1

    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->displayStateInteractor:Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractor;

    check-cast v0, Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractorImpl;

    iget-object v0, v0, Lcom/android/systemui/biometrics/domain/interactor/DisplayStateInteractorImpl;->isInRearDisplayMode:Lkotlinx/coroutines/flow/ReadonlyStateFlow;

    invoke-virtual {v0}, Lkotlinx/coroutines/flow/ReadonlyStateFlow;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->requests:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/android/systemui/biometrics/SideFpsController$show$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/systemui/biometrics/SideFpsController$show$1;-><init>(Lcom/android/systemui/biometrics/SideFpsController;Lcom/android/systemui/biometrics/SideFpsUiRequestSource;I)V

    iget-object p0, p0, Lcom/android/systemui/biometrics/SideFpsController;->mainExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

    check-cast p0, Lcom/android/systemui/util/concurrency/ExecutorImpl;

    invoke-virtual {p0, v0}, Lcom/android/systemui/util/concurrency/ExecutorImpl;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final updateOverlayParams(Landroid/view/Display;Landroid/graphics/Rect;)V
    .locals 8

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    iget-boolean v3, p0, Lcom/android/systemui/biometrics/SideFpsController;->isReverseDefaultRotation:Z

    if-eqz v3, :cond_3

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_2

    :cond_2
    move v0, v2

    :cond_3
    :goto_2
    iget-object v4, p0, Lcom/android/systemui/biometrics/SideFpsController;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v4}, Landroid/view/WindowManager;->getMaximumWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    if-eqz v0, :cond_4

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v6

    goto :goto_3

    :cond_4
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v6

    :goto_3
    if-eqz v0, :cond_5

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    goto :goto_4

    :cond_5
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    :goto_4
    if-eqz v0, :cond_6

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v7

    goto :goto_5

    :cond_6
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v7

    :goto_5
    if-eqz v0, :cond_7

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    goto :goto_6

    :cond_7
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p2

    :goto_6
    iget-object v0, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

    iget v0, v0, Landroid/hardware/biometrics/SensorLocationInternal;->sensorLocationY:I

    if-eqz v0, :cond_8

    goto :goto_7

    :cond_8
    move v1, v2

    :goto_7
    if-eqz v1, :cond_9

    new-instance v0, Landroid/graphics/Rect;

    sub-int v1, v6, v7

    iget-object v7, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

    iget v7, v7, Landroid/hardware/biometrics/SensorLocationInternal;->sensorLocationY:I

    add-int/2addr p2, v7

    invoke-direct {v0, v1, v7, v6, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_8

    :cond_9
    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayOffsets:Landroid/hardware/biometrics/SensorLocationInternal;

    iget v1, v1, Landroid/hardware/biometrics/SensorLocationInternal;->sensorLocationX:I

    add-int/2addr v7, v1

    invoke-direct {v0, v1, v2, v7, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_8
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v2, v2, v6, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    if-eqz v3, :cond_a

    add-int/lit8 p1, p1, 0x1

    rem-int/lit8 p1, p1, 0x4

    :cond_a
    invoke-static {v0, p2, p1}, Landroid/util/RotationUtils;->rotateBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;I)V

    iget-object p1, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayViewParams:Landroid/view/WindowManager$LayoutParams;

    iget p2, v0, Landroid/graphics/Rect;->left:I

    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget p2, v0, Landroid/graphics/Rect;->top:I

    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object p0, p0, Lcom/android/systemui/biometrics/SideFpsController;->overlayView:Landroid/view/View;

    invoke-interface {v4, p0, p1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
