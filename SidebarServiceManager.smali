.class public Lcom/longcheer/sidebar/data/SidebarServiceManager;
.super Ljava/lang/Object;
.source "SidebarServiceManager.java"


# static fields
.field private static volatile INSTANCE:Lcom/longcheer/sidebar/data/SidebarServiceManager;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private final connection:Landroid/content/ServiceConnection;

.field private isBind:Z

.field private mContext:Landroid/content/Context;

.field private mSidebarManager:Lcom/longcheer/sidebar/data/ISidebarManager;


# direct methods
.method static bridge synthetic -$$Nest$fputisBind(Lcom/longcheer/sidebar/data/SidebarServiceManager;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmSidebarManager(Lcom/longcheer/sidebar/data/SidebarServiceManager;Lcom/longcheer/sidebar/data/ISidebarManager;)V
    .locals 0

    iput-object p1, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mSidebarManager:Lcom/longcheer/sidebar/data/ISidebarManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/longcheer/sidebar/data/SidebarServiceManager$1;

    invoke-direct {v0, p0}, Lcom/longcheer/sidebar/data/SidebarServiceManager$1;-><init>(Lcom/longcheer/sidebar/data/SidebarServiceManager;)V

    iput-object v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->connection:Landroid/content/ServiceConnection;

    return-void
.end method

.method public static getInstance()Lcom/longcheer/sidebar/data/SidebarServiceManager;
    .locals 2

    sget-object v0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->INSTANCE:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/longcheer/sidebar/data/SidebarServiceManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/longcheer/sidebar/data/SidebarServiceManager;->INSTANCE:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/longcheer/sidebar/data/SidebarServiceManager;

    invoke-direct {v1}, Lcom/longcheer/sidebar/data/SidebarServiceManager;-><init>()V

    sput-object v1, Lcom/longcheer/sidebar/data/SidebarServiceManager;->INSTANCE:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->INSTANCE:Lcom/longcheer/sidebar/data/SidebarServiceManager;

    return-object v0
.end method


# virtual methods
.method public disablePanel(Z)V
    .locals 1

    :try_start_0
    iget-boolean v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mSidebarManager:Lcom/longcheer/sidebar/data/ISidebarManager;

    invoke-interface {p0, p1}, Lcom/longcheer/sidebar/data/ISidebarManager;->disablePanel(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "SidebarServiceManager"

    const-string p1, "disablePanel: disablePanel failed"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public getEnable()Z
    .locals 2

    iget-object p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    const-string v0, "sidebar_key"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/longcheer/sidebar/utils/Prefs;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public hideSidebar()V
    .locals 1

    :try_start_0
    iget-boolean v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mSidebarManager:Lcom/longcheer/sidebar/data/ISidebarManager;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/longcheer/sidebar/data/ISidebarManager;->showSidebar(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "SidebarServiceManager"

    const-string v0, "hideSidebar: hideSidebar failed!"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->getEnable()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/longcheer/sidebar/data/SidebarServiceManager;->startService()V

    :cond_0
    return-void
.end method

.method public isBind()Z
    .locals 0

    iget-boolean p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    return p0
.end method

.method public setEnable(Z)V
    .locals 1

    iget-object p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    const-string v0, "sidebar_key"

    invoke-static {p0, v0, p1}, Lcom/longcheer/sidebar/utils/Prefs;->putBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method public showSidebar()V
    .locals 1

    :try_start_0
    iget-boolean v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mSidebarManager:Lcom/longcheer/sidebar/data/ISidebarManager;

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lcom/longcheer/sidebar/data/ISidebarManager;->showSidebar(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "SidebarServiceManager"

    const-string v0, "showSidebar: showSidebar failed!"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public startService()V
    .locals 3

    const-string v0, "SidebarServiceManager"

    const-string v1, "starting sidebar service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    const-class v2, Lcom/longcheer/sidebar/service/SidebarService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->connection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public stopService()V
    .locals 2

    iget-boolean v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    if-eqz v0, :cond_0

    const-string v0, "SidebarServiceManager"

    const-string v1, "stopping sidebar service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->connection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/longcheer/sidebar/data/SidebarServiceManager;->isBind:Z

    :cond_0
    return-void
.end method
