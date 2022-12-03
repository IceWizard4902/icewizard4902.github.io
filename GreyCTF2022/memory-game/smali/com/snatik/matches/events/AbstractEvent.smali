.class public abstract Lcom/snatik/matches/events/AbstractEvent;
.super Ljava/lang/Object;
.source "AbstractEvent.java"

# interfaces
.implements Lcom/snatik/matches/events/Event;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract fire(Lcom/snatik/matches/events/EventObserver;)V
.end method
