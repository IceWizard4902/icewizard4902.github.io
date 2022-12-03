.class public Lcom/snatik/matches/events/ui/ThemeSelectedEvent;
.super Lcom/snatik/matches/events/AbstractEvent;
.source "ThemeSelectedEvent.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "com.snatik.matches.events.ui.ThemeSelectedEvent"


# instance fields
.field public final theme:Lcom/snatik/matches/themes/Theme;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/snatik/matches/themes/Theme;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/snatik/matches/events/AbstractEvent;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;->theme:Lcom/snatik/matches/themes/Theme;

    return-void
.end method


# virtual methods
.method protected fire(Lcom/snatik/matches/events/EventObserver;)V
    .locals 0

    .line 18
    invoke-interface {p1, p0}, Lcom/snatik/matches/events/EventObserver;->onEvent(Lcom/snatik/matches/events/ui/ThemeSelectedEvent;)V

    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 23
    sget-object v0, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;->TYPE:Ljava/lang/String;

    return-object v0
.end method
