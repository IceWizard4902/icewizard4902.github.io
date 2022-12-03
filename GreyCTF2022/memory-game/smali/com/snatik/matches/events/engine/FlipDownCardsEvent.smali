.class public Lcom/snatik/matches/events/engine/FlipDownCardsEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "FlipDownCardsEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.engine.FlipDownCardsEvent"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/snatik/matches/events/AbstractEvent;-><init>()V

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 18
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/engine/FlipDownCardsEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 23
    sget-object v0, Lcom/snatik/matches/events/engine/FlipDownCardsEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
