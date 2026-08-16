.class public Lcom/longcheer/sidebar/service/SidebarService;
.super Landroid/app/Service;
.source "SidebarService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/longcheer/sidebar/service/SidebarService$MyHandler;,
        Lcom/longcheer/sidebar/service/SidebarService$MyBinder;
    }
.end annotation


# instance fields
.field private keyguardManager:Landroid/app/KeyguardManager;

.field private final mHandler:Landroid/os/Handler;

.field private screenListener:Lcom/longcheer/sidebar/listener/ScreenListener;

.field private sidebarController:Lcom/longcheer/sidebar/controller/SidebarController;


# direct methods
.method static bridge synthetic -$$Nest$fgetkeyguardManager(Lcom/longcheer/sidebar/service/SidebarService;)Landroid/app/KeyguardManager;
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/service/SidebarService;->keyguardManager:Landroid/app/KeyguardManager;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmHandler(Lcom/longcheer/sidebar/service/SidebarService;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/service/SidebarService;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mdisable(Lcom/longcheer/sidebar/service/SidebarService;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/longcheer/sidebar/service/SidebarService;->disable(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhide(Lcom/longcheer/sidebar/service/SidebarService;)V
    .locals 0

    invoke-direct {p0}, Lcom/longcheer/sidebar/service/SidebarService;->hide()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshow(Lcom/longcheer/sidebar/service/SidebarService;)V
    .locals 0

    invoke-direct {p0}, Lcom/longcheer/sidebar/service/SidebarService;->show()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Lcom/longcheer/sidebar/service/SidebarService$MyHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/longcheer/sidebar/service/SidebarService$MyHandler;-><init>(Landroid/os/Looper;Lcom/longcheer/sidebar/service/SidebarService;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/service/SidebarService;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private disable(Z)V
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/service/SidebarService;->sidebarController:Lcom/longcheer/sidebar/controller/SidebarController;

    invoke-virtual {p0, p1}, Lcom/longcheer/sidebar/controller/SidebarController;->disable(Z)V

    return-void
.end method

.method private hide()V
    .locals 2

    const-string v0, "SidebarService"

    const-string v1, "hiding"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p0, p0, Lcom/longcheer/sidebar/service/SidebarService;->sidebarController:Lcom/longcheer/sidebar/controller/SidebarController;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->hide()V

    return-void
.end method

.method private show()V
    .locals 2

    const-string v0, "SidebarService"

    const-string v1, "showing"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p0, p0, Lcom/longcheer/sidebar/service/SidebarService;->sidebarController:Lcom/longcheer/sidebar/controller/SidebarController;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/controller/SidebarController;->show()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    iget-object p1, p0, Lcom/longcheer/sidebar/service/SidebarService;->keyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {p1}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onBind: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SidebarService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/longcheer/sidebar/service/SidebarService;->show()V

    :cond_0
    new-instance p1, Lcom/longcheer/sidebar/service/SidebarService$MyBinder;

    invoke-direct {p1, p0}, Lcom/longcheer/sidebar/service/SidebarService$MyBinder;-><init>(Lcom/longcheer/sidebar/service/SidebarService;)V

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    const-string v0, "SidebarService"

    const-string v1, "onCreate: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-string v0, "keyguard"

    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    iput-object v0, p0, Lcom/longcheer/sidebar/service/SidebarService;->keyguardManager:Landroid/app/KeyguardManager;

    new-instance v0, Lcom/longcheer/sidebar/controller/SidebarController;

    invoke-direct {v0, p0}, Lcom/longcheer/sidebar/controller/SidebarController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/service/SidebarService;->sidebarController:Lcom/longcheer/sidebar/controller/SidebarController;

    new-instance v0, Lcom/longcheer/sidebar/listener/ScreenListener;

    invoke-direct {v0, p0}, Lcom/longcheer/sidebar/listener/ScreenListener;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/service/SidebarService;->screenListener:Lcom/longcheer/sidebar/listener/ScreenListener;

    new-instance v1, Lcom/longcheer/sidebar/service/SidebarService$1;

    invoke-direct {v1, p0}, Lcom/longcheer/sidebar/service/SidebarService$1;-><init>(Lcom/longcheer/sidebar/service/SidebarService;)V

    invoke-virtual {v0, v1}, Lcom/longcheer/sidebar/listener/ScreenListener;->begin(Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    const-string v0, "SidebarService"

    const-string v1, "onDestroy: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/longcheer/sidebar/service/SidebarService;->sidebarController:Lcom/longcheer/sidebar/controller/SidebarController;

    iget-object v1, p0, Lcom/longcheer/sidebar/service/SidebarService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/longcheer/sidebar/service/SidebarService;->screenListener:Lcom/longcheer/sidebar/listener/ScreenListener;

    invoke-virtual {v1}, Lcom/longcheer/sidebar/listener/ScreenListener;->unregisterListener()V

    iput-object v0, p0, Lcom/longcheer/sidebar/service/SidebarService;->screenListener:Lcom/longcheer/sidebar/listener/ScreenListener;

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const-string v0, "SidebarService"

    const-string v1, "onStartCommand: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p0

    return p0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2

    const-string v0, "SidebarService"

    const-string v1, "onUnbind: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/longcheer/sidebar/service/SidebarService;->hide()V

    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method
