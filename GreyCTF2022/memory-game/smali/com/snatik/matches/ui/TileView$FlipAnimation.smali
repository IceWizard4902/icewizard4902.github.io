.class public Lcom/snatik/matches/ui/TileView$FlipAnimation;
.super Landroid/view/animation/Animation;
.source "TileView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snatik/matches/ui/TileView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FlipAnimation"
.end annotation


# instance fields
.field private camera:Landroid/graphics/Camera;

.field private centerX:F

.field private centerY:F

.field private forward:Z

.field private fromView:Landroid/view/View;

.field final synthetic this$0:Lcom/snatik/matches/ui/TileView;

.field private toView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/snatik/matches/ui/TileView;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 90
    iput-object p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->this$0:Lcom/snatik/matches/ui/TileView;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    const/4 p1, 0x1

    .line 80
    iput-boolean p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->forward:Z

    .line 91
    iput-object p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->fromView:Landroid/view/View;

    .line 92
    iput-object p3, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->toView:Landroid/view/View;

    const-wide/16 p1, 0x2bc

    .line 94
    invoke-virtual {p0, p1, p2}, Lcom/snatik/matches/ui/TileView$FlipAnimation;->setDuration(J)V

    const/4 p1, 0x0

    .line 95
    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/TileView$FlipAnimation;->setFillAfter(Z)V

    .line 96
    new-instance p1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/TileView$FlipAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 6

    float-to-double v0, p1

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .line 118
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    const-wide v4, 0x4066800000000000L    # 180.0

    mul-double v0, v0, v4

    div-double/2addr v0, v2

    double-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float p1, p1, v1

    if-ltz p1, :cond_0

    const/high16 p1, 0x43340000    # 180.0f

    sub-float/2addr v0, p1

    .line 127
    iget-object p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->fromView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 128
    iget-object p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->toView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 131
    :cond_0
    iget-boolean p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->forward:Z

    if-eqz p1, :cond_1

    neg-float v0, v0

    .line 135
    :cond_1
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    .line 136
    iget-object p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->camera:Landroid/graphics/Camera;

    invoke-virtual {p2}, Landroid/graphics/Camera;->save()V

    .line 137
    iget-object p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->camera:Landroid/graphics/Camera;

    invoke-virtual {p2, v0}, Landroid/graphics/Camera;->rotateY(F)V

    .line 138
    iget-object p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->camera:Landroid/graphics/Camera;

    invoke-virtual {p2, p1}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 139
    iget-object p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->camera:Landroid/graphics/Camera;

    invoke-virtual {p2}, Landroid/graphics/Camera;->restore()V

    .line 140
    iget p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->centerX:F

    neg-float p2, p2

    iget v0, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->centerY:F

    neg-float v0, v0

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 141
    iget p2, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->centerX:F

    iget v0, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->centerY:F

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void
.end method

.method public initialize(IIII)V
    .locals 0

    .line 108
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 109
    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    iput p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->centerX:F

    .line 110
    div-int/lit8 p2, p2, 0x2

    int-to-float p1, p2

    iput p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->centerY:F

    .line 111
    new-instance p1, Landroid/graphics/Camera;

    invoke-direct {p1}, Landroid/graphics/Camera;-><init>()V

    iput-object p1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->camera:Landroid/graphics/Camera;

    return-void
.end method

.method public reverse()V
    .locals 2

    const/4 v0, 0x0

    .line 100
    iput-boolean v0, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->forward:Z

    .line 101
    iget-object v0, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->toView:Landroid/view/View;

    .line 102
    iget-object v1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->fromView:Landroid/view/View;

    iput-object v1, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->toView:Landroid/view/View;

    .line 103
    iput-object v0, p0, Lcom/snatik/matches/ui/TileView$FlipAnimation;->fromView:Landroid/view/View;

    return-void
.end method
