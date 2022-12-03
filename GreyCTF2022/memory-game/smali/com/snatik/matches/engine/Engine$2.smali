.class Lcom/snatik/matches/engine/Engine$2;
.super Landroid/os/AsyncTask;
.source "Engine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/engine/Engine;->onEvent(Lcom/snatik/matches/events/ui/ThemeSelectedEvent;)V
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
        "Landroid/graphics/drawable/TransitionDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/engine/Engine;


# direct methods
.method constructor <init>(Lcom/snatik/matches/engine/Engine;)V
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/snatik/matches/engine/Engine$2;->this$0:Lcom/snatik/matches/engine/Engine;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/drawable/TransitionDrawable;
    .locals 4

    .line 168
    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenWidth()I

    move-result p1

    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenHeight()I

    move-result v0

    const v1, 0x7f060076

    invoke-static {v1, p1, v0}, Lcom/snatik/matches/utils/Utils;->scaleDown(III)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 169
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine$2;->this$0:Lcom/snatik/matches/engine/Engine;

    invoke-static {v0}, Lcom/snatik/matches/engine/Engine;->access$100(Lcom/snatik/matches/engine/Engine;)Lcom/snatik/matches/themes/Theme;

    move-result-object v0

    invoke-static {v0}, Lcom/snatik/matches/themes/Themes;->getBackgroundImage(Lcom/snatik/matches/themes/Theme;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 170
    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenHeight()I

    move-result v1

    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenWidth()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/snatik/matches/utils/Utils;->crop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    .line 172
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    sget-object v3, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    const/4 p1, 0x0

    aput-object v2, v1, p1

    .line 173
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    sget-object v2, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {p1, v2, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    const/4 v0, 0x1

    aput-object p1, v1, v0

    .line 174
    new-instance p1, Landroid/graphics/drawable/TransitionDrawable;

    invoke-direct {p1, v1}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 164
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/engine/Engine$2;->doInBackground([Ljava/lang/Void;)Landroid/graphics/drawable/TransitionDrawable;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/drawable/TransitionDrawable;)V
    .locals 1

    .line 180
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 181
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine$2;->this$0:Lcom/snatik/matches/engine/Engine;

    invoke-static {v0}, Lcom/snatik/matches/engine/Engine;->access$000(Lcom/snatik/matches/engine/Engine;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v0, 0x7d0

    .line 182
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 164
    check-cast p1, Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {p0, p1}, Lcom/snatik/matches/engine/Engine$2;->onPostExecute(Landroid/graphics/drawable/TransitionDrawable;)V

    return-void
.end method
