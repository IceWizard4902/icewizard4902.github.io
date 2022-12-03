.class Lcom/snatik/matches/fragments/MenuFragment$4;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/fragments/MenuFragment;->startTootipAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/fragments/MenuFragment;

.field final synthetic val$animatorSet:Landroid/animation/AnimatorSet;


# direct methods
.method constructor <init>(Lcom/snatik/matches/fragments/MenuFragment;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$4;->this$0:Lcom/snatik/matches/fragments/MenuFragment;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment$4;->val$animatorSet:Landroid/animation/AnimatorSet;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 128
    iget-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$4;->val$animatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 129
    iget-object p1, p0, Lcom/snatik/matches/fragments/MenuFragment$4;->val$animatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method
