.class Lcom/snatik/matches/fragments/DifficultySelectFragment$1;
.super Ljava/lang/Object;
.source "DifficultySelectFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/fragments/DifficultySelectFragment;

.field final synthetic val$difficulty:I


# direct methods
.method constructor <init>(Lcom/snatik/matches/fragments/DifficultySelectFragment;I)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/snatik/matches/fragments/DifficultySelectFragment$1;->this$0:Lcom/snatik/matches/fragments/DifficultySelectFragment;

    iput p2, p0, Lcom/snatik/matches/fragments/DifficultySelectFragment$1;->val$difficulty:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 123
    sget-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v0, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;

    iget v1, p0, Lcom/snatik/matches/fragments/DifficultySelectFragment$1;->val$difficulty:I

    invoke-direct {v0, v1}, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    return-void
.end method
