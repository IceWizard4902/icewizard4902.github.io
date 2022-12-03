.class Lcom/snatik/matches/utils/CountDownClock$1;
.super Landroid/os/Handler;
.source "CountDownClock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snatik/matches/utils/CountDownClock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/utils/CountDownClock;


# direct methods
.method constructor <init>(Lcom/snatik/matches/utils/CountDownClock;Landroid/os/Looper;)V
    .locals 0

    .line 186
    iput-object p1, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 191
    iget-object p1, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    monitor-enter p1

    .line 192
    :try_start_0
    iget-object v0, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-virtual {v0}, Lcom/snatik/matches/utils/CountDownClock;->timeLeft()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 195
    iget-object v0, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-virtual {v0}, Lcom/snatik/matches/utils/CountDownClock;->cancel()V

    .line 196
    iget-object v0, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-virtual {v0}, Lcom/snatik/matches/utils/CountDownClock;->onFinish()V

    goto :goto_1

    .line 197
    :cond_0
    iget-object v4, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-static {v4}, Lcom/snatik/matches/utils/CountDownClock;->access$000(Lcom/snatik/matches/utils/CountDownClock;)J

    move-result-wide v4

    const/4 v6, 0x1

    cmp-long v7, v0, v4

    if-gez v7, :cond_1

    .line 199
    invoke-virtual {p0, v6}, Lcom/snatik/matches/utils/CountDownClock$1;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {p0, v2, v0, v1}, Lcom/snatik/matches/utils/CountDownClock$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_1

    .line 201
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 202
    iget-object v7, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-virtual {v7, v0, v1}, Lcom/snatik/matches/utils/CountDownClock;->onTick(J)V

    .line 205
    iget-object v0, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-static {v0}, Lcom/snatik/matches/utils/CountDownClock;->access$000(Lcom/snatik/matches/utils/CountDownClock;)J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v4

    sub-long/2addr v0, v7

    :goto_0
    cmp-long v4, v0, v2

    if-gez v4, :cond_2

    .line 211
    iget-object v4, p0, Lcom/snatik/matches/utils/CountDownClock$1;->this$0:Lcom/snatik/matches/utils/CountDownClock;

    invoke-static {v4}, Lcom/snatik/matches/utils/CountDownClock;->access$000(Lcom/snatik/matches/utils/CountDownClock;)J

    move-result-wide v4

    add-long/2addr v0, v4

    goto :goto_0

    .line 213
    :cond_2
    invoke-virtual {p0, v6}, Lcom/snatik/matches/utils/CountDownClock$1;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {p0, v2, v0, v1}, Lcom/snatik/matches/utils/CountDownClock$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 215
    :goto_1
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method
