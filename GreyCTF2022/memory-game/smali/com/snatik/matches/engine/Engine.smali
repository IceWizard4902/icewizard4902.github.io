.class public Lcom/snatik/matches/engine/Engine;
.super Lcom/snatik/matches/events/EventObserverAdapter;
.source "Engine.java"


# static fields
.field private static mInstance:Lcom/snatik/matches/engine/Engine;


# instance fields
.field private mBackgroundImage:Landroid/widget/ImageView;

.field private mFlippedId:I

.field private mHandler:Landroid/os/Handler;

.field private mPlayingGame:Lcom/snatik/matches/model/Game;

.field private mScreenController:Lcom/snatik/matches/engine/ScreenController;

.field private mSelectedTheme:Lcom/snatik/matches/themes/Theme;

.field private mToFlip:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 77
    invoke-direct {p0}, Lcom/snatik/matches/events/EventObserverAdapter;-><init>()V

    const/4 v0, 0x0

    .line 69
    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    const/4 v0, -0x1

    .line 70
    iput v0, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    .line 71
    iput v0, p0, Lcom/snatik/matches/engine/Engine;->mToFlip:I

    .line 78
    invoke-static {}, Lcom/snatik/matches/engine/ScreenController;->getInstance()Lcom/snatik/matches/engine/ScreenController;

    move-result-object v0

    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mScreenController:Lcom/snatik/matches/engine/ScreenController;

    .line 79
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/engine/Engine;)Landroid/widget/ImageView;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/snatik/matches/engine/Engine;->mBackgroundImage:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/snatik/matches/engine/Engine;)Lcom/snatik/matches/themes/Theme;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/snatik/matches/engine/Engine;->mSelectedTheme:Lcom/snatik/matches/themes/Theme;

    return-object p0
.end method

.method private arrangeBoard()V
    .locals 9

    .line 204
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v0, v0, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    .line 205
    new-instance v1, Lcom/snatik/matches/model/BoardArrangment;

    invoke-direct {v1}, Lcom/snatik/matches/model/BoardArrangment;-><init>()V

    .line 209
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 210
    :goto_0
    iget v5, v0, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    if-ge v4, v5, :cond_0

    .line 211
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 215
    :cond_0
    invoke-static {v2}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 218
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v0, v0, Lcom/snatik/matches/model/Game;->theme:Lcom/snatik/matches/themes/Theme;

    iget-object v0, v0, Lcom/snatik/matches/themes/Theme;->tileImageUrls:Ljava/util/List;

    .line 219
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 220
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, v1, Lcom/snatik/matches/model/BoardArrangment;->pairs:Ljava/util/Map;

    .line 221
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, v1, Lcom/snatik/matches/model/BoardArrangment;->tileUrls:Ljava/util/Map;

    const/4 v4, 0x0

    .line 223
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_2

    add-int/lit8 v5, v3, 0x1

    .line 224
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 226
    iget-object v6, v1, Lcom/snatik/matches/model/BoardArrangment;->pairs:Ljava/util/Map;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    iget-object v6, v1, Lcom/snatik/matches/model/BoardArrangment;->pairs:Ljava/util/Map;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    iget-object v6, v1, Lcom/snatik/matches/model/BoardArrangment;->tileUrls:Ljava/util/Map;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    iget-object v3, v1, Lcom/snatik/matches/model/BoardArrangment;->tileUrls:Ljava/util/Map;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    move v3, v5

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 237
    :cond_2
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iput-object v1, v0, Lcom/snatik/matches/model/Game;->boardArrangment:Lcom/snatik/matches/model/BoardArrangment;

    return-void
.end method

.method public static getInstance()Lcom/snatik/matches/engine/Engine;
    .locals 1

    .line 83
    sget-object v0, Lcom/snatik/matches/engine/Engine;->mInstance:Lcom/snatik/matches/engine/Engine;

    if-nez v0, :cond_0

    .line 84
    new-instance v0, Lcom/snatik/matches/engine/Engine;

    invoke-direct {v0}, Lcom/snatik/matches/engine/Engine;-><init>()V

    sput-object v0, Lcom/snatik/matches/engine/Engine;->mInstance:Lcom/snatik/matches/engine/Engine;

    .line 86
    :cond_0
    sget-object v0, Lcom/snatik/matches/engine/Engine;->mInstance:Lcom/snatik/matches/engine/Engine;

    return-object v0
.end method


# virtual methods
.method public getActiveGame()Lcom/snatik/matches/model/Game;
    .locals 1

    .line 376
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    return-object v0
.end method

.method public getSelectedTheme()Lcom/snatik/matches/themes/Theme;
    .locals 1

    .line 380
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mSelectedTheme:Lcom/snatik/matches/themes/Theme;

    return-object v0
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/BackGameEvent;)V
    .locals 1

    .line 156
    invoke-static {}, Lcom/snatik/matches/ui/PopupManager;->closePopup()V

    .line 157
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mScreenController:Lcom/snatik/matches/engine/ScreenController;

    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->DIFFICULTY:Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/ScreenController;->openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/DifficultySelectedEvent;)V
    .locals 2

    const/4 v0, -0x1

    .line 190
    iput v0, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    .line 191
    new-instance v0, Lcom/snatik/matches/model/Game;

    invoke-direct {v0}, Lcom/snatik/matches/model/Game;-><init>()V

    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    .line 192
    new-instance v1, Lcom/snatik/matches/model/BoardConfiguration;

    iget p1, p1, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;->difficulty:I

    invoke-direct {v1, p1}, Lcom/snatik/matches/model/BoardConfiguration;-><init>(I)V

    iput-object v1, v0, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    .line 193
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mSelectedTheme:Lcom/snatik/matches/themes/Theme;

    iput-object v0, p1, Lcom/snatik/matches/model/Game;->theme:Lcom/snatik/matches/themes/Theme;

    .line 194
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object p1, p1, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget p1, p1, Lcom/snatik/matches/model/BoardConfiguration;->numTiles:I

    iput p1, p0, Lcom/snatik/matches/engine/Engine;->mToFlip:I

    .line 197
    invoke-direct {p0}, Lcom/snatik/matches/engine/Engine;->arrangeBoard()V

    .line 200
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mScreenController:Lcom/snatik/matches/engine/ScreenController;

    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->GAME:Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/ScreenController;->openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/FlipCardEvent;)V
    .locals 11

    .line 244
    iget p1, p1, Lcom/snatik/matches/events/ui/FlipCardEvent;->id:I

    .line 245
    iget v0, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 246
    iput p1, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    goto/16 :goto_9

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v0, v0, Lcom/snatik/matches/model/Game;->boardArrangment:Lcom/snatik/matches/model/BoardArrangment;

    iget v2, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    invoke-virtual {v0, v2, p1}, Lcom/snatik/matches/model/BoardArrangment;->isPair(II)Z

    move-result v0

    const-wide/16 v2, 0x3e8

    if-eqz v0, :cond_6

    .line 252
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v4, Lcom/snatik/matches/events/engine/HidePairCardsEvent;

    iget v5, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    invoke-direct {v4, v5, p1}, Lcom/snatik/matches/events/engine/HidePairCardsEvent;-><init>(II)V

    invoke-virtual {v0, v4, v2, v3}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;J)V

    .line 254
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/snatik/matches/engine/Engine$3;

    invoke-direct {v0, p0}, Lcom/snatik/matches/engine/Engine$3;-><init>(Lcom/snatik/matches/engine/Engine;)V

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 261
    iget p1, p0, Lcom/snatik/matches/engine/Engine;->mToFlip:I

    const/4 v0, 0x2

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/snatik/matches/engine/Engine;->mToFlip:I

    if-nez p1, :cond_7

    .line 263
    invoke-static {}, Lcom/snatik/matches/utils/Clock;->getInstance()Lcom/snatik/matches/utils/Clock;

    move-result-object p1

    invoke-virtual {p1}, Lcom/snatik/matches/utils/Clock;->getPassedTime()J

    move-result-wide v4

    div-long/2addr v4, v2

    long-to-int p1, v4

    .line 264
    invoke-static {}, Lcom/snatik/matches/utils/Clock;->getInstance()Lcom/snatik/matches/utils/Clock;

    move-result-object v2

    invoke-virtual {v2}, Lcom/snatik/matches/utils/Clock;->pause()V

    .line 265
    iget-object v2, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v2, v2, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v2, v2, Lcom/snatik/matches/model/BoardConfiguration;->time:I

    .line 266
    new-instance v3, Lcom/snatik/matches/model/GameState;

    invoke-direct {v3}, Lcom/snatik/matches/model/GameState;-><init>()V

    .line 267
    iget-object v4, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iput-object v3, v4, Lcom/snatik/matches/model/Game;->gameState:Lcom/snatik/matches/model/GameState;

    sub-int v4, v2, p1

    .line 269
    iput v4, v3, Lcom/snatik/matches/model/GameState;->remainedSeconds:I

    .line 270
    iput p1, v3, Lcom/snatik/matches/model/GameState;->passedSeconds:I

    .line 273
    div-int/lit8 v4, v2, 0x2

    const/4 v5, 0x0

    if-gt p1, v4, :cond_1

    const/4 v4, 0x3

    .line 274
    iput v4, v3, Lcom/snatik/matches/model/GameState;->achievedStars:I

    goto :goto_0

    .line 275
    :cond_1
    div-int/lit8 v4, v2, 0x5

    sub-int v4, v2, v4

    if-gt p1, v4, :cond_2

    .line 276
    iput v0, v3, Lcom/snatik/matches/model/GameState;->achievedStars:I

    goto :goto_0

    :cond_2
    if-ge p1, v2, :cond_3

    const/4 v4, 0x1

    .line 278
    iput v4, v3, Lcom/snatik/matches/model/GameState;->achievedStars:I

    goto :goto_0

    .line 280
    :cond_3
    iput v5, v3, Lcom/snatik/matches/model/GameState;->achievedStars:I

    .line 284
    :goto_0
    iget-object v4, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v4, v4, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v4, v4, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    iget v6, v3, Lcom/snatik/matches/model/GameState;->remainedSeconds:I

    mul-int v4, v4, v6

    iget-object v6, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v6, v6, Lcom/snatik/matches/model/Game;->theme:Lcom/snatik/matches/themes/Theme;

    iget v6, v6, Lcom/snatik/matches/themes/Theme;->id:I

    mul-int v4, v4, v6

    iput v4, v3, Lcom/snatik/matches/model/GameState;->achievedScore:I

    .line 287
    iget-object v4, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v4, v4, Lcom/snatik/matches/model/Game;->theme:Lcom/snatik/matches/themes/Theme;

    iget v4, v4, Lcom/snatik/matches/themes/Theme;->id:I

    iget-object v6, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v6, v6, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v6, v6, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    iget v7, v3, Lcom/snatik/matches/model/GameState;->achievedStars:I

    invoke-static {v4, v6, v7}, Lcom/snatik/matches/common/Memory;->save(III)V

    .line 288
    iget-object v4, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v4, v4, Lcom/snatik/matches/model/Game;->theme:Lcom/snatik/matches/themes/Theme;

    iget v4, v4, Lcom/snatik/matches/themes/Theme;->id:I

    iget-object v6, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v6, v6, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v6, v6, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    iget v7, v3, Lcom/snatik/matches/model/GameState;->passedSeconds:I

    invoke-static {v4, v6, v7}, Lcom/snatik/matches/common/Memory;->saveTime(III)V

    .line 290
    sget-object v4, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v6, Lcom/snatik/matches/events/engine/GameWonEvent;

    invoke-direct {v6, v3}, Lcom/snatik/matches/events/engine/GameWonEvent;-><init>(Lcom/snatik/matches/model/GameState;)V

    const-wide/16 v7, 0x4b0

    invoke-virtual {v4, v6, v7, v8}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;J)V

    .line 292
    iget-object v3, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v3, v3, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget v3, v3, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    const/4 v4, 0x6

    if-ne v3, v4, :cond_7

    if-ge p1, v2, :cond_7

    const/4 p1, 0x0

    :try_start_0
    const-string v2, "PBKDF2WithHmacSHA1"

    .line 297
    invoke-static {v2}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v2
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    const-string v3, "AES/CBC/PKCS5Padding"

    .line 298
    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception v3

    goto :goto_2

    :catch_1
    move-exception v3

    goto :goto_2

    :catch_2
    move-exception v3

    goto :goto_1

    :catch_3
    move-exception v3

    :goto_1
    move-object v2, p1

    .line 300
    :goto_2
    invoke-virtual {v3}, Ljava/security/GeneralSecurityException;->printStackTrace()V

    move-object v3, p1

    .line 303
    :goto_3
    invoke-static {}, Lcom/snatik/matches/rng/Rnd;->reSeed()V

    const/16 v4, 0x10

    new-array v6, v4, [B

    const/4 v7, 0x0

    :goto_4
    const/16 v8, 0x100

    if-ge v7, v4, :cond_4

    .line 307
    invoke-static {v8}, Lcom/snatik/matches/rng/Rnd;->get(I)I

    move-result v8

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 311
    :cond_4
    new-instance v7, Ljavax/crypto/spec/PBEKeySpec;

    const-string v9, "1.01.001007"

    invoke-virtual {v9}, Ljava/lang/String;->toCharArray()[C

    move-result-object v9

    const/high16 v10, 0x10000

    invoke-direct {v7, v9, v6, v10, v8}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 313
    :try_start_2
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v2, v7}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v2

    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v2

    const-string v7, "AES"

    invoke-direct {v6, v2, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V
    :try_end_2
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_2 .. :try_end_2} :catch_4

    move-object p1, v6

    goto :goto_5

    :catch_4
    move-exception v2

    .line 315
    invoke-virtual {v2}, Ljava/security/spec/InvalidKeySpecException;->printStackTrace()V

    :goto_5
    new-array v2, v4, [B

    const/4 v6, 0x0

    :goto_6
    if-ge v6, v4, :cond_5

    .line 320
    invoke-static {v8}, Lcom/snatik/matches/rng/Rnd;->get(I)I

    move-result v7

    int-to-byte v7, v7

    aput-byte v7, v2, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 323
    :cond_5
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v4, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 346
    :try_start_3
    invoke-virtual {v3, v0, p1, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_3
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_5

    goto :goto_7

    :catch_5
    move-exception p1

    .line 350
    invoke-virtual {p1}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_7

    :catch_6
    move-exception p1

    .line 348
    invoke-virtual {p1}, Ljava/security/InvalidAlgorithmParameterException;->printStackTrace()V

    :goto_7
    const-string p1, "diDrBf4+uZMtDV+0k/3BCGM4xyTpEyGEuUFYegIaSjQyQcgfIfZRbvGQ9hHMqnuflNCKv4HW/NXq93j4QqLc/Q=="

    .line 356
    :try_start_4
    invoke-static {p1, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    invoke-virtual {v3, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    const-string v0, "FLAG"

    .line 357
    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, p1, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljavax/crypto/BadPaddingException; {:try_start_4 .. :try_end_4} :catch_8
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_4 .. :try_end_4} :catch_7

    goto :goto_8

    :catch_7
    move-exception p1

    .line 361
    invoke-virtual {p1}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_8

    :catch_8
    move-exception p1

    .line 359
    invoke-virtual {p1}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_8

    .line 368
    :cond_6
    sget-object p1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v0, Lcom/snatik/matches/events/engine/FlipDownCardsEvent;

    invoke-direct {v0}, Lcom/snatik/matches/events/engine/FlipDownCardsEvent;-><init>()V

    invoke-virtual {p1, v0, v2, v3}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;J)V

    .line 370
    :cond_7
    :goto_8
    iput v1, p0, Lcom/snatik/matches/engine/Engine;->mFlippedId:I

    :goto_9
    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/NextGameEvent;)V
    .locals 2

    .line 146
    invoke-static {}, Lcom/snatik/matches/ui/PopupManager;->closePopup()V

    .line 147
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object p1, p1, Lcom/snatik/matches/model/Game;->boardConfiguration:Lcom/snatik/matches/model/BoardConfiguration;

    iget p1, p1, Lcom/snatik/matches/model/BoardConfiguration;->difficulty:I

    .line 148
    iget-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    iget-object v0, v0, Lcom/snatik/matches/model/Game;->gameState:Lcom/snatik/matches/model/GameState;

    iget v0, v0, Lcom/snatik/matches/model/GameState;->achievedStars:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x6

    if-ge p1, v0, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 151
    :cond_0
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    new-instance v1, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;

    invoke-direct {v1, p1}, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/snatik/matches/events/EventBus;->notify(Lcom/snatik/matches/events/Event;)V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/ResetBackgroundEvent;)V
    .locals 1

    .line 119
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mBackgroundImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 121
    check-cast p1, Landroid/graphics/drawable/TransitionDrawable;

    const/16 v0, 0x7d0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/TransitionDrawable;->reverseTransition(I)V

    goto :goto_0

    .line 123
    :cond_0
    new-instance p1, Lcom/snatik/matches/engine/Engine$1;

    invoke-direct {p1, p0}, Lcom/snatik/matches/engine/Engine$1;-><init>(Lcom/snatik/matches/engine/Engine;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    .line 135
    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/Engine$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_0
    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/StartEvent;)V
    .locals 1

    .line 141
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mScreenController:Lcom/snatik/matches/engine/ScreenController;

    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->THEME_SELECT:Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/ScreenController;->openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V

    return-void
.end method

.method public onEvent(Lcom/snatik/matches/events/ui/ThemeSelectedEvent;)V
    .locals 1

    .line 162
    iget-object p1, p1, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;->theme:Lcom/snatik/matches/themes/Theme;

    iput-object p1, p0, Lcom/snatik/matches/engine/Engine;->mSelectedTheme:Lcom/snatik/matches/themes/Theme;

    .line 163
    iget-object p1, p0, Lcom/snatik/matches/engine/Engine;->mScreenController:Lcom/snatik/matches/engine/ScreenController;

    sget-object v0, Lcom/snatik/matches/engine/ScreenController$Screen;->DIFFICULTY:Lcom/snatik/matches/engine/ScreenController$Screen;

    invoke-virtual {p1, v0}, Lcom/snatik/matches/engine/ScreenController;->openScreen(Lcom/snatik/matches/engine/ScreenController$Screen;)V

    .line 164
    new-instance p1, Lcom/snatik/matches/engine/Engine$2;

    invoke-direct {p1, p0}, Lcom/snatik/matches/engine/Engine$2;-><init>(Lcom/snatik/matches/engine/Engine;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    .line 185
    invoke-virtual {p1, v0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public setBackgroundImageView(Landroid/widget/ImageView;)V
    .locals 0

    .line 384
    iput-object p1, p0, Lcom/snatik/matches/engine/Engine;->mBackgroundImage:Landroid/widget/ImageView;

    return-void
.end method

.method public start()V
    .locals 2

    .line 90
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 91
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/FlipCardEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 92
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/StartEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 93
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 94
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/BackGameEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 95
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/NextGameEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 96
    sget-object v0, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v1, Lcom/snatik/matches/events/ui/ResetBackgroundEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/snatik/matches/events/EventBus;->listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    return-void
.end method

.method public stop()V
    .locals 3

    const/4 v0, 0x0

    .line 100
    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mPlayingGame:Lcom/snatik/matches/model/Game;

    .line 101
    iget-object v1, p0, Lcom/snatik/matches/engine/Engine;->mBackgroundImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 102
    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mBackgroundImage:Landroid/widget/ImageView;

    .line 103
    iget-object v1, p0, Lcom/snatik/matches/engine/Engine;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 104
    iput-object v0, p0, Lcom/snatik/matches/engine/Engine;->mHandler:Landroid/os/Handler;

    .line 106
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/DifficultySelectedEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 107
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/FlipCardEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 108
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/StartEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 109
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/ThemeSelectedEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 110
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/BackGameEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 111
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/NextGameEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 112
    sget-object v1, Lcom/snatik/matches/common/Shared;->eventBus:Lcom/snatik/matches/events/EventBus;

    sget-object v2, Lcom/snatik/matches/events/ui/ResetBackgroundEvent;->TYPE:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Lcom/snatik/matches/events/EventBus;->unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V

    .line 114
    sput-object v0, Lcom/snatik/matches/engine/Engine;->mInstance:Lcom/snatik/matches/engine/Engine;

    return-void
.end method
