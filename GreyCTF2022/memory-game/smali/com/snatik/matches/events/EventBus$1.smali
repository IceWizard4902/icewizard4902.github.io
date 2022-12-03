.class Lcom/snatik/matches/events/EventBus$1;
.super Ljava/lang/Object;
.source "EventBus.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/events/EventBus;

.field final synthetic val$event:Lcom/snatik/matches/events/Event;


# direct methods
.method constructor <init>(Lcom/snatik/matches/events/EventBus;Lcom/snatik/matches/events/Event;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/snatik/matches/events/EventBus$1;->this$0:Lcom/snatik/matches/events/EventBus;

    iput-object p2, p0, Lcom/snatik/matches/events/EventBus$1;->val$event:Lcom/snatik/matches/events/Event;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/snatik/matches/events/EventBus$1;->this$0:Lcom/snatik/matches/events/EventBus;

    iget-object v1, p0, Lcom/snatik/matches/events/EventBus$1;->val$event:Lcom/snatik/matches/events/Event;

    invoke-virtual {v0, v1}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    return-void
.end method
