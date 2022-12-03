.class public final enum Lcom/snatik/matches/engine/ScreenController$Screen;
.super Ljava/lang/Enum;
.source "ScreenController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snatik/matches/engine/ScreenController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Screen"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/snatik/matches/engine/ScreenController$Screen;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/snatik/matches/engine/ScreenController$Screen;

.field public static final enum DIFFICULTY:Lcom/snatik/matches/engine/ScreenController$Screen;

.field public static final enum GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

.field public static final enum MENU:Lcom/snatik/matches/engine/ScreenController$Screen;

.field public static final enum THEME_SELECT:Lcom/snatik/matches/engine/ScreenController$Screen;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 35
    new-instance v0, Lcom/snatik/matches/engine/ScreenController$Screen;

    const-string v1, "MENU"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/snatik/matches/engine/ScreenController$Screen;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->MENU:Lcom/snatik/matches/engine/ScreenController$Screen;

    .line 36
    new-instance v1, Lcom/snatik/matches/engine/ScreenController$Screen;

    const-string v3, "GAME"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/snatik/matches/engine/ScreenController$Screen;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    .line 37
    new-instance v3, Lcom/snatik/matches/engine/ScreenController$Screen;

    const-string v5, "DIFFICULTY"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/snatik/matches/engine/ScreenController$Screen;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/snatik/matches/engine/ScreenController$Screen;->DIFFICULTY:Lcom/snatik/matches/engine/ScreenController$Screen;

    .line 38
    new-instance v5, Lcom/snatik/matches/engine/ScreenController$Screen;

    const-string v7, "THEME_SELECT"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/snatik/matches/engine/ScreenController$Screen;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/snatik/matches/engine/ScreenController$Screen;->THEME_SELECT:Lcom/snatik/matches/engine/ScreenController$Screen;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/snatik/matches/engine/ScreenController$Screen;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 34
    sput-object v7, Lcom/snatik/matches/engine/ScreenController$Screen;->$VALUES:[Lcom/snatik/matches/engine/ScreenController$Screen;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/snatik/matches/engine/ScreenController$Screen;
    .locals 1

    .line 34
    const-class v0, Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/snatik/matches/engine/ScreenController$Screen;

    return-object p0
.end method

.method public static values()[Lcom/snatik/matches/engine/ScreenController$Screen;
    .locals 1

    .line 34
    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->$VALUES:[Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-virtual {v0}, [Lcom/snatik/matches/engine/ScreenController$Screen;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/snatik/matches/engine/ScreenController$Screen;

    return-object v0
.end method
