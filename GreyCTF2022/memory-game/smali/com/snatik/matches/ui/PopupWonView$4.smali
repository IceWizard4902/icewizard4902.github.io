.class Lcom/snatik/matches/ui/PopupWonView$4;
.super Ljava/lang/Object;
.source "PopupWonView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V
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

    .line 137
    iput-object p1, p0, Lcom/snatik/matches/ui/PopupWonView$4;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 141
    invoke-static {}, Lcom/snatik/matches/common/Music;->showStar()V

    return-void
.end method
