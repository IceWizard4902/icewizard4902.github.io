.class public Lcom/snatik/matches/events/ui/DifficultySelectedEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "DifficultySelectedEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.ui.DifficultySelectedEvent"


# instance fields
.field public final difficulty:I


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
    iput p1, p0, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;->difficulty:I

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 21
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/ui/DifficultySelectedEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 26
    sget-object v0, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
