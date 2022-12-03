.class public final enum Lcom/snatik/matches/utils/FontLoader$Font;
.super Ljava/lang/Enum;
.source "FontLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snatik/matches/utils/FontLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Font"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/snatik/matches/utils/FontLoader$Font;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/snatik/matches/utils/FontLoader$Font;

.field public static final enum GROBOLD:Lcom/snatik/matches/utils/FontLoader$Font;


# instance fields
.field private path:Ljava/lang/String;

.field private val:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 16
    new-instance v0, Lcom/snatik/matches/utils/FontLoader$Font;

    const-string v1, "GROBOLD"

    const/4 v2, 0x0

    const-string v3, "fonts/grobold.ttf"

    invoke-direct {v0, v1, v2, v2, v3}, Lcom/snatik/matches/utils/FontLoader$Font;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/snatik/matches/utils/FontLoader$Font;->GROBOLD:Lcom/snatik/matches/utils/FontLoader$Font;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/snatik/matches/utils/FontLoader$Font;

    aput-object v0, v1, v2

    .line 15
    sput-object v1, Lcom/snatik/matches/utils/FontLoader$Font;->$VALUES:[Lcom/snatik/matches/utils/FontLoader$Font;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 22
    iput p3, p0, Lcom/snatik/matches/utils/FontLoader$Font;->val:I

    .line 23
    iput-object p4, p0, Lcom/snatik/matches/utils/FontLoader$Font;->path:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/utils/FontLoader$Font;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/snatik/matches/utils/FontLoader$Font;->val:I

    return p0
.end method

.method public static getByVal(I)Ljava/lang/String;
    .locals 5

    .line 27
    invoke-static {}, Lcom/snatik/matches/utils/FontLoader$Font;->values()[Lcom/snatik/matches/utils/FontLoader$Font;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 28
    iget v4, v3, Lcom/snatik/matches/utils/FontLoader$Font;->val:I

    if-ne v4, p0, :cond_0

    .line 29
    iget-object p0, v3, Lcom/snatik/matches/utils/FontLoader$Font;->path:Ljava/lang/String;

    return-object p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/snatik/matches/utils/FontLoader$Font;
    .locals 1

    .line 15
    const-class v0, Lcom/snatik/matches/utils/FontLoader$Font;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/snatik/matches/utils/FontLoader$Font;

    return-object p0
.end method

.method public static values()[Lcom/snatik/matches/utils/FontLoader$Font;
    .locals 1

    .line 15
    sget-object v0, Lcom/snatik/matches/utils/FontLoader$Font;->$VALUES:[Lcom/snatik/matches/utils/FontLoader$Font;

    invoke-virtual {v0}, [Lcom/snatik/matches/utils/FontLoader$Font;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/snatik/matches/utils/FontLoader$Font;

    return-object v0
.end method
