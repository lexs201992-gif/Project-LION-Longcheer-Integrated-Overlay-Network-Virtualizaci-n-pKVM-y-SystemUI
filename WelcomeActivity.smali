.class public Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;
.super Lcom/longcheer/sidebar/ui/activity/BaseActivity;
.source "WelcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;
    }
.end annotation


# instance fields
.field private instance:Lcom/longcheer/sidebar/data/SidebarServiceManager;

.field private lv:Lcom/airbnb/lottie/LottieAnimationView;

.field private model:Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

.field private final observer:Landroidx/lifecycle/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/Observer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$XrZEZPKlFLEa05ip9xfR-EIz4bg(Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->lambda$onCreate$1(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$rePMHeyRri0NJYBQzdCEP6L4i_I(Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->lambda$new$0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/activity/BaseActivity;-><init>()V

    new-instance v0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda3;-><init>(Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->observer:Landroidx/lifecycle/Observer;

    return-void
.end method

.method private getAlertWindowPermission()V
    .locals 2

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "WelcomeActivity"

    const-string v0, "getAlertWindowPermission: has permission"

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$new$0(Ljava/lang/Boolean;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sidebar service enabled: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WelcomeActivity"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->getInstance()Lcom/longcheer/sidebar/data/SidebarServiceManager;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->setEnable(Z)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->instance:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    invoke-virtual {p1}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->instance:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->startService()V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->instance:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->stopService()V

    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic lambda$onCreate$1(Landroid/widget/CompoundButton;Z)V
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->model:Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    new-instance p1, Landroidx/lifecycle/MutableLiveData;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;->setSidebarEnabled(Landroidx/lifecycle/MutableLiveData;)V

    return-void
.end method


# virtual methods
.method public onClickBack(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onClickSettings(Landroid/view/View;)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/longcheer/sidebar/ui/activity/SettingsActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onClickTryItOut(Landroid/view/View;)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/longcheer/sidebar/ui/activity/TryItOutActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingInflatedId"
        }
    .end annotation

    invoke-super {p0, p1}, Lcom/longcheer/sidebar/ui/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c001e

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    invoke-static {}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->getInstance()Lcom/longcheer/sidebar/data/SidebarServiceManager;

    move-result-object p1

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->instance:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    new-instance p1, Landroidx/lifecycle/ViewModelProvider;

    invoke-direct {p1, p0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    check-cast p1, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->model:Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    invoke-virtual {p1}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;->getSidebarEnabled()Landroidx/lifecycle/MutableLiveData;

    move-result-object p1

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->observer:Landroidx/lifecycle/Observer;

    invoke-virtual {p1, p0, v0}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    const p1, 0x7f0900fa

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->lv:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    const p1, 0x7f0901aa

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->model:Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    invoke-virtual {v1}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;->getSidebarEnabled()Landroidx/lifecycle/MutableLiveData;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    new-instance v1, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda0;-><init>(Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const v1, 0x7f09019b

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda1;-><init>(Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f090202

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$$ExternalSyntheticLambda2;-><init>(Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->getAlertWindowPermission()V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v1, "need_open"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreate: need_open="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "WelcomeActivity"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :cond_0

    if-nez v0, :cond_0

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/widget/Switch;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->model:Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;->getSidebarEnabled()Landroidx/lifecycle/MutableLiveData;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroidx/lifecycle/LiveData;->removeObservers(Landroidx/lifecycle/LifecycleOwner;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->model:Lcom/longcheer/sidebar/ui/activity/WelcomeActivity$MyViewModel;

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->lv:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/activity/WelcomeActivity;->lv:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    return-void
.end method
