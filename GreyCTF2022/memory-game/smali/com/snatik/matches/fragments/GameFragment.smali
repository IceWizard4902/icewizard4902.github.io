.class public Lcom/snatik/matches/fragments/GameFragment;
.super Lcom/snatik/matches/fragments/BaseFragment;
.source "GameFragment.java"


# instance fields
.field private ads:Landroid/widget/LinearLayout;

.field private mBoardView:Lcom/snatik/matches/ui/BoardView;

.field private mTime:Landroid/widget/TextView;

.field private mTimeImage:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/snatik/matches/fragments/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/fragments/GameFragment;I)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/snatik/matches/fragments/GameFragment;->setTime(I)V

    return-void
.end method

.method private buildBoard()V
    .locals 3

    .line 63
    sget-object v0, Lcom/snatik/matches/common/Shared;->engine:Lcom/snatik/matches/engine/Engine;

    invoke-virtual {v0}, Lcom/snatik/matches/engine/Engine;->getActiveGame()Lcom/snatik/matches/model/Game;

    move-result-object v0

    .line 64
    iget-object v1, v0, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v1, v1, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    .line 65
    invoke-direct {p0, v1}, Lcom/snatik/matches/fragments/GameFragment;->setTime(I)V

    .line 66
    iget-object v2, p0, Lcom/snatik/matches/fragments/GameFragment;->mBoardView:Lcom/snatik/matches/ui/BoardView;

    invoke-virtual {v2, v0}, Lcom/snatik/matches/ui/BoardView;->setBoard(Lcom/snatik/matches/model/Game;)V

    .line 68
    invoke-direct {p0, v1}, Lcom/snatik/matches/fragments/GameFragment;->startClock(I)V

    return-void
.end method

.method private setTime(I)V
    .locals 6

    .line 72
    div-int/lit8 v0, p1, 0x3c

    mul-int/lit8 v1, v0, 0x3c

    sub-int/2addr p1, v1

    .line 74
    iget-object v1, p0, Lcom/snatik/matches/fragments/GameFragment;->mTime:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const-string v0, "%02d"

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v5

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private startClock(I)V
    .locals 6

    .line 78
    invoke-static {}, Lcom/snatik/matches/utils/Clock;->getInstance()Lcom/snatik/matches/utils/Clock;

    move-result-object v0

    mul-int/lit16 p1, p1, 0x3e8

    int-to-long v1, p1

    .line 79
    new-instance v5, Lcom/snatik/matches/fragments/GameFragment$1;

    invoke-direct {v5, p0}, Lcom/snatik/matches/fragments/GameFragment$1;-><init>(Lcom/snatik/matches/fragments/GameFragment;)V

    const-wide/16 v3, 0x3e8

    invoke-virtual/range {v0 .. v5}, Lcom/snatik/matches/utils/Clock;->startTimer(JJLcom/snatik/matches/utils/Clock$OnTimerCount;)V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const p3, 0x7f090020

    const/4 v0, 0x0

    .line 34
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    .line 35
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    const p2, 0x7f07003d

    .line 36
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    const p2, 0x7f07009d

    .line 37
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/GameFragment;->mTime:Landroid/widget/TextView;

    const p2, 0x7f07009c

    .line 38
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/GameFragment;->mTimeImage:Landroid/widget/ImageView;

    .line 39
    sget-object p2, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    const/4 p3, 0x1

    new-array p3, p3, [Landroid/widget/TextView;

    iget-object v1, p0, Lcom/snatik/matches/fragments/GameFragment;->mTime:Landroid/widget/TextView;

    aput-object v1, p3, v0

    sget-object v1, Lcom/snatik/matches/utils/FontLoader$Font;->GROBOLD:Lcom/snatik/matches/utils/FontLoader$Font;

    invoke-static {p2, p3, v1}, Lcom/snatik/matches/utils/FontLoader;->setTypeface(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;)V

    .line 40
    invoke-virtual {p0}, Lcom/snatik/matches/fragments/GameFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/snatik/matches/ui/BoardView;->fromXml(Landroid/content/Context;Landroid/view/ViewGroup;)Lcom/snatik/matches/ui/BoardView;

    move-result-object p2

    iput-object p2, p0, Lcom/snatik/matches/fragments/GameFragment;->mBoardView:Lcom/snatik/matches/ui/BoardView;

    const p2, 0x7f07003e

    .line 41
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/FrameLayout;

    .line 42
    iget-object p3, p0, Lcom/snatik/matches/fragments/GameFragment;->mBoardView:Lcom/snatik/matches/ui/BoardView;

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 43
    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 46
    invoke-direct {p0}, Lcom/snatik/matches/fragments/GameFragment;->buildBoard()V

    .line 47
    sget-object p2, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object p3, Lcom/snatik/matches/events/engine/FlipDownCardsEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {p2, p3, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 48
    sget-object p2, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object p3, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {p2, p3, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 49
    sget-object p2, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object p3, Lcom/snatik/matches/events/engine/GameWonEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {p2, p3, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    .line 56
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/engine/FlipDownCardsEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 57
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 58
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/engine/GameWonEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 59
    invoke-super {p0}, Lcom/snatik/matches/fragments/BaseFragment;->onDestroy()V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/engine/FlipDownCardsEvent;)V
    .locals 0

    .line 102
    iget-object p1, p0, Lcom/snatik/matches/fragments/GameFragment;->mBoardView:Lcom/snatik/matches/ui/BoardView;

    invoke-virtual {p1}, Lcom/snatik/matches/ui/BoardView;->flipDownAll()V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/engine/GameWonEvent;)V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/snatik/matches/fragments/GameFragment;->mTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    iget-object v0, p0, Lcom/snatik/matches/fragments/GameFragment;->mTimeImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 97
    iget-object p1, p1, Lcom/snatik/matches/events/engine/GameWonEvent;->gameState:Lcom/snatik/matches/model/GameState;

    invoke-static {p1}, Lcom/snatik/matches/ui/PopupManager;->showPopupWon(Lcom/snatik/matches/model/GameState;)V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/engine/HidePairCardsEvent;)V
    .locals 2

    .line 107
    iget-object v0, p0, Lcom/snatik/matches/fragments/GameFragment;->mBoardView:Lcom/snatik/matches/ui/BoardView;

    iget v1, p1, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->id1:I

    iget p1, p1, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->id2:I

    invoke-virtual {v0, v1, p1}, Lcom/snatik/matches/ui/BoardView;->hideCards(II)V

    return-void
.end method
