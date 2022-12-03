.class Lcom/snatik/matches/fragments/ThemeSelectFragment$3;
.super Ljava/lang/Object;
.source "ThemeSelectFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/fragments/ThemeSelectFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/fragments/ThemeSelectFragment;

.field final synthetic val$themeEmoji:Lcom/snatik/matches/themes/Theme;


# direct methods
.method constructor <init>(Lcom/snatik/matches/fragments/ThemeSelectFragment;Lcom/snatik/matches/themes/Theme;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/snatik/matches/fragments/ThemeSelectFragment$3;->this$0:Lcom/snatik/matches/fragments/ThemeSelectFragment;

    iput-object p2, p0, Lcom/snatik/matches/fragments/ThemeSelectFragment$3;->val$themeEmoji:Lcom/snatik/matches/themes/Theme;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 55
    sget-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v0, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;

    iget-object v1, p0, Lcom/snatik/matches/fragments/ThemeSelectFragment$3;->val$themeEmoji:Lcom/snatik/matches/themes/Theme;

    invoke-direct {v0, v1}, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;-><init>(Lcom/snatik/matches/themes/Theme;)V

    invoke-virtual {p1, v0}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    return-void
.end method
