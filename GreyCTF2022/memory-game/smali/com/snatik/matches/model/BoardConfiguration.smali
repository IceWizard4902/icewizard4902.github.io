.class public Lcom/snatik/matches/model/BoardConfiguration;
.super Ljava/lang/Object;
.source "BoardConfiguration.java"


# static fields
.field private static final _12:I = 0xc

.field private static final _18:I = 0x12

.field private static final _28:I = 0x1c

.field private static final _32:I = 0x20

.field private static final _50:I = 0x32

.field private static final _6:I = 0x6


# instance fields
.field public final difficulty:I

.field public final numRows:I

.field public final numTiles:I

.field public final numTilesInRow:I

.field public final time:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    const/4 v0, 0x6

    const/4 v1, 0x4

    const/4 v2, 0x3

    packed-switch p1, :pswitch_data_0

    .line 58
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Select one of predefined sizes"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    const/16 p1, 0x32

    .line 52
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    const/16 p1, 0xa

    .line 53
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    const/4 p1, 0x5

    .line 54
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    const/16 p1, 0x14

    .line 55
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    goto :goto_0

    :pswitch_1
    const/16 p1, 0x20

    .line 46
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    const/16 p1, 0x8

    .line 47
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    .line 48
    iput v1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    const/16 p1, 0xb4

    .line 49
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    goto :goto_0

    :pswitch_2
    const/16 p1, 0x1c

    .line 40
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    const/4 p1, 0x7

    .line 41
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    .line 42
    iput v1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    const/16 p1, 0x96

    .line 43
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    goto :goto_0

    :pswitch_3
    const/16 p1, 0x12

    .line 34
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    .line 35
    iput v0, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    .line 36
    iput v2, p0, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    const/16 p1, 0x78

    .line 37
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    goto :goto_0

    :pswitch_4
    const/16 p1, 0xc

    .line 28
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    .line 29
    iput v1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    .line 30
    iput v2, p0, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    const/16 p1, 0x5a

    .line 31
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    goto :goto_0

    .line 22
    :pswitch_5
    iput v0, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    .line 23
    iput v2, p0, Lcom/snatik/matches/model/BoardConfiguration;->numTilesInRow:I

    const/4 p1, 0x2

    .line 24
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->numRows:I

    const/16 p1, 0x3c

    .line 25
    iput p1, p0, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
