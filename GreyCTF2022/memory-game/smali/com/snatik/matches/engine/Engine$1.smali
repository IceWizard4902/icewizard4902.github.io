.class Lcom/snatik/matches/engine/Engine$1;
.super Landroid/os/AsyncTask;
.source "Engine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/engine/Engine;->onEvent(Lcom/snatik/matches/events/ui/ResetBackgroundEvent;)V
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
.field final synthetic this$0:Lcom/snatik/matches/engine/Engine;


# direct methods
.method constructor <init>(Lcom/snatik/matches/engine/Engine;)V
    .locals 0

    .line 123
    iput-object p1, p0, Lcom/snatik/matches/engine/Engine$1;->this$0:Lcom/snatik/matches/engine/Engine;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 2

    .line 127
    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenWidth()I

    move-result p1

    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenHeight()I

    move-result v0

    const v1, 0x7f060076

    invoke-static {v1, p1, v0}, Lcom/snatik/matches/utils/Utils;->scaleDown(III)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 123
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/engine/Engine$1;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine$1;->this$0:Lcom/snatik/matches/engine/Engine;

    invoke-static {v0}, Lcom/snatik/matches/engine/Engine;->access$000(Lcom/snatik/matches/engine/Engine;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 123
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/engine/Engine$1;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
