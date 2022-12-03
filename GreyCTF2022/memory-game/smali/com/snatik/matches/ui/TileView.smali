.class public Lcom/snatik/matches/ui/TileView;
.super Landroid/widget/FrameLayout;
.source "TileView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/snatik/matches/ui/TileView$FlipAnimation;
    }
.end annotation


# instance fields
.field private mFlippedDown:Z

.field private mTileImage:Landroid/widget/ImageView;

.field private mTopImage:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0}, Lcom/snatik/matches/ui/TileView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/snatik/matches/ui/TileView;->mFlippedDown:Z

    return-void
.end method

.method private flip()V
    .locals 3

    .line 60
    new-instance v0, Lcom/snatik/matches/ui/TileView$FlipAnimation;

    iget-object v1, p0, Lcom/snatik/matches/ui/TileView;->mTopImage:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/snatik/matches/ui/TileView;->mTileImage:Landroid/widget/ImageView;

    invoke-direct {v0, p0, v1, v2}, Lcom/snatik/matches/ui/TileView$FlipAnimation;-><init>(Lcom/snatik/matches/ui/TileView;Landroid/view/View;Landroid/view/View;)V

    .line 61
    iget-object v1, p0, Lcom/snatik/matches/ui/TileView;->mTopImage:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 62
    invoke-virtual {v0}, Lcom/snatik/matches/ui/TileView$FlipAnimation;->reverse()V

    .line 64
    :cond_0
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/TileView;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public static fromXml(Landroid/content/Context;Landroid/view/ViewGroup;)Lcom/snatik/matches/ui/TileView;
    .locals 2

    .line 35
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f09002f

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/snatik/matches/ui/TileView;

    return-object p0
.end method


# virtual methods
.method public flipDown()V
    .locals 1

    const/4 v0, 0x1

    .line 55
    iput-boolean v0, p0, Lcom/snatik/matches/ui/TileView;->mFlippedDown:Z

    .line 56
    invoke-direct {p0}, Lcom/snatik/matches/ui/TileView;->flip()V

    return-void
.end method

.method public flipUp()V
    .locals 1

    const/4 v0, 0x0

    .line 50
    iput-boolean v0, p0, Lcom/snatik/matches/ui/TileView;->mFlippedDown:Z

    .line 51
    invoke-direct {p0}, Lcom/snatik/matches/ui/TileView;->flip()V

    return-void
.end method

.method public isFlippedDown()Z
    .locals 1

    .line 68
    iget-boolean v0, p0, Lcom/snatik/matches/ui/TileView;->mFlippedDown:Z

    return v0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 40
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    const v0, 0x7f070047

    .line 41
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/TileView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/snatik/matches/ui/TileView;->mTopImage:Landroid/widget/RelativeLayout;

    const v0, 0x7f070046

    .line 42
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/TileView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/snatik/matches/ui/TileView;->mTileImage:Landroid/widget/ImageView;

    return-void
.end method

.method public setTileImage(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/snatik/matches/ui/TileView;->mTileImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
