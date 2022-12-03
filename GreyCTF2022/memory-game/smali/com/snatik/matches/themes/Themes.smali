.class public Lcom/snatik/matches/themes/Themes;
.super Ljava/lang/Object;
.source "Themes.java"


# static fields
.field public static URI_DRAWABLE:Ljava/lang/String; = "drawable://"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAnimalsTheme()Lcom/snatik/matches/themes/Theme;
    .locals 8

    .line 15
    new-instance v0, Lcom/snatik/matches/themes/Theme;

    invoke-direct {v0}, Lcom/snatik/matches/themes/Theme;-><init>()V

    const/4 v1, 0x1

    .line 16
    iput v1, v0, Lcom/snatik/matches/themes/Theme;->id:I

    const-string v2, "Animals"

    .line 17
    iput-object v2, v0, Lcom/snatik/matches/themes/Theme;->name:Ljava/lang/String;

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "back_animals"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/snatik/matches/themes/Theme;->backgroundImageUrl:Ljava/lang/String;

    .line 19
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    const/4 v2, 0x1

    :goto_0
    const/16 v3, 0x1c

    if-gt v2, v3, :cond_0

    .line 22
    iget-object v3, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v5, v1, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const-string v6, "animals_%d"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static createEmojiTheme()Lcom/snatik/matches/themes/Theme;
    .locals 8

    .line 41
    new-instance v0, Lcom/snatik/matches/themes/Theme;

    invoke-direct {v0}, Lcom/snatik/matches/themes/Theme;-><init>()V

    const/4 v1, 0x3

    .line 42
    iput v1, v0, Lcom/snatik/matches/themes/Theme;->id:I

    const-string v1, "Emoji"

    .line 43
    iput-object v1, v0, Lcom/snatik/matches/themes/Theme;->name:Ljava/lang/String;

    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "background"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/snatik/matches/themes/Theme;->backgroundImageUrl:Ljava/lang/String;

    .line 45
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_0
    const/16 v3, 0x28

    if-gt v2, v3, :cond_0

    .line 48
    iget-object v3, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v5, v1, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const-string v6, "emoji_%d"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static createMosterTheme()Lcom/snatik/matches/themes/Theme;
    .locals 8

    .line 28
    new-instance v0, Lcom/snatik/matches/themes/Theme;

    invoke-direct {v0}, Lcom/snatik/matches/themes/Theme;-><init>()V

    const/4 v1, 0x2

    .line 29
    iput v1, v0, Lcom/snatik/matches/themes/Theme;->id:I

    const-string v1, "Mosters"

    .line 30
    iput-object v1, v0, Lcom/snatik/matches/themes/Theme;->name:Ljava/lang/String;

    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "back_horror"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/snatik/matches/themes/Theme;->backgroundImageUrl:Ljava/lang/String;

    .line 32
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_0
    const/16 v3, 0x28

    if-gt v2, v3, :cond_0

    .line 35
    iget-object v3, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v5, v1, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const-string v6, "mosters_%d"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static getBackgroundImage(Lcom/snatik/matches/themes/Theme;)Landroid/graphics/Bitmap;
    .locals 3

    .line 54
    iget-object p0, p0, Lcom/snatik/matches/themes/Theme;->backgroundImageUrl:Ljava/lang/String;

    sget-object v0, Lcom/snatik/matches/themes/Themes;->URI_DRAWABLE:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 55
    sget-object v0, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget-object v1, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {v0, p0, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    .line 56
    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenWidth()I

    move-result v0

    invoke-static {}, Lcom/snatik/matches/utils/Utils;->screenHeight()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/snatik/matches/utils/Utils;->scaleDown(III)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
