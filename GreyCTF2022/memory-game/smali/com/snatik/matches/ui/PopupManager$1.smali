.class Lcom/snatik/matches/ui/PopupManager$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PopupManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/PopupManager;->closePopup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$popupContainer:Landroid/widget/RelativeLayout;


# direct methods
.method constructor <init>(Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/snatik/matches/ui/PopupManager$1;->val$popupContainer:Landroid/widget/RelativeLayout;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 102
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupManager$1;->val$popupContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->removeAllViews()V

    return-void
.end method
