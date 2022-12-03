.class public interface abstract Lcom/snatik/matches/events/EventObserver;
.super Ljava/lang/Object;
.source "EventObserver.java"


# virtual methods
.method public abstract onEvent(Lcom/snatik/matches/events/engine/FlipDownCardsEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/engine/GameWonEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/engine/HidePairCardsEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/BackGameEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/DifficultySelectedEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/FlipCardEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/NextGameEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/ResetBackgroundEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/StartEvent;)V
.end method

.method public abstract onEvent(Lcom/snatik/matches/events/ui/ThemeSelectedEvent;)V
.end method
