.class public Lcom/longcheer/sidebar/ui/view/IndicatorView;
.super Landroid/widget/FrameLayout;
.source "IndicatorView.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/longcheer/sidebar/ui/view/IndicatorView$MyHandler;,
        Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;
    }
.end annotation


# instance fields
.field private MIN_WINDOW_Y:I

.field private isAnimation:Z

.field private isShowing:Z

.field private mAnimatorSet:Landroid/animation/AnimatorSet;

.field private mCurrentLayoutParams:Landroid/view/WindowManager$LayoutParams;

.field private mDisplayHeight:I

.field private mDisplayWidth:I

.field private mDownX:I

.field private final mHandler:Landroid/os/Handler;

.field private final mIndicator:Landroid/view/View;

.field private mIndicatorHeight:I

.field private mIndicatorWidth:I

.field private mLastConfiguration:Landroid/content/res/Configuration;

.field private mMargin:I

.field private mPosition:Lcom/longcheer/sidebar/utils/Position;

.field private mSafeInset:I

.field private mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

.field private mTempIndicatorHeight:I

.field private mTempIndicatorWidth:I

.field private final mWindowManager:Landroid/view/WindowManager;

.field private needHideView:Z

.field private state:I


# direct methods
.method public static synthetic $r8$lambda$0i0sOBxPHtUhh__WTrQSxiIl62s(Lcom/longcheer/sidebar/ui/view/IndicatorView;Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->lambda$initAnim$0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Kjevl3kKRaGiGgjTn3dR40s1v3E(Lcom/longcheer/sidebar/ui/view/IndicatorView;Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->lambda$initAnim$1(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic $r8$lambda$otSEyvFOLQvXFrCjxRkbOPhLoPo(Lcom/longcheer/sidebar/ui/view/IndicatorView;Landroid/graphics/Rect;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->lambda$setSystemGestureExclusion$2(Landroid/graphics/Rect;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetisShowing(Lcom/longcheer/sidebar/ui/view/IndicatorView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmAnimatorSet(Lcom/longcheer/sidebar/ui/view/IndicatorView;)Landroid/animation/AnimatorSet;
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetneedHideView(Lcom/longcheer/sidebar/ui/view/IndicatorView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->needHideView:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetstate(Lcom/longcheer/sidebar/ui/view/IndicatorView;)I
    .locals 0

    iget p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fputisAnimation(Lcom/longcheer/sidebar/ui/view/IndicatorView;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isAnimation:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputstate(Lcom/longcheer/sidebar/ui/view/IndicatorView;I)V
    .locals 0

    iput p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mhideView(Lcom/longcheer/sidebar/ui/view/IndicatorView;)V
    .locals 0

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->hideView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/longcheer/sidebar/utils/Position;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    new-instance v1, Lcom/longcheer/sidebar/ui/view/IndicatorView$MyHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$MyHandler;-><init>(Landroid/os/Looper;Lcom/longcheer/sidebar/ui/view/IndicatorView;)V

    iput-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    const-class p2, Landroid/view/WindowManager;

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/WindowManager;

    iput-object p2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0c0037

    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicator:Landroid/view/View;

    new-instance p2, Landroid/content/res/Configuration;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    iput-object p2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateDimensions()V

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorWidth:I

    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorHeight:I

    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mMargin:I

    invoke-virtual {p0, v1, v0, v1, v0}, Landroid/widget/FrameLayout;->setPaddingRelative(IIII)V

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->initAnim()V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateStrokeWith(I)V

    return-void
.end method

.method private createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;
    .locals 7

    new-instance v6, Landroid/view/WindowManager$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x2

    const/16 v3, 0x7f6

    const/16 v4, 0x208

    const/4 v5, -0x3

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    iget v0, v6, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/high16 v1, 0x20000000

    or-int/2addr v0, v1

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {v0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->getAlignment()I

    move-result v0

    const v1, 0x7f120008

    const v2, 0x1030003

    if-nez v0, :cond_0

    iput v1, v6, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    goto :goto_0

    :cond_0
    iput v2, v6, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    :goto_0
    const v0, 0x800033

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {v0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->getAlignment()I

    move-result v0

    if-ne v0, v3, :cond_1

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMaxWindowX()I

    move-result v0

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMinWindowX()I

    move-result v0

    :goto_1
    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/utils/Position;->getPercentageY()F

    move-result v0

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    int-to-float v1, v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMinWindowY()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMinWindowY()I

    move-result v1

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMaxWindowY()I

    move-result v2

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    const-string v4, "IndicatorView"

    if-nez v0, :cond_3

    const-string v0, "createDefaultLayoutParams: ROTATION_0"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_3
    const/4 v5, 0x2

    if-ne v0, v3, :cond_4

    const-string v0, "createDefaultLayoutParams: ROTATION_90"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v1, v6, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMinWindowX()I

    move-result v0

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorHeight:I

    div-int/2addr v1, v5

    sub-int/2addr v0, v1

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    goto :goto_2

    :cond_4
    if-ne v0, v5, :cond_5

    const-string v0, "createDefaultLayoutParams: ROTATION_180"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_5
    const/4 v1, 0x3

    if-ne v0, v1, :cond_6

    const-string v0, "createDefaultLayoutParams: ROTATION_270"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v2, v6, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getMaxWindowX()I

    move-result v0

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getNavigationBarHeight()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorHeight:I

    div-int/2addr v1, v5

    sub-int/2addr v0, v1

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    :cond_6
    :goto_2
    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowWidth()I

    move-result v0

    iput v0, v6, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowHeight()I

    move-result p0

    iput p0, v6, Landroid/view/WindowManager$LayoutParams;->height:I

    return-object v6
.end method

.method private getNavigationBarHeight()I
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InternalInsetResource",
            "DiscouragedApi"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x10e00b8

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getNavigationBarHeight: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IndicatorView"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v0, :cond_0

    const-string v0, "dimen"

    const-string v1, "android"

    const-string v2, "navigation_bar_height"

    invoke-virtual {p0, v2, v0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private getSafeInset(Landroid/content/res/Configuration;Z)I
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_2

    :cond_1
    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mSafeInset:I

    :cond_2
    :goto_0
    return v0
.end method

.method private getWindowWidth()I
    .locals 1

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorWidth:I

    iget p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mMargin:I

    mul-int/lit8 p0, p0, 0x2

    add-int/2addr v0, p0

    return v0
.end method

.method private hideView()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing:Z

    iput-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->needHideView:Z

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    const-string p0, "IndicatorView"

    const-string v0, "hide: end"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private initAnim()V
    .locals 3

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    invoke-static {v0}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    new-instance v2, Lcom/longcheer/sidebar/ui/view/IndicatorView$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$$ExternalSyntheticLambda0;-><init>(Lcom/longcheer/sidebar/ui/view/IndicatorView;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v2, Lcom/longcheer/sidebar/ui/view/IndicatorView$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$$ExternalSyntheticLambda1;-><init>(Lcom/longcheer/sidebar/ui/view/IndicatorView;)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    filled-new-array {v1, v0}, [Landroid/animation/Animator;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v1, Lcom/longcheer/sidebar/ui/view/IndicatorView$1;

    invoke-direct {v1, p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$1;-><init>(Lcom/longcheer/sidebar/ui/view/IndicatorView;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3faa3d71    # 1.33f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3fe66666    # 1.8f
    .end array-data
.end method

.method private synthetic lambda$initAnim$0(Landroid/animation/ValueAnimator;)V
    .locals 2

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicatorWidth:I

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    mul-float/2addr v1, p1

    float-to-int p1, v1

    iput p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorWidth:I

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mCurrentLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0, p1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0, p1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$initAnim$1(Landroid/animation/ValueAnimator;)V
    .locals 2

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicatorHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    float-to-int p1, v1

    iput p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorHeight:I

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mCurrentLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0, p1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0, p1}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$setSystemGestureExclusion$2(Landroid/graphics/Rect;)V
    .locals 0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setSystemGestureExclusionRects(Ljava/util/List;)V

    return-void
.end method

.method private setConfigChangeLocation()V
    .locals 2

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mCurrentLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-void
.end method

.method private updateDimensions()V
    .locals 2

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateDisplaySizeWith(Landroid/view/WindowMetrics;)V

    const v1, 0x7f07027b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mMargin:I

    const v1, 0x7f070279

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicatorHeight:I

    const v1, 0x7f07027a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicatorWidth:I

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    if-nez v1, :cond_0

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicatorHeight:I

    iput v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorHeight:I

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorWidth:I

    :cond_0
    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    div-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->MIN_WINDOW_Y:I

    return-void
.end method

.method private updateDisplaySizeWith(Landroid/view/WindowMetrics;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    iput v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayWidth:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getWindowInsets()Landroid/view/WindowInsets;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    move-result v0

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mSafeInset:I

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    move-result p1

    iput p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mSafeInset:I

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    move-result v0

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mSafeInset:I

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    move-result p1

    iput p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mSafeInset:I

    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Display:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayWidth:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mSafeInset:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "IndicatorView"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private updateStrokeWith(I)V
    .locals 1

    and-int/lit8 p1, p1, 0x30

    const/16 v0, 0x20

    if-ne p1, v0, :cond_0

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicator:Landroid/view/View;

    const p1, 0x7f0800d5

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x10

    if-ne p1, v0, :cond_1

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mIndicator:Landroid/view/View;

    const p1, 0x7f0800d7

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getMaxWindowX()I
    .locals 3

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayWidth:I

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowWidth()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getSafeInset(Landroid/content/res/Configuration;Z)I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public getMaxWindowY()I
    .locals 3

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDisplayHeight:I

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->MIN_WINDOW_Y:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getSafeInset(Landroid/content/res/Configuration;Z)I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public getMinWindowX()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getMinWindowY()I
    .locals 3

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->MIN_WINDOW_Y:I

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getSafeInset(Landroid/content/res/Configuration;Z)I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public getWindowHeight()I
    .locals 0

    iget p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mTempIndicatorHeight:I

    return p0
.end method

.method public hide()V
    .locals 2

    const-string v0, "IndicatorView"

    const-string v1, "hide: start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isAnimation:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->needHideView:Z

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->hideView()V

    :cond_1
    :goto_0
    return-void
.end method

.method public isShowing()Z
    .locals 2

    iget-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->needHideView:Z

    if-eqz v0, :cond_0

    const-string v0, "IndicatorView"

    const-string v1, "isShowing: don\'t need hide"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->needHideView:Z

    :cond_0
    iget-boolean p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing:Z

    return p0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    const-string v0, "IndicatorView"

    const-string v1, "onConfigurationChanged: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v0, p1}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateDimensions()V

    iget v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mMargin:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v0, v1}, Landroid/widget/FrameLayout;->setPaddingRelative(IIII)V

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->setConfigChangeLocation()V

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateStrokeWith(I)V

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->setSystemGestureExclusion()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    float-to-int v1, v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onInterceptTouchEvent: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mSidebarState:"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IndicatorView"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const-wide/16 v3, 0xbb8

    const/4 v1, 0x1

    if-eqz p1, :cond_9

    if-eq p1, v1, :cond_8

    const/4 v5, 0x2

    const/4 v6, 0x3

    if-eq p1, v5, :cond_1

    if-eq p1, v6, :cond_0

    goto/16 :goto_1

    :cond_0
    const-string p0, "onTouchEvent: ACTION_CANCEL"

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_1
    const-string p1, "onInterceptTouchEvent: ACTION_MOVE"

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    if-ne p1, v1, :cond_b

    iget p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDownX:I

    sub-int/2addr v0, p1

    const/4 p1, 0x0

    const/4 v5, 0x5

    if-le v0, v5, :cond_2

    iget-object v7, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {v7}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->getAlignment()I

    move-result v7

    if-nez v7, :cond_2

    move v7, v1

    goto :goto_0

    :cond_2
    move v7, p1

    :goto_0
    const/4 v8, -0x5

    if-ge v0, v8, :cond_3

    iget-object v9, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {v9}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->getAlignment()I

    move-result v9

    if-ne v9, v1, :cond_3

    move p1, v1

    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "move disW="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ",isAnimation="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v10, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isAnimation:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_4
    iget-object v2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    iget-object v2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    if-ne v2, v1, :cond_6

    if-nez v7, :cond_5

    if-eqz p1, :cond_b

    :cond_5
    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->onSlide()V

    goto :goto_1

    :cond_6
    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    if-ne p1, v1, :cond_7

    if-le v0, v5, :cond_b

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->onSlide()V

    goto :goto_1

    :cond_7
    if-ne p1, v6, :cond_b

    if-ge v0, v8, :cond_b

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    invoke-interface {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;->onSlide()V

    goto :goto_1

    :cond_8
    const-string p0, "onTouchEvent: ACTION_UP"

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_9
    const-string p1, "onInterceptTouchEvent: ACTION_DOWN"

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mDownX:I

    iget p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    if-nez p1, :cond_b

    iput v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->state:I

    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result p1

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_a
    iget-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    iput-boolean v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isAnimation:Z

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateStrokeWith(I)V

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    :cond_b
    :goto_1
    return v1
.end method

.method public setPosition(Lcom/longcheer/sidebar/utils/Position;)V
    .locals 0

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    return-void
.end method

.method public setStateChangeListener(Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mStateChangeListener:Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;

    return-void
.end method

.method public setSystemGestureExclusion()V
    .locals 4

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowWidth()I

    move-result v1

    iget v2, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mMargin:I

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->getWindowHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v1, Lcom/longcheer/sidebar/ui/view/IndicatorView$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, v0}, Lcom/longcheer/sidebar/ui/view/IndicatorView$$ExternalSyntheticLambda2;-><init>(Lcom/longcheer/sidebar/ui/view/IndicatorView;Landroid/graphics/Rect;)V

    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public show(Lcom/longcheer/sidebar/utils/Position;)V
    .locals 2

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->updateDimensions()V

    new-instance p1, Landroid/content/res/Configuration;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mLastConfiguration:Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mCurrentLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0, p1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->createDefaultLayoutParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0, p1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    iput-boolean v0, p0, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing:Z

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->setSystemGestureExclusion()V

    const-string p0, "IndicatorView"

    const-string p1, "show: end"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
