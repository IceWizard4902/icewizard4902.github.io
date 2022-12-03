.class public Lcom/snatik/matches/events/engine/HidePairCardsEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "HidePairCardsEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.engine.HidePairCardsEvent"


# instance fields
.field public id1:I

.field public id2:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/snatik/matches/events/AbstractEvent;-><init>()V

    .line 16
    iput p1, p0, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->id1:I

    .line 17
    iput p2, p0, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->id2:I

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 22
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/engine/HidePairCardsEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 27
    sget-object v0, Lcom/snatik/matches/events/engine/HidePairCardsEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
