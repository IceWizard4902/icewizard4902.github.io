.class Lcom/snatik/matches/ui/BoardView$2;
.super Ljava/lang/Object;
.source "BoardView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/BoardView;->addTile(ILandroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/BoardView;

.field final synthetic val$id:I

.field final synthetic val$tileView:Lcom/snatik/matches/ui/TileView;


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/BoardView;Lcom/snatik/matches/ui/TileView;I)V
    .locals 0

    .line 139
    iput-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->this$0:Lcom/snatik/matches/ui/BoardView;

    iput-object p2, p0, Lcom/snatik/matches/ui/BoardView$2;->val$tileView:Lcom/snatik/matches/ui/TileView;

    iput p3, p0, Lcom/snatik/matches/ui/BoardView$2;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 143
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->this$0:Lcom/snatik/matches/ui/BoardView;

    invoke-static {p1}, Lcom/snatik/matches/ui/BoardView;->access$200(Lcom/snatik/matches/ui/BoardView;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->val$tileView:Lcom/snatik/matches/ui/TileView;

    invoke-virtual {p1}, Lcom/snatik/matches/ui/TileView;->isFlippedDown()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 144
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->val$tileView:Lcom/snatik/matches/ui/TileView;

    invoke-virtual {p1}, Lcom/snatik/matches/ui/TileView;->flipUp()V

    .line 145
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->this$0:Lcom/snatik/matches/ui/BoardView;

    invoke-static {p1}, Lcom/snatik/matches/ui/BoardView;->access$300(Lcom/snatik/matches/ui/BoardView;)Ljava/util/List;

    move-result-object p1

    iget v0, p0, Lcom/snatik/matches/ui/BoardView$2;->val$id:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->this$0:Lcom/snatik/matches/ui/BoardView;

    invoke-static {p1}, Lcom/snatik/matches/ui/BoardView;->access$300(Lcom/snatik/matches/ui/BoardView;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 147
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$2;->this$0:Lcom/snatik/matches/ui/BoardView;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/snatik/matches/ui/BoardView;->access$202(Lcom/snatik/matches/ui/BoardView;Z)Z

    .line 149
    :cond_0
    sget-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v0, Lcom/snatik/matches/events/ui/FlipCardEvent;

    iget v1, p0, Lcom/snatik/matches/ui/BoardView$2;->val$id:I

    invoke-direct {v0, v1}, Lcom/snatik/matches/events/ui/FlipCardEvent;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    :cond_1
    return-void
.end method
