.class Lcom/snatik/matches/ui/BoardView$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BoardView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/BoardView;->animateHide(Lcom/snatik/matches/ui/TileView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/BoardView;

.field final synthetic val$v:Lcom/snatik/matches/ui/TileView;


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/BoardView;Lcom/snatik/matches/ui/TileView;)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/snatik/matches/ui/BoardView$3;->this$0:Lcom/snatik/matches/ui/BoardView;

    iput-object p2, p0, Lcom/snatik/matches/ui/BoardView$3;->val$v:Lcom/snatik/matches/ui/TileView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 185
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$3;->val$v:Lcom/snatik/matches/ui/TileView;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/snatik/matches/ui/TileView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 186
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$3;->val$v:Lcom/snatik/matches/ui/TileView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/snatik/matches/ui/TileView;->setVisibility(I)V

    return-void
.end method
