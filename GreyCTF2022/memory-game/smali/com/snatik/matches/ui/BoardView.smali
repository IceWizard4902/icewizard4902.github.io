.class public Lcom/snatik/matches/ui/BoardView;
.super Landroid/widget/LinearLayout;
.source "BoardView.java"


# instance fields
.field private flippedUp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mBoardArrangment:Lcom/snatik/matches/model/BoardArrangment;

.field private mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

.field private mLocked:Z

.field private mRowLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field private mScreenHeight:I

.field private mScreenWidth:I

.field private mSize:I

.field private mTileLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

.field private mViewReference:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/snatik/matches/ui/TileView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, v0}, Lcom/snatik/matches/ui/BoardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 49
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 v0, -0x2

    invoke-direct {p1, p2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object p1, p0, Lcom/snatik/matches/ui/BoardView;->mRowLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 40
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/snatik/matches/ui/BoardView;->flippedUp:Ljava/util/List;

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/snatik/matches/ui/BoardView;->mLocked:Z

    const/4 p2, 0x1

    .line 50
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/BoardView;->setOrientation(I)V

    const/16 p2, 0x11

    .line 51
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/BoardView;->setGravity(I)V

    .line 52
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f050065

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 53
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f05004b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 54
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int/2addr v1, p2

    mul-int/lit8 v0, v0, 0x2

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/snatik/matches/ui/BoardView;->mScreenHeight:I

    .line 55
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr p2, v0

    const/16 v0, 0x14

    invoke-static {v0}, Lcom/snatik/matches/utils/Utils;->px(I)I

    move-result v0

    sub-int/2addr p2, v0

    iput p2, p0, Lcom/snatik/matches/ui/BoardView;->mScreenWidth:I

    .line 56
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/snatik/matches/ui/BoardView;->mViewReference:Ljava/util/Map;

    .line 57
    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/BoardView;->setClipToPadding(Z)V

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/ui/BoardView;)I
    .locals 0

    .line 31
    iget p0, p0, Lcom/snatik/matches/ui/BoardView;->mSize:I

    return p0
.end method

.method static synthetic access$100(Lcom/snatik/matches/ui/BoardView;)Lcom/snatik/matches/model/BoardArrangment;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/snatik/matches/ui/BoardView;->mBoardArrangment:Lcom/snatik/matches/model/BoardArrangment;

    return-object p0
.end method

.method static synthetic access$200(Lcom/snatik/matches/ui/BoardView;)Z
    .locals 0

    .line 31
    iget-boolean p0, p0, Lcom/snatik/matches/ui/BoardView;->mLocked:Z

    return p0
.end method

.method static synthetic access$202(Lcom/snatik/matches/ui/BoardView;Z)Z
    .locals 0

    .line 31
    iput-boolean p1, p0, Lcom/snatik/matches/ui/BoardView;->mLocked:Z

    return p1
.end method

.method static synthetic access$300(Lcom/snatik/matches/ui/BoardView;)Ljava/util/List;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/snatik/matches/ui/BoardView;->flippedUp:Ljava/util/List;

    return-object p0
.end method

.method private addBoardRow(I)V
    .locals 4

    .line 106
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x11

    .line 108
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v2, 0x0

    .line 110
    :goto_0
    iget-object v3, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v3, v3, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    if-ge v2, v3, :cond_0

    .line 111
    iget-object v3, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v3, v3, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    mul-int v3, v3, p1

    add-int/2addr v3, v2

    invoke-direct {p0, v3, v0}, Lcom/snatik/matches/ui/BoardView;->addTile(ILandroid/view/ViewGroup;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 115
    :cond_0
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView;->mRowLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v0, p1}, Lcom/snatik/matches/ui/BoardView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    return-void
.end method

.method private addTile(ILandroid/view/ViewGroup;)V
    .locals 5

    .line 120
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/snatik/matches/ui/TileView;->fromXml(Landroid/content/Context;Landroid/view/ViewGroup;)Lcom/snatik/matches/ui/TileView;

    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/snatik/matches/ui/BoardView;->mTileLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/snatik/matches/ui/TileView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const/4 v1, 0x0

    .line 123
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 124
    iget-object p2, p0, Lcom/snatik/matches/ui/BoardView;->mViewReference:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    new-instance p2, Lcom/snatik/matches/ui/BoardView$1;

    invoke-direct {p2, p0, p1, v0}, Lcom/snatik/matches/ui/BoardView$1;-><init>(Lcom/snatik/matches/ui/BoardView;ILcom/snatik/matches/ui/TileView;)V

    new-array v2, v1, [Ljava/lang/Void;

    .line 137
    invoke-virtual {p2, v2}, Lcom/snatik/matches/ui/BoardView$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 139
    new-instance p2, Lcom/snatik/matches/ui/BoardView$2;

    invoke-direct {p2, p0, v0, p1}, Lcom/snatik/matches/ui/BoardView$2;-><init>(Lcom/snatik/matches/ui/BoardView;Lcom/snatik/matches/ui/TileView;I)V

    invoke-virtual {v0, p2}, Lcom/snatik/matches/ui/TileView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p1, 0x2

    new-array p2, p1, [F

    .line 154
    fill-array-data p2, :array_0

    const-string v2, "scaleX"

    invoke-static {v0, v2, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p2

    .line 155
    new-instance v2, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v2}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {p2, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-array v2, p1, [F

    .line 156
    fill-array-data v2, :array_1

    const-string v3, "scaleY"

    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 157
    new-instance v3, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v3}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 158
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    new-array v4, p1, [Landroid/animation/Animator;

    aput-object p2, v4, v1

    const/4 p2, 0x1

    aput-object v2, v4, p2

    .line 159
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    const-wide/16 v1, 0x1f4

    .line 160
    invoke-virtual {v3, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    const/4 p2, 0x0

    .line 161
    invoke-virtual {v0, p1, p2}, Lcom/snatik/matches/ui/TileView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 162
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private buildBoard()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 96
    :goto_0
    iget-object v2, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v2, v2, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    if-ge v1, v2, :cond_0

    .line 98
    invoke-direct {p0, v1}, Lcom/snatik/matches/ui/BoardView;->addBoardRow(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/BoardView;->setClipChildren(Z)V

    return-void
.end method

.method public static fromXml(Landroid/content/Context;Landroid/view/ViewGroup;)Lcom/snatik/matches/ui/BoardView;
    .locals 2

    .line 66
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f09001d

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/snatik/matches/ui/BoardView;

    return-object p0
.end method


# virtual methods
.method protected animateHide(Lcom/snatik/matches/ui/TileView;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [F

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput v2, v0, v1

    const-string v1, "alpha"

    .line 181
    invoke-static {p1, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 182
    new-instance v1, Lcom/snatik/matches/ui/BoardView$3;

    invoke-direct {v1, p0, p1}, Lcom/snatik/matches/ui/BoardView$3;-><init>(Lcom/snatik/matches/ui/BoardView;Lcom/snatik/matches/ui/TileView;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const-wide/16 v1, 0x64

    .line 189
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const/4 v1, 0x2

    const/4 v2, 0x0

    .line 190
    invoke-virtual {p1, v1, v2}, Lcom/snatik/matches/ui/TileView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 191
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public flipDownAll()V
    .locals 3

    .line 166
    iget-object v0, p0, Lcom/snatik/matches/ui/BoardView;->flippedUp:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 167
    iget-object v2, p0, Lcom/snatik/matches/ui/BoardView;->mViewReference:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/snatik/matches/ui/TileView;

    invoke-virtual {v1}, Lcom/snatik/matches/ui/TileView;->flipDown()V

    goto :goto_0

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/snatik/matches/ui/BoardView;->flippedUp:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 170
    iput-boolean v0, p0, Lcom/snatik/matches/ui/BoardView;->mLocked:Z

    return-void
.end method

.method public hideCards(II)V
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/snatik/matches/ui/BoardView;->mViewReference:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/snatik/matches/ui/TileView;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/BoardView;->animateHide(Lcom/snatik/matches/ui/TileView;)V

    .line 175
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView;->mViewReference:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/snatik/matches/ui/TileView;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/BoardView;->animateHide(Lcom/snatik/matches/ui/TileView;)V

    .line 176
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView;->flippedUp:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    const/4 p1, 0x0

    .line 177
    iput-boolean p1, p0, Lcom/snatik/matches/ui/BoardView;->mLocked:Z

    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 62
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    return-void
.end method

.method public setBoard(Lcom/snatik/matches/model/Game;)V
    .locals 3

    .line 70
    iget-object v0, p1, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iput-object v0, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    .line 71
    iget-object p1, p1, Lcom/snatik/matches/model/Game;->boardArrangment:Lcom/snatik/matches/model/BoardArrangment;

    iput-object p1, p0, Lcom/snatik/matches/ui/BoardView;->mBoardArrangment:Lcom/snatik/matches/model/BoardArrangment;

    .line 73
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f05004c

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    .line 74
    invoke-virtual {p0}, Lcom/snatik/matches/ui/BoardView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float v1, v1, v0

    float-to-int v1, v1

    int-to-float p1, p1

    .line 75
    iget-object v2, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v2, v2, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    mul-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    mul-float v2, v2, v0

    sub-float/2addr p1, v2

    float-to-int p1, p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 77
    :goto_0
    iget-object v2, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v2, v2, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    if-ge v0, v2, :cond_0

    mul-int/lit8 v2, p1, 0x2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    :cond_0
    iget v0, p0, Lcom/snatik/matches/ui/BoardView;->mScreenHeight:I

    sub-int/2addr v0, v1

    iget-object v2, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v2, v2, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    div-int/2addr v0, v2

    .line 81
    iget v2, p0, Lcom/snatik/matches/ui/BoardView;->mScreenWidth:I

    sub-int/2addr v2, v1

    iget-object v1, p0, Lcom/snatik/matches/ui/BoardView;->mBoardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v1, v1, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    div-int/2addr v2, v1

    .line 82
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/snatik/matches/ui/BoardView;->mSize:I

    .line 84
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p0, Lcom/snatik/matches/ui/BoardView;->mSize:I

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/snatik/matches/ui/BoardView;->mTileLayoutParams:Landroid/widget/LinearLayout$LayoutParams;

    .line 85
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 88
    invoke-direct {p0}, Lcom/snatik/matches/ui/BoardView;->buildBoard()V

    return-void
.end method
