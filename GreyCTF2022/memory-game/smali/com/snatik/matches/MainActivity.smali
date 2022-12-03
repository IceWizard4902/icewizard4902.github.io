.class public Lcom/snatik/matches/MainActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "MainActivity.java"


# instance fields
.field private mBackgroundImage:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private setBackgroundImage()V
    .locals 3

    .line 65
    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenWidth()I

    move-result v0

    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenHeight()I

    move-result v1

    const v2, 0x7f060076

    invoke-static {v2, v0, v1}, Lcom/snatik/matches/utils/Utils;->scaleDown(III)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 66
    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenHeight()I

    move-result v1

    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenWidth()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/snatik/matches/utils/Utils;->crop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v1, 0x2

    .line 67
    invoke-static {v0, v1}, Lcom/snatik/matches/utils/Utils;->downscaleBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/snatik/matches/MainActivity;->mBackgroundImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .line 54
    invoke-static {}, Lcom/snatik/matches/ui/PopupManager;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-static {}, Lcom/snatik/matches/ui/PopupManager;->closePopup()V

    .line 56
    invoke-static {}, Lcom/snatik/matches/engine/ScreenController;->getLastScreen()Lcom/snatik/matches/engine/ScreenController$Screen;

    move-result-object v0

    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne v0, v1, :cond_1

    .line 57
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v1, Lcom/snatik/matches/events/ui/BackGameEvent;

    invoke-direct {v1}, Lcom/snatik/matches/events/ui/BackGameEvent;-><init>()V

    invoke-virtual {v0, v1}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    goto :goto_0

    .line 59
    :cond_0
    invoke-static {}, Lcom/snatik/matches/engine/ScreenController;->getInstance()Lcom/snatik/matches/engine/ScreenController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/snatik/matches/engine/ScreenController;->onBack()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 60
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onBackPressed()V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 24
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-virtual {p0}, Lcom/snatik/matches/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sput-object p1, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    .line 27
    invoke-static {}, Lcom/snatik/matches/engine/Engine;->getInstance()Lcom/snatik/matches/engine/Engine;

    move-result-object p1

    sput-object p1, Lcom/snatik/matches/common/Shared;->engine:Lcom/snatik/matches/engine/Engine;

    .line 28
    invoke-static {}, Lcom/snatik/matches/events/EventBus;->getInstance()Lcom/snatik/matches/events/EventBus;

    move-result-object p1

    sput-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    const p1, 0x7f09001c

    .line 30
    invoke-virtual {p0, p1}, Lcom/snatik/matches/MainActivity;->setContentView(I)V

    const p1, 0x7f07001e

    .line 31
    invoke-virtual {p0, p1}, Lcom/snatik/matches/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/snatik/matches/MainActivity;->mBackgroundImage:Landroid/widget/ImageView;

    .line 33
    sput-object p0, Lcom/snatik/matches/common/Shared;->activity:Landroid/support/v4/app/FragmentActivity;

    .line 34
    sget-object p1, Lcom/snatik/matches/common/Shared;->engine:Lcom/snatik/matches/engine/Engine;

    invoke-virtual {p1}, Lcom/snatik/matches/engine/Engine;->start()V

    .line 35
    sget-object p1, Lcom/snatik/matches/common/Shared;->engine:Lcom/snatik/matches/engine/Engine;

    iget-object v0, p0, Lcom/snatik/matches/MainActivity;->mBackgroundImage:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/Engine;->setBackgroundImageView(Landroid/widget/ImageView;)V

    .line 38
    invoke-direct {p0}, Lcom/snatik/matches/MainActivity;->setBackgroundImage()V

    .line 41
    invoke-static {}, Lcom/snatik/matches/engine/ScreenController;->getInstance()Lcom/snatik/matches/engine/ScreenController;

    move-result-object p1

    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->MENU:Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/ScreenController;->openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 48
    sget-object v0, Lcom/snatik/matches/common/Shared;->engine:Lcom/snatik/matches/engine/Engine;

    invoke-virtual {v0}, Lcom/snatik/matches/engine/Engine;->stop()V

    .line 49
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    return-void
.end method
