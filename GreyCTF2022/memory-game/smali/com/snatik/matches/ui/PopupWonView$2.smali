.class Lcom/snatik/matches/ui/PopupWonView$2;
.super Ljava/lang/Object;
.source "PopupWonView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/PopupWonView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/PopupWonView;


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/PopupWonView;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/snatik/matches/ui/PopupWonView$2;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 65
    sget-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v0, Lcom/snatik/matches/events/ui/NextGameEvent;

    invoke-direct {v0}, Lcom/snatik/matches/events/ui/NextGameEvent;-><init>()V

    invoke-virtual {p1, v0}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    return-void
.end method
