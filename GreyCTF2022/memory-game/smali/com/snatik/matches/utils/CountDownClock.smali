.class public abstract Lcom/snatik/matches/utils/CountDownClock;
.super Ljava/lang/Object;
.source "CountDownClock.java"


# static fields
.field private static final MSG:I = 0x1


# instance fields
.field private final mCountdownInterval:J

.field private final mHandler:Landroid/os/Handler;

.field private mMillisInFuture:J

.field private mPauseTimeRemaining:J

.field private mRunAtStart:Z

.field private mStopTimeInFuture:J

.field private final mTotalCountdown:J


# direct methods
.method public constructor <init>(JJZ)V
    .locals 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    new-instance v0, Lcom/snatik/matches/utils/CountDownClock$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/snatik/matches/utils/CountDownClock$1;-><init>(Lcom/snatik/matches/utils/CountDownClock;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mHandler:Landroid/os/Handler;

    .line 55
    iput-wide p1, p0, Lcom/snatik/matches/utils/CountDownClock;->mMillisInFuture:J

    .line 56
    iput-wide p1, p0, Lcom/snatik/matches/utils/CountDownClock;->mTotalCountdown:J

    .line 57
    iput-wide p3, p0, Lcom/snatik/matches/utils/CountDownClock;->mCountdownInterval:J

    .line 58
    iput-boolean p5, p0, Lcom/snatik/matches/utils/CountDownClock;->mRunAtStart:Z

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/utils/CountDownClock;)J
    .locals 2

    .line 10
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mCountdownInterval:J

    return-wide v0
.end method


# virtual methods
.method public final cancel()V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized create()Lcom/snatik/matches/utils/CountDownClock;
    .locals 5

    monitor-enter p0

    .line 72
    :try_start_0
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mMillisInFuture:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 73
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->onFinish()V

    goto :goto_0

    .line 75
    :cond_0
    iput-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    .line 78
    :goto_0
    iget-boolean v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mRunAtStart:Z

    if-eqz v0, :cond_1

    .line 79
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->resume()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    :cond_1
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public hasBeenStarted()Z
    .locals 5

    .line 167
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    iget-wide v2, p0, Lcom/snatik/matches/utils/CountDownClock;->mMillisInFuture:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPaused()Z
    .locals 5

    .line 113
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 123
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->isPaused()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public abstract onFinish()V
.end method

.method public abstract onTick(J)V
.end method

.method public pause()V
    .locals 2

    .line 89
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->timeLeft()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    .line 91
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->cancel()V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 4

    .line 99
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->isPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    iput-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mMillisInFuture:J

    .line 101
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/snatik/matches/utils/CountDownClock;->mMillisInFuture:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mStopTimeInFuture:J

    .line 102
    iget-object v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const-wide/16 v0, 0x0

    .line 103
    iput-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    :cond_0
    return-void
.end method

.method public timeLeft()J
    .locals 7

    .line 133
    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->isPaused()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    .line 134
    iget-wide v1, p0, Lcom/snatik/matches/utils/CountDownClock;->mPauseTimeRemaining:J

    goto :goto_0

    .line 136
    :cond_0
    iget-wide v3, p0, Lcom/snatik/matches/utils/CountDownClock;->mStopTimeInFuture:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    cmp-long v0, v3, v1

    if-gez v0, :cond_1

    goto :goto_0

    :cond_1
    move-wide v1, v3

    :goto_0
    return-wide v1
.end method

.method public timePassed()J
    .locals 4

    .line 158
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mTotalCountdown:J

    invoke-virtual {p0}, Lcom/snatik/matches/utils/CountDownClock;->timeLeft()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public totalCountdown()J
    .locals 2

    .line 149
    iget-wide v0, p0, Lcom/snatik/matches/utils/CountDownClock;->mTotalCountdown:J

    return-wide v0
.end method
