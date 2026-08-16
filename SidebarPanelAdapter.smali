.class public Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SidebarPanelAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;,
        Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$OnItemClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mIconWidthHeight:I

.field private mItemPadding:I

.field private final mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/longcheer/sidebar/data/SidebarShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private onItemClickListener:Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$OnItemClickListener;


# direct methods
.method public static synthetic $r8$lambda$6Tzi2Oa6FAxi0JA60hEWCJPUvIQ(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;ILandroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->lambda$onBindViewHolder$0(ILandroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmItemPadding(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;)I
    .locals 0

    iget p0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mItemPadding:I

    return p0
.end method

.method public constructor <init>(Ljava/util/List;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/longcheer/sidebar/data/SidebarShortcutInfo;",
            ">;II)V"
        }
    .end annotation

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mList:Ljava/util/List;

    iput p2, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mIconWidthHeight:I

    iput p3, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mItemPadding:I

    return-void
.end method

.method private synthetic lambda$onBindViewHolder$0(ILandroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/longcheer/sidebar/data/SidebarShortcutInfo;

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->onItemClickListener:Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$OnItemClickListener;

    invoke-interface {p0, p2, p1}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$OnItemClickListener;->onItemClick(Landroid/view/View;Lcom/longcheer/sidebar/data/SidebarShortcutInfo;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    iget-object p0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mList:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    check-cast p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->onBindViewHolder(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;I)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    iget-object v0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/longcheer/sidebar/data/SidebarShortcutInfo;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/data/SidebarShortcutInfo;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->icon:Landroid/view/View;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/data/SidebarShortcutInfo;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    iget-object v1, p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->text:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/longcheer/sidebar/data/SidebarShortcutInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    :cond_1
    iget-object v2, p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->text:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v0}, Lcom/longcheer/sidebar/data/SidebarShortcutInfo;->getColor()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    :goto_0
    iget v0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mIconWidthHeight:I

    invoke-virtual {p1, v0, p2}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->updateIconWidthHeight(II)V

    iget v0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mItemPadding:I

    invoke-virtual {p1, v0}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->updateItemPadding(I)V

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;

    move-result-object p0

    return-object p0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;
    .locals 2

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0c0076

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;-><init>(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public bridge synthetic onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    check-cast p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;

    invoke-virtual {p0, p1}, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->onViewRecycled(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    iget-object p0, p1, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$ViewHolder;->icon:Landroid/view/View;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {p0}, Lcom/longcheer/sidebar/utils/SidebarUtils;->recycleBitmapDrawable(Landroid/graphics/drawable/BitmapDrawable;)V

    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->onItemClickListener:Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter$OnItemClickListener;

    return-void
.end method

.method public updateDimensions(II)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateDimensions: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mIconWidthHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mItemPadding:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SidebarPanelAdapter"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mIconWidthHeight:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mIconWidthHeight:I

    :cond_0
    iget p1, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mItemPadding:I

    if-eq p1, p2, :cond_1

    iput p2, p0, Lcom/longcheer/sidebar/ui/adapter/SidebarPanelAdapter;->mItemPadding:I

    :cond_1
    return-void
.end method
