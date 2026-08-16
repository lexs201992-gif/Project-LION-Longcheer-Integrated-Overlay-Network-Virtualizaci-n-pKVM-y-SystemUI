.class public Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;
.super Lcom/ts/tsgestures/ui/BaseActivity;
.source "OperateSuccessActivity.java"


# direct methods
.method public static synthetic $r8$lambda$7IDbS0tXt_cSIhHwo-y0VpE_kaM(Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;->lambda$onCreate$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$QT_nMtUQgL9XmVHPRoL-QvxKMg8(Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;->lambda$onCreate$0(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/ts/tsgestures/ui/BaseActivity;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;->onBackPressed()V

    return-void
.end method

.method private synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;->onBackPressed()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/ts/tsgestures/ui/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001e

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    const p1, 0x7f0800bd

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    new-instance v0, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity$$ExternalSyntheticLambda0;-><init>(Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0801f4

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    new-instance v0, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity$$ExternalSyntheticLambda1;-><init>(Lcom/ts/tsgestures/ui/threefinger/OperateSuccessActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
