.class Lcom/snatik/matches/fragments/MenuFragment$2;
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

    .line 49
    iput-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$2;->this$0:Lcom/snatik/matches/fragments/MenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 52
    iget-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$2;->this$0:Lcom/snatik/matches/fragments/MenuFragment;

    invoke-virtual {p1}, Lcom/snatik/matches/fragments/MenuFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const-string v0, "Leaderboards will be available in the next game updates"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
