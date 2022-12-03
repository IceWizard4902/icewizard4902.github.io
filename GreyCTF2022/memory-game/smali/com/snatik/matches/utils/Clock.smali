.class public Lcom/snatik/matches/utils/Clock;
.super Ljava/lang/Object;
.source "Clock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/snatik/matches/utils/Clock$OnTimerCount;,
        Lcom/snatik/matches/utils/Clock$PauseTimer;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/snatik/matches/utils/Clock;

.field private static mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "my_tag"

    const-string v1, "NEW INSTANCE OF CLOCK"

    .line 45
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static getInstance()Lcom/snatik/matches/utils/Clock;
    .locals 1

    .line 73
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mInstance:Lcom/snatik/matches/utils/Clock;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/snatik/matches/utils/Clock;

    invoke-direct {v0}, Lcom/snatik/matches/utils/Clock;-><init>()V

    sput-object v0, Lcom/snatik/matches/utils/Clock;->mInstance:Lcom/snatik/matches/utils/Clock;

    .line 76
    :cond_0
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mInstance:Lcom/snatik/matches/utils/Clock;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 115
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 116
    invoke-static {v0, v1}, Lcom/snatik/matches/utils/Clock$PauseTimer;->access$002(Lcom/snatik/matches/utils/Clock$PauseTimer;Lcom/snatik/matches/utils/Clock$OnTimerCount;)Lcom/snatik/matches/utils/Clock$OnTimerCount;

    .line 117
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    invoke-virtual {v0}, Lcom/snatik/matches/utils/Clock$PauseTimer;->cancel()V

    :cond_0
    return-void
.end method

.method public getPassedTime()J
    .locals 2

    .line 122
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    invoke-virtual {v0}, Lcom/snatik/matches/utils/Clock$PauseTimer;->timePassed()J

    move-result-wide v0

    return-wide v0
.end method

.method public pause()V
    .locals 1

    .line 97
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    if-eqz v0, :cond_0

    .line 98
    invoke-virtual {v0}, Lcom/snatik/matches/utils/Clock$PauseTimer;->pause()V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .line 106
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {v0}, Lcom/snatik/matches/utils/Clock$PauseTimer;->resume()V

    :cond_0
    return-void
.end method

.method public startTimer(JJLcom/snatik/matches/utils/Clock$OnTimerCount;)V
    .locals 8

    .line 86
    sget-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {v0}, Lcom/snatik/matches/utils/Clock$PauseTimer;->cancel()V

    .line 89
    :cond_0
    new-instance v0, Lcom/snatik/matches/utils/Clock$PauseTimer;

    const/4 v6, 0x1

    move-object v1, v0

    move-wide v2, p1

    move-wide v4, p3

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/snatik/matches/utils/Clock$PauseTimer;-><init>(JJZLcom/snatik/matches/utils/Clock$OnTimerCount;)V

    sput-object v0, Lcom/snatik/matches/utils/Clock;->mPauseTimer:Lcom/snatik/matches/utils/Clock$PauseTimer;

    .line 90
    invoke-virtual {v0}, Lcom/snatik/matches/utils/Clock$PauseTimer;->create()Lcom/snatik/matches/utils/CountDownClock;

    return-void
.end method
