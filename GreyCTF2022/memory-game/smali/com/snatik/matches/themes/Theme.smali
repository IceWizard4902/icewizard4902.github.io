.class public Lcom/snatik/matches/themes/Theme;
.super Ljava/lang/Object;
.source "Theme.java"


# instance fields
.field public adKeywords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public backgroundImageUrl:Ljava/lang/String;

.field public backgroundSoundUrl:Ljava/lang/String;

.field public clickSoundUrl:Ljava/lang/String;

.field public id:I

.field public name:Ljava/lang/String;

.field public tileImageUrls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
