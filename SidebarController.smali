.class public Lcom/longcheer/sidebar/controller/SidebarController;
.super Ljava/lang/Object;
.source "SidebarController.java"

# interfaces
.implements Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;
.implements Lcom/longcheer/sidebar/ui/view/SidebarPanelView$onPanelChangeListener;


# instance fields
.field private isDisablePanel:Z

.field private mAlignment:I

.field private final mContext:Landroid/content/Context;

.field private mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

.field private mPosition:Lcom/longcheer/sidebar/utils/Position;

.field private mSidebarPanelView:Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

.field private tipsView:Lcom/longcheer/sidebar/ui/view/TipsView;

.field private vibratorManager:Landroid/os/VibratorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/controller/SidebarController;->getPosition(Landroid/content/Context;)Lcom/longcheer/sidebar/utils/Position;

    move-result-object v0

    iput-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/utils/Position;->getPercentageX()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/longcheer/sidebar/controller/SidebarController;->transformToAlignment(F)I

    move-result v0

    iput v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mAlignment:I

    new-instance v0, Lcom/longcheer/sidebar/ui/view/IndicatorView;

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    invoke-direct {v0, p1, v1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;-><init>(Landroid/content/Context;Lcom/longcheer/sidebar/utils/Position;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

    invoke-virtual {v0, p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->setStateChangeListener(Lcom/longcheer/sidebar/ui/view/IndicatorView$StateChangeListener;)V

    new-instance v0, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    invoke-direct {v0, p1, v1, v2}, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/longcheer/sidebar/utils/Position;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mSidebarPanelView:Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

    invoke-virtual {v0, p0}, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;->setOnPanelChangeListener(Lcom/longcheer/sidebar/ui/view/SidebarPanelView$onPanelChangeListener;)V

    const-string v0, "sidebar_settings,vibrator"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/longcheer/sidebar/utils/Prefs;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "vibrator_manager"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/VibratorManager;

    iput-object p1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->vibratorManager:Landroid/os/VibratorManager;

    :cond_0
    return-void
.end method

.method private getPosition(Landroid/content/Context;)Lcom/longcheer/sidebar/utils/Position;
    .locals 1

    const-string p0, "sidebar_menu,position"

    const/4 v0, 0x0

    invoke-static {p1, p0, v0}, Lcom/longcheer/sidebar/utils/Prefs;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p0, Lcom/longcheer/sidebar/utils/Position;

    const/high16 p1, 0x3f800000    # 1.0f

    const v0, 0x3dcccccd    # 0.1f

    invoke-direct {p0, p1, v0}, Lcom/longcheer/sidebar/utils/Position;-><init>(FF)V

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/longcheer/sidebar/utils/Position;->fromString(Ljava/lang/String;)Lcom/longcheer/sidebar/utils/Position;

    move-result-object p0

    return-object p0
.end method

.method private isIndicatorShowing()Z
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->isShowing()Z

    move-result p0

    return p0
.end method

.method private isPanelShowing()Z
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mSidebarPanelView:Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;->isShowing()Z

    move-result p0

    return p0
.end method

.method private savePosition(Landroid/content/Context;Lcom/longcheer/sidebar/utils/Position;)V
    .locals 1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "savePosition:"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "SidebarController"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p0, "sidebar_menu,position"

    invoke-virtual {p2}, Lcom/longcheer/sidebar/utils/Position;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lcom/longcheer/sidebar/utils/Prefs;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public disable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->isDisablePanel:Z

    return-void
.end method

.method public getAlignment()I
    .locals 0

    iget p0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mAlignment:I

    return p0
.end method

.method public hide()V
    .locals 2

    const-string v0, "SidebarController"

    const-string v1, "hide: start"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->isIndicatorShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->hide()V

    :cond_0
    invoke-direct {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->isPanelShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mSidebarPanelView:Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;->hide()V

    :cond_1
    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->tipsView:Lcom/longcheer/sidebar/ui/view/TipsView;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/longcheer/sidebar/ui/view/TipsView;->hide()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->tipsView:Lcom/longcheer/sidebar/ui/view/TipsView;

    :cond_2
    return-void
.end method

.method public onDragEnd(Lcom/longcheer/sidebar/utils/Position;)V
    .locals 2

    const-string v0, "SidebarController"

    const-string v1, "onDragEnd"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

    invoke-virtual {v0, p1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->setPosition(Lcom/longcheer/sidebar/utils/Position;)V

    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0, p1}, Lcom/longcheer/sidebar/controller/SidebarController;->savePosition(Landroid/content/Context;Lcom/longcheer/sidebar/utils/Position;)V

    return-void
.end method

.method public onSlide()V
    .locals 6

    invoke-static {}, Lcom/longcheer/sidebar/data/ShortcutRepository;->loadSelectedShortcuts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    const-class v2, Lcom/longcheer/sidebar/ui/activity/ShortcutSelectActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_0
    iget-boolean v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->isDisablePanel:Z

    if-eqz v1, :cond_1

    const-string p0, "SidebarController"

    const-string v0, "onSlide: disable show panel"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->isPanelShowing()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    const-string v2, "sidebar_settings,vibrator"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/longcheer/sidebar/utils/Prefs;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->vibratorManager:Landroid/os/VibratorManager;

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    const-string v2, "vibrator_manager"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/VibratorManager;

    iput-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->vibratorManager:Landroid/os/VibratorManager;

    :cond_2
    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->vibratorManager:Landroid/os/VibratorManager;

    const-wide/16 v4, 0x64

    const/4 v2, -0x1

    invoke-static {v4, v5, v2}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object v2

    invoke-static {v2}, Landroid/os/CombinedVibration;->createParallel(Landroid/os/VibrationEffect;)Landroid/os/CombinedVibration;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/VibratorManager;->vibrate(Landroid/os/CombinedVibration;)V

    :cond_3
    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mSidebarPanelView:Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

    invoke-virtual {v1, v0}, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;->setShortcuts(Ljava/util/List;)V

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mSidebarPanelView:Lcom/longcheer/sidebar/ui/view/SidebarPanelView;

    invoke-virtual {v1}, Lcom/longcheer/sidebar/ui/view/SidebarPanelView;->show()V

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

    invoke-virtual {v1}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->hide()V

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    const-string v2, "sidebar_tips_init"

    invoke-static {v1, v2, v3}, Lcom/longcheer/sidebar/utils/Prefs;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x1

    if-ne v1, v3, :cond_5

    new-instance v1, Lcom/longcheer/sidebar/ui/view/TipsView;

    iget-object v4, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v1, v4, v0}, Lcom/longcheer/sidebar/ui/view/TipsView;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->tipsView:Lcom/longcheer/sidebar/ui/view/TipsView;

    invoke-virtual {v1}, Lcom/longcheer/sidebar/ui/view/TipsView;->show()V

    iget-object p0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mContext:Landroid/content/Context;

    invoke-static {p0, v2, v3}, Lcom/longcheer/sidebar/utils/Prefs;->putBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->tipsView:Lcom/longcheer/sidebar/ui/view/TipsView;

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->tipsView:Lcom/longcheer/sidebar/ui/view/TipsView;

    :cond_5
    :goto_0
    return-void
.end method

.method public packUp()V
    .locals 0

    invoke-virtual {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->show()V

    return-void
.end method

.method public setAlignment(F)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/longcheer/sidebar/controller/SidebarController;->transformToAlignment(F)I

    move-result p1

    iput p1, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mAlignment:I

    return-void
.end method

.method public show()V
    .locals 2

    const-string v0, "show: start"

    const-string v1, "SidebarController"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->isIndicatorShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "show: is showing"

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mIndicatorView:Lcom/longcheer/sidebar/ui/view/IndicatorView;

    iget-object p0, p0, Lcom/longcheer/sidebar/controller/SidebarController;->mPosition:Lcom/longcheer/sidebar/utils/Position;

    invoke-virtual {v0, p0}, Lcom/longcheer/sidebar/ui/view/IndicatorView;->show(Lcom/longcheer/sidebar/utils/Position;)V

    return-void
.end method

.method public transformToAlignment(F)I
    .locals 0

    const/high16 p0, 0x3f000000    # 0.5f

    cmpg-float p0, p1, p0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    :goto_0
    return p0
.end method
