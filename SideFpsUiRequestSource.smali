.class public final enum Lcom/android/systemui/biometrics/SideFpsUiRequestSource;
.super Ljava/lang/Enum;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"


# static fields
.field public static final synthetic $VALUES:[Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

.field public static final enum ALTERNATE_BOUNCER:Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

.field public static final enum AUTO_SHOW:Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

.field public static final enum PRIMARY_BOUNCER:Lcom/android/systemui/biometrics/SideFpsUiRequestSource;


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    const-string v1, "AUTO_SHOW"

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;->AUTO_SHOW:Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    new-instance v1, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    const-string v2, "PRIMARY_BOUNCER"

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;-><init>(ILjava/lang/String;)V

    sput-object v1, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;->PRIMARY_BOUNCER:Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    new-instance v2, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    const-string v3, "ALTERNATE_BOUNCER"

    const/4 v4, 0x2

    invoke-direct {v2, v4, v3}, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;-><init>(ILjava/lang/String;)V

    sput-object v2, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;->ALTERNATE_BOUNCER:Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    filled-new-array {v0, v1, v2}, [Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;->$VALUES:[Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p2, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/systemui/biometrics/SideFpsUiRequestSource;
    .locals 1

    const-class v0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    return-object p0
.end method

.method public static values()[Lcom/android/systemui/biometrics/SideFpsUiRequestSource;
    .locals 1

    sget-object v0, Lcom/android/systemui/biometrics/SideFpsUiRequestSource;->$VALUES:[Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/systemui/biometrics/SideFpsUiRequestSource;

    return-object v0
.end method
