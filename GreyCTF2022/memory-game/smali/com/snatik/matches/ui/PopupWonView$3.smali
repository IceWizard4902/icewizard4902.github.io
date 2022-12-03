.class Lcom/snatik/matches/ui/PopupWonView$3;
.super Ljava/lang/Object;
.source "PopupWonView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/PopupWonView;->setGameState(Lcom/snatik/matches/model/GameState;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/PopupWonView;

.field final synthetic val$gameState:Lcom/snatik/matches/model/GameState;


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/PopupWonView;Lcom/snatik/matches/model/GameState;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/snatik/matches/ui/PopupWonView$3;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView$3;->val$gameState:Lcom/snatik/matches/model/GameState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 80
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView$3;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    iget-object v1, p0, Lcom/snatik/matches/ui/PopupWonView$3;->val$gameState:Lcom/snatik/matches/model/GameState;

    iget v1, v1, Lcom/snatik/matches/model/GameState;->remainedSeconds:I

    iget-object v2, p0, Lcom/snatik/matches/ui/PopupWonView$3;->val$gameState:Lcom/snatik/matches/model/GameState;

    iget v2, v2, Lcom/snatik/matches/model/GameState;->achievedScore:I

    invoke-static {v0, v1, v2}, Lcom/snatik/matches/ui/PopupWonView;->access$000(Lcom/snatik/matches/ui/PopupWonView;II)V

    .line 81
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView$3;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    iget-object v1, p0, Lcom/snatik/matches/ui/PopupWonView$3;->val$gameState:Lcom/snatik/matches/model/GameState;

    iget v1, v1, Lcom/snatik/matches/model/GameState;->achievedStars:I

    invoke-static {v0, v1}, Lcom/snatik/matches/ui/PopupWonView;->access$100(Lcom/snatik/matches/ui/PopupWonView;I)V

    return-void
.end method
