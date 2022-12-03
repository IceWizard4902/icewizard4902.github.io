.class Lcom/snatik/matches/ui/BoardView$1;
.super Landroid/os/AsyncTask;
.source "BoardView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/BoardView;->addTile(ILandroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/BoardView;

.field final synthetic val$id:I

.field final synthetic val$tileView:Lcom/snatik/matches/ui/TileView;


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/BoardView;ILcom/snatik/matches/ui/TileView;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/snatik/matches/ui/BoardView$1;->this$0:Lcom/snatik/matches/ui/BoardView;

    iput p2, p0, Lcom/snatik/matches/ui/BoardView$1;->val$id:I

    iput-object p3, p0, Lcom/snatik/matches/ui/BoardView$1;->val$tileView:Lcom/snatik/matches/ui/TileView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 2

    .line 130
    iget-object p1, p0, Lcom/snatik/matches/ui/BoardView$1;->this$0:Lcom/snatik/matches/ui/BoardView;

    invoke-static {p1}, Lcom/snatik/matches/ui/BoardView;->access$100(Lcom/snatik/matches/ui/BoardView;)Lcom/snatik/matches/model/BoardArrangment;

    move-result-object p1

    iget v0, p0, Lcom/snatik/matches/ui/BoardView$1;->val$id:I

    iget-object v1, p0, Lcom/snatik/matches/ui/BoardView$1;->this$0:Lcom/snatik/matches/ui/BoardView;

    invoke-static {v1}, Lcom/snatik/matches/ui/BoardView;->access$000(Lcom/snatik/matches/ui/BoardView;)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/snatik/matches/model/BoardArrangment;->getTileBitmap(II)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 126
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/BoardView$1;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/snatik/matches/ui/BoardView$1;->val$tileView:Lcom/snatik/matches/ui/TileView;

    invoke-virtual {v0, p1}, Lcom/snatik/matches/ui/TileView;->setTileImage(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 126
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/BoardView$1;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
