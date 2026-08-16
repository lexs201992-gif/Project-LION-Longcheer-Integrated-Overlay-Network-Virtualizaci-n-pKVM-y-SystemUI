.class public Lcom/longcheer/sidebar/listener/ScreenListener;
.super Ljava/lang/Object;
.source "ScreenListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;,
        Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mScreenReceiver:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;

.field private mScreenStateListener:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;


# direct methods
.method static bridge synthetic -$$Nest$fgetmScreenStateListener(Lcom/longcheer/sidebar/listener/ScreenListener;)Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mScreenStateListener:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;-><init>(Lcom/longcheer/sidebar/listener/ScreenListener;Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver-IA;)V

    iput-object p1, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mScreenReceiver:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;

    return-void
.end method

.method private registerListener()V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mScreenReceiver:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public begin(Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mScreenStateListener:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenStateListener;

    invoke-direct {p0}, Lcom/longcheer/sidebar/listener/ScreenListener;->registerListener()V

    return-void
.end method

.method public unregisterListener()V
    .locals 1

    iget-object v0, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/longcheer/sidebar/listener/ScreenListener;->mScreenReceiver:Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method
