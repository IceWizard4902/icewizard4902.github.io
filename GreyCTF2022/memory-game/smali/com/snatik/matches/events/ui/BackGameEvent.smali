.class public Lcom/snatik/matches/events/ui/BackGameEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "BackGameEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.ui.BackGameEvent"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/snatik/matches/events/AbstractEvent;-><init>()V

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 15
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/ui/BackGameEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 20
    sget-object v0, Lcom/snatik/matches/events/ui/BackGameEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
