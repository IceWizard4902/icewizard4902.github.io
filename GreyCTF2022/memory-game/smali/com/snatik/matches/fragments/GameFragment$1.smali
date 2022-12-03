.class Lcom/snatik/matches/fragments/GameFragment$1;
.super Ljava/lang/Object;
.source "GameFragment.java"

# interfaces
.implements Lcom/snatik/matches/utils/Clock$OnTimerCount;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/fragments/GameFragment;->startClock(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/fragments/GameFragment;


# direct methods
.method constructor <init>(Lcom/snatik/matches/fragments/GameFragment;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/snatik/matches/fragments/GameFragment$1;->this$0:Lcom/snatik/matches/fragments/GameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .line 88
    iget-object v0, p0, Lcom/snatik/matches/fragments/GameFragment$1;->this$0:Lcom/snatik/matches/fragments/GameFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/snatik/matches/fragments/GameFragment;->access$000(Lcom/snatik/matches/fragments/GameFragment;I)V

    return-void
.end method

.method public onTick(J)V
    .locals 3

    .line 83
    iget-object v0, p0, Lcom/snatik/matches/fragments/GameFragment$1;->this$0:Lcom/snatik/matches/fragments/GameFragment;

    const-wide/16 v1, 0x3e8

    div-long/2addr p1, v1

    long-to-int p2, p1

    invoke-static {v0, p2}, Lcom/snatik/matches/fragments/GameFragment;->access$000(Lcom/snatik/matches/fragments/GameFragment;I)V

    return-void
.end method
