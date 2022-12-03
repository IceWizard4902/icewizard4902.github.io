.class Lcom/snatik/matches/engine/Engine$3;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/engine/Engine;->onEvent(Lcom/snatik/matches/events/ui/FlipCardEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/engine/Engine;


# direct methods
.method constructor <init>(Lcom/snatik/matches/engine/Engine;)V
    .locals 0

    .line 254
    iput-object p1, p0, Lcom/snatik/matches/engine/Engine$3;->this$0:Lcom/snatik/matches/engine/Engine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 258
    invoke-static {}, Lcom/snatik/matches/common/Music;->playCorrent()V

    return-void
.end method
