.class public Lcom/snatik/matches/utils/Clock$PauseTimer;
.super Lcom/snatik/matches/utils/CountDownClock;
.source "Clock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snatik/matches/utils/Clock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PauseTimer"
.end annotation


# instance fields
.field private mOnTimerCount:Lcom/snatik/matches/utils/Clock$OnTimerCount;


# direct methods
.method public constructor <init>(JJZLcom/snatik/matches/utils/Clock$OnTimerCount;)V
    .locals 0

    .line 52
    invoke-direct/range {p0 .. p5}, Lcom/snatik/matches/utils/CountDownClock;-><init>(JJZ)V

    .line 53
    iput-object p6, p0, Lcom/snatik/matches/utils/Clock$PauseTimer;->mOnTimerCount:Lcom/snatik/matches/utils/Clock$OnTimerCount;

    return-void
.end method

.method static synthetic access$002(Lcom/snatik/matches/utils/Clock$PauseTimer;Lcom/snatik/matches/utils/Clock$OnTimerCount;)Lcom/snatik/matches/utils/Clock$OnTimerCount;
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/snatik/matches/utils/Clock$PauseTimer;->mOnTimerCount:Lcom/snatik/matches/utils/Clock$OnTimerCount;

    return-object p1
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/snatik/matches/utils/Clock$PauseTimer;->mOnTimerCount:Lcom/snatik/matches/utils/Clock$OnTimerCount;

    if-eqz v0, :cond_0

    .line 66
    invoke-interface {v0}, Lcom/snatik/matches/utils/Clock$OnTimerCount;->onFinish()V

    :cond_0
    return-void
.end method

.method public onTick(J)V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/snatik/matches/utils/Clock$PauseTimer;->mOnTimerCount:Lcom/snatik/matches/utils/Clock$OnTimerCount;

    if-eqz v0, :cond_0

    .line 59
    invoke-interface {v0, p1, p2}, Lcom/snatik/matches/utils/Clock$OnTimerCount;->onTick(J)V

    :cond_0
    return-void
.end method
