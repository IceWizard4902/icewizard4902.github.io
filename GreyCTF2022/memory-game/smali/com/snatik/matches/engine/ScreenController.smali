.class public Lcom/snatik/matches/engine/ScreenController;
.super Ljava/lang/Object;
.source "ScreenController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/snatik/matches/engine/ScreenController$Screen;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/snatik/matches/engine/ScreenController;

.field private static openedScreens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/snatik/matches/engine/ScreenController$Screen;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mFragmentManager:Landroid/support/v4/app/FragmentManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getFragment(Lcom/snatik/matches/engine/ScreenController$Screen;)Landroid/support/v4/app/Fragment;
    .locals 1

    .line 81
    sget-object v0, Lcom/snatik/matches/engine/ScreenController$1;->$SwitchMap$com$snatik$matches$engine$ScreenController$Screen:[I

    invoke-virtual {p1}, Lcom/snatik/matches/engine/ScreenController$Screen;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 89
    :cond_0
    new-instance p1, Lcom/snatik/matches/fragments/ThemeSelectFragment;

    invoke-direct {p1}, Lcom/snatik/matches/fragments/ThemeSelectFragment;-><init>()V

    return-object p1

    .line 87
    :cond_1
    new-instance p1, Lcom/snatik/matches/fragments/GameFragment;

    invoke-direct {p1}, Lcom/snatik/matches/fragments/GameFragment;-><init>()V

    return-object p1

    .line 85
    :cond_2
    new-instance p1, Lcom/snatik/matches/fragments/DifficultySelectFragment;

    invoke-direct {p1}, Lcom/snatik/matches/fragments/DifficultySelectFragment;-><init>()V

    return-object p1

    .line 83
    :cond_3
    new-instance p1, Lcom/snatik/matches/fragments/MenuFragment;

    invoke-direct {p1}, Lcom/snatik/matches/fragments/MenuFragment;-><init>()V

    return-object p1
.end method

.method public static getInstance()Lcom/snatik/matches/engine/ScreenController;
    .locals 1

    .line 28
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->mInstance:Lcom/snatik/matches/engine/ScreenController;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/snatik/matches/engine/ScreenController;

    invoke-direct {v0}, Lcom/snatik/matches/engine/ScreenController;-><init>()V

    sput-object v0, Lcom/snatik/matches/engine/ScreenController;->mInstance:Lcom/snatik/matches/engine/ScreenController;

    .line 31
    :cond_0
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->mInstance:Lcom/snatik/matches/engine/ScreenController;

    return-object v0
.end method

.method public static getLastScreen()Lcom/snatik/matches/engine/ScreenController$Screen;
    .locals 2

    .line 42
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/snatik/matches/engine/ScreenController$Screen;

    return-object v0
.end method


# virtual methods
.method public onBack()Z
    .locals 5

    .line 62
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_4

    .line 63
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/snatik/matches/engine/ScreenController$Screen;

    .line 64
    sget-object v2, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 65
    sget-object v2, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    return v1

    .line 68
    :cond_0
    sget-object v2, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/snatik/matches/engine/ScreenController$Screen;

    .line 69
    sget-object v3, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 70
    invoke-virtual {p0, v2}, Lcom/snatik/matches/engine/ScreenController;->openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V

    .line 71
    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->THEME_SELECT:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-eq v2, v1, :cond_1

    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->MENU:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne v2, v1, :cond_3

    :cond_1
    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->DIFFICULTY:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne v0, v1, :cond_3

    .line 73
    :cond_2
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v1, Lcom/snatik/matches/events/ui/ResetBackgroundEvent;

    invoke-direct {v1}, Lcom/snatik/matches/events/ui/ResetBackgroundEvent;-><init>()V

    invoke-virtual {v0, v1}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    :cond_3
    const/4 v0, 0x0

    return v0

    :cond_4
    return v1
.end method

.method public openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V
    .locals 3

    .line 46
    sget-object v0, Lcom/snatik/matches/common/Shared;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/snatik/matches/engine/ScreenController;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 48
    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne p1, v0, :cond_0

    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne v0, v1, :cond_0

    .line 49
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 50
    :cond_0
    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->DIFFICULTY:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    if-ne v0, v1, :cond_1

    .line 51
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 54
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/snatik/matches/engine/ScreenController;->getFragment(Lcom/snatik/matches/engine/ScreenController$Screen;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/snatik/matches/engine/ScreenController;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f07003c

    .line 56
    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 57
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 58
    sget-object v0, Lcom/snatik/matches/engine/ScreenController;->openedScreens:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
