.class Lcom/snatik/matches/ui/PopupWonView$5;
.super Ljava/lang/Object;
.source "PopupWonView.java"

# interfaces
.implements Lcom/snatik/matches/utils/Clock$OnTimerCount;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/PopupWonView;->animateScoreAndTime(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/PopupWonView;

.field final synthetic val$achievedScore:I

.field final synthetic val$remainedSeconds:I


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/PopupWonView;II)V
    .locals 0

    .line 149
    iput-object p1, p0, Lcom/snatik/matches/ui/PopupWonView$5;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    iput p2, p0, Lcom/snatik/matches/ui/PopupWonView$5;->val$achievedScore:I

    iput p3, p0, Lcom/snatik/matches/ui/PopupWonView$5;->val$remainedSeconds:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 7

    .line 164
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView$5;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    invoke-static {v0}, Lcom/snatik/matches/ui/PopupWonView;->access$200(Lcom/snatik/matches/ui/PopupWonView;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v6, "%02d"

    invoke-static {v6, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v5, v2, v4

    invoke-static {v6, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView$5;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    invoke-static {v0}, Lcom/snatik/matches/ui/PopupWonView;->access$300(Lcom/snatik/matches/ui/PopupWonView;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/snatik/matches/ui/PopupWonView$5;->val$achievedScore:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onTick(J)V
    .locals 6

    long-to-float p1, p1

    const/high16 p2, 0x44960000    # 1200.0f

    div-float/2addr p1, p2

    .line 154
    iget p2, p0, Lcom/snatik/matches/ui/PopupWonView$5;->val$achievedScore:I

    int-to-float v0, p2

    mul-float v0, v0, p1

    float-to-int v0, v0

    sub-int/2addr p2, v0

    .line 155
    iget v0, p0, Lcom/snatik/matches/ui/PopupWonView$5;->val$remainedSeconds:I

    int-to-float v0, v0

    mul-float v0, v0, p1

    float-to-int p1, v0

    .line 156
    div-int/lit8 v0, p1, 0x3c

    mul-int/lit8 v1, v0, 0x3c

    sub-int/2addr p1, v1

    .line 158
    iget-object v1, p0, Lcom/snatik/matches/ui/PopupWonView$5;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    invoke-static {v1}, Lcom/snatik/matches/ui/PopupWonView;->access$200(Lcom/snatik/matches/ui/PopupWonView;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const-string v0, "%02d"

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v5

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView$5;->this$0:Lcom/snatik/matches/ui/PopupWonView;

    invoke-static {p1}, Lcom/snatik/matches/ui/PopupWonView;->access$300(Lcom/snatik/matches/ui/PopupWonView;)Landroid/widget/TextView;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
