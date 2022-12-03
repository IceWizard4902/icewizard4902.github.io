.class public Lcom/snatik/matches/common/Music;
.super Ljava/lang/Object;
.source "Music.java"


# static fields
.field public static OFF:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static playBackgroundMusic()V
    .locals 0

    return-void
.end method

.method public static playCorrent()V
    .locals 2

    .line 13
    sget-boolean v0, Lcom/snatik/matches/common/Music;->OFF:Z

    if-nez v0, :cond_0

    .line 14
    sget-object v0, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    const v1, 0x7f0a0001

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    .line 15
    new-instance v1, Lcom/snatik/matches/common/Music$1;

    invoke-direct {v1}, Lcom/snatik/matches/common/Music$1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 24
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    :cond_0
    return-void
.end method

.method public static showStar()V
    .locals 2

    .line 33
    sget-boolean v0, Lcom/snatik/matches/common/Music;->OFF:Z

    if-nez v0, :cond_0

    .line 34
    sget-object v0, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    const v1, 0x7f0a0002

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    .line 35
    new-instance v1, Lcom/snatik/matches/common/Music$2;

    invoke-direct {v1}, Lcom/snatik/matches/common/Music$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 44
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    :cond_0
    return-void
.end method
