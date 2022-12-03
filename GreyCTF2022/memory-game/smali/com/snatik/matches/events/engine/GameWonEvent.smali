.class public Lcom/snatik/matches/events/engine/GameWonEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "GameWonEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.engine.GameWonEvent"


# instance fields
.field public gameState:Lcom/snatik/matches/model/GameState;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/snatik/matches/model/GameState;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/snatik/matches/events/AbstractEvent;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/snatik/matches/events/engine/GameWonEvent;->gameState:Lcom/snatik/matches/model/GameState;

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 23
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/engine/GameWonEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 28
    sget-object v0, Lcom/snatik/matches/events/engine/GameWonEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
