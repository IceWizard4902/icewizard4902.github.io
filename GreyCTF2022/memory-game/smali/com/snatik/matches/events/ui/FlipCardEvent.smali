.class public Lcom/snatik/matches/events/ui/FlipCardEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "FlipCardEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.ui.FlipCardEvent"


# instance fields
.field public final id:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/snatik/matches/events/AbstractEvent;-><init>()V

    .line 16
    iput p1, p0, Lcom/snatik/matches/events/ui/FlipCardEvent;->id:I

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 21
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/ui/FlipCardEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 26
    sget-object v0, Lcom/snatik/matches/events/ui/FlipCardEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
