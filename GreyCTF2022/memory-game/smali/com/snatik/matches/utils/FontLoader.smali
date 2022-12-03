.class public Lcom/snatik/matches/utils/FontLoader;
.super Ljava/lang/Object;
.source "FontLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/snatik/matches/utils/FontLoader$Font;
    }
.end annotation


# static fields
.field public static final GROBOLD:I

.field private static fonts:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field private static fontsLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/snatik/matches/utils/FontLoader;->fonts:Landroid/util/SparseArray;

    const/4 v0, 0x0

    .line 13
    sput-boolean v0, Lcom/snatik/matches/utils/FontLoader;->fontsLoaded:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTypeface(Landroid/content/Context;Lcom/snatik/matches/utils/FontLoader$Font;)Landroid/graphics/Typeface;
    .locals 1

    .line 54
    sget-boolean v0, Lcom/snatik/matches/utils/FontLoader;->fontsLoaded:Z

    if-nez v0, :cond_0

    .line 55
    invoke-static {p0}, Lcom/snatik/matches/utils/FontLoader;->loadFonts(Landroid/content/Context;)V

    .line 57
    :cond_0
    sget-object p0, Lcom/snatik/matches/utils/FontLoader;->fonts:Landroid/util/SparseArray;

    invoke-static {p1}, Lcom/snatik/matches/utils/FontLoader$Font;->access$000(Lcom/snatik/matches/utils/FontLoader$Font;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static loadFonts(Landroid/content/Context;)V
    .locals 4

    const/4 v0, 0x0

    .line 37
    :goto_0
    invoke-static {}, Lcom/snatik/matches/utils/FontLoader$Font;->values()[Lcom/snatik/matches/utils/FontLoader$Font;

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 38
    sget-object v1, Lcom/snatik/matches/utils/FontLoader;->fonts:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v0}, Lcom/snatik/matches/utils/FontLoader$Font;->getByVal(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    .line 40
    sput-boolean p0, Lcom/snatik/matches/utils/FontLoader;->fontsLoaded:Z

    return-void
.end method

.method public static setBoldTypeface(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;)V
    .locals 1

    const/4 v0, 0x1

    .line 85
    invoke-static {p0, p1, p2, v0}, Lcom/snatik/matches/utils/FontLoader;->setTypeFaceToTextViews(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;I)V

    return-void
.end method

.method private static setTypeFaceToTextViews(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;I)V
    .locals 1

    .line 89
    sget-boolean v0, Lcom/snatik/matches/utils/FontLoader;->fontsLoaded:Z

    if-nez v0, :cond_0

    .line 90
    invoke-static {p0}, Lcom/snatik/matches/utils/FontLoader;->loadFonts(Landroid/content/Context;)V

    .line 92
    :cond_0
    sget-object p0, Lcom/snatik/matches/utils/FontLoader;->fonts:Landroid/util/SparseArray;

    invoke-static {p2}, Lcom/snatik/matches/utils/FontLoader$Font;->access$000(Lcom/snatik/matches/utils/FontLoader$Font;)I

    move-result p2

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Typeface;

    const/4 p2, 0x0

    .line 94
    :goto_0
    array-length v0, p1

    if-ge p2, v0, :cond_2

    .line 95
    aget-object v0, p1, p2

    if-eqz v0, :cond_1

    .line 96
    aget-object v0, p1, p2

    invoke-virtual {v0, p0, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static setTypeface(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;)V
    .locals 1

    const/4 v0, 0x0

    .line 71
    invoke-static {p0, p1, p2, v0}, Lcom/snatik/matches/utils/FontLoader;->setTypeFaceToTextViews(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;I)V

    return-void
.end method
