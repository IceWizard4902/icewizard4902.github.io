.class Lcom/snatik/matches/fragments/MenuFragment$3;
.super Ljava/lang/Object;
.source "MenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/fragments/MenuFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/fragments/MenuFragment;


# direct methods
.method constructor <init>(Lcom/snatik/matches/fragments/MenuFragment;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$3;->this$0:Lcom/snatik/matches/fragments/MenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 63
    iget-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$3;->this$0:Lcom/snatik/matches/fragments/MenuFragment;

    new-instance v0, Lcom/snatik/matches/fragments/MenuFragment$3$1;

    invoke-direct {v0, p0}, Lcom/snatik/matches/fragments/MenuFragment$3$1;-><init>(Lcom/snatik/matches/fragments/MenuFragment$3;)V

    invoke-virtual {p1, v0}, Lcom/snatik/matches/fragments/MenuFragment;->animateAllAssetsOff(Landroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method
