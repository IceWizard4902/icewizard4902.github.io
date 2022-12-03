.class Lcom/snatik/matches/common/Music$1;
.super Ljava/lang/Object;
.source "Music.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/common/Music;->playCorrent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 18
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 19
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->release()V

    return-void
.end method
