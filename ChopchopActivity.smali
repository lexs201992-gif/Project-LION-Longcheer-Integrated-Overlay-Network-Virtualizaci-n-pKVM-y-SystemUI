.class public Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;
.super Lcom/ts/tsgestures/ui/BaseActivity;
.source "ChopchopActivity.java"


# instance fields
.field private cameraManager:Landroid/hardware/camera2/CameraManager;

.field private lv:Lcom/airbnb/lottie/LottieAnimationView;


# direct methods
.method public static synthetic $r8$lambda$Kwgi1bgw8ll3tRR3hA8K8bc3v-s(Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->onClickSettings(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$j6IV9BbDFQBkib8AIdAViDFJhSA(Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->onClickTryItOut(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$su0W4oZ1hIJt4ZPoLin2CcG5ga4(Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->lambda$onCreate$0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/ts/tsgestures/ui/BaseActivity;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCreate$0(Landroid/widget/CompoundButton;Z)V
    .locals 2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCreate: isChecked = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Chop_Chop"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "enable_vibrator"

    invoke-static {p0, p1, p2}, Lcom/ts/tsgestures/utils/Prefs;->putBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    xor-int/lit8 v0, p2, 0x1

    const-string v1, "fast_flashlight"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    if-nez p2, :cond_0

    :try_start_0
    iget-object p0, p0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->cameraManager:Landroid/hardware/camera2/CameraManager;

    const-string p1, "0"

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CameraManager;->setTorchMode(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private onClickSettings(Landroid/view/View;)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/ts/tsgestures/ui/chopchop/SettingsActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private onClickTryItOut(Landroid/view/View;)V
    .locals 2

    :try_start_0
    iget-object p1, p0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->cameraManager:Landroid/hardware/camera2/CameraManager;

    const-string v0, "0"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CameraManager;->setTorchMode(Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    :goto_0
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/ts/tsgestures/ui/chopchop/TryItOutActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/ts/tsgestures/ui/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001d

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    const p1, 0x7f0801e6

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    const v0, 0x7f070075

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setNavigationIcon(I)V

    const v0, 0x7f07008c

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setOverflowIcon(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    const p1, 0x7f0800fa

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object p1, p0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->lv:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setRepeatCount(I)V

    const p1, 0x7f080077

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "fast_flashlight"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const-string v1, "enable_vibrator"

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {p0, v1, v0}, Lcom/ts/tsgestures/utils/Prefs;->putBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0

    :cond_0
    invoke-static {p0, v1, v2}, Lcom/ts/tsgestures/utils/Prefs;->putBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    invoke-virtual {p1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    :goto_0
    const-string v0, "camera"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    iput-object v0, p0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->cameraManager:Landroid/hardware/camera2/CameraManager;

    new-instance v0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity$$ExternalSyntheticLambda0;-><init>(Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const p1, 0x7f080192

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    new-instance v0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity$$ExternalSyntheticLambda1;-><init>(Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0801f2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    new-instance v0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity$$ExternalSyntheticLambda2;-><init>(Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    const p0, 0x7f100041

    const/4 v0, 0x1

    invoke-interface {p1, v0, v0, v0, p0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    const/4 p0, 0x2

    const v1, 0x7f100095

    invoke-interface {p1, v0, p0, p0, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->onBackPressed()V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v2, :cond_1

    invoke-virtual {p0}, Lcom/ts/tsgestures/ui/BaseActivity;->showLiceseDialog()V

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    invoke-virtual {p0}, Lcom/ts/tsgestures/ui/BaseActivity;->openPrivacyLink()V

    :cond_2
    :goto_0
    return v2
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    iget-object p0, p0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->lv:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    iget-object p0, p0, Lcom/ts/tsgestures/ui/chopchop/ChopchopActivity;->lv:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    return-void
.end method
