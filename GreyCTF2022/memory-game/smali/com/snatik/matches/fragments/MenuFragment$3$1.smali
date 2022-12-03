.class Lcom/snatik/matches/fragments/MenuFragment$3$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/fragments/MenuFragment$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/snatik/matches/fragments/MenuFragment$3;


# direct methods
.method constructor <init>(Lcom/snatik/matches/fragments/MenuFragment$3;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$3$1;->this$1:Lcom/snatik/matches/fragments/MenuFragment$3;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 66
    sget-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v0, Lcom/snatik/matches/events/ui/StartEvent;

    invoke-direct {v0}, Lcom/snatik/matches/events/ui/StartEvent;-><init>()V

    invoke-virtual {p1, v0}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    return-void
.end method
