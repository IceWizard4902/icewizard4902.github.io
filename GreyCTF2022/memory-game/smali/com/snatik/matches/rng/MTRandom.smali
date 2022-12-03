.class Lcom/snatik/matches/rng/MTRandom;
.super Ljava/util/Random;
.source "MTRandom.java"


# static fields
.field private static final DEFAULT_SEED:J = 0x1571L

.field private static final LOWER_MASK:I = 0x7fffffff

.field private static final M:I = 0x18d

.field private static final MAGIC:[I

.field private static final MAGIC_FACTOR1:I = 0x6c078965

.field private static final MAGIC_FACTOR2:I = 0x19660d

.field private static final MAGIC_FACTOR3:I = 0x5d588b65

.field private static final MAGIC_MASK1:I = -0x62d3a980

.field private static final MAGIC_MASK2:I = -0x103a0000

.field private static final MAGIC_SEED:I = 0x12bd6aa

.field private static final N:I = 0x270

.field private static final UPPER_MASK:I = -0x80000000

.field private static final serialVersionUID:J = -0x725f0f797350346L


# instance fields
.field private transient compat:Z

.field private transient ibuf:[I

.field private transient mt:[I

.field private transient mti:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 46
    fill-array-data v0, :array_0

    sput-object v0, Lcom/snatik/matches/rng/MTRandom;->MAGIC:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        -0x66f74f21
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    const/4 v0, 0x0

    .line 58
    iput-boolean v0, p0, Lcom/snatik/matches/rng/MTRandom;->compat:Z

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 104
    invoke-direct {p0, p1, p2}, Ljava/util/Random;-><init>(J)V

    const/4 p1, 0x0

    .line 58
    iput-boolean p1, p0, Lcom/snatik/matches/rng/MTRandom;->compat:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 91
    invoke-direct {p0, v0, v1}, Ljava/util/Random;-><init>(J)V

    .line 92
    iput-boolean p1, p0, Lcom/snatik/matches/rng/MTRandom;->compat:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1571

    goto :goto_0

    .line 93
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/snatik/matches/rng/MTRandom;->setSeed(J)V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 119
    invoke-direct {p0, v0, v1}, Ljava/util/Random;-><init>(J)V

    const/4 v0, 0x0

    .line 58
    iput-boolean v0, p0, Lcom/snatik/matches/rng/MTRandom;->compat:Z

    .line 120
    invoke-virtual {p0, p1}, Lcom/snatik/matches/rng/MTRandom;->setSeed([B)V

    return-void
.end method

.method public constructor <init>([I)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 135
    invoke-direct {p0, v0, v1}, Ljava/util/Random;-><init>(J)V

    const/4 v0, 0x0

    .line 58
    iput-boolean v0, p0, Lcom/snatik/matches/rng/MTRandom;->compat:Z

    .line 136
    invoke-virtual {p0, p1}, Lcom/snatik/matches/rng/MTRandom;->setSeed([I)V

    return-void
.end method

.method public static pack([B)[I
    .locals 8

    .line 390
    array-length v0, p0

    array-length v1, p0

    add-int/lit8 v1, v1, 0x3

    ushr-int/lit8 v1, v1, 0x2

    .line 391
    new-array v2, v1, [I

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    add-int/lit8 v4, v3, 0x1

    shl-int/lit8 v5, v4, 0x2

    if-le v5, v0, :cond_0

    move v5, v0

    :cond_0
    add-int/lit8 v5, v5, -0x1

    .line 397
    aget-byte v6, p0, v5

    and-int/lit16 v6, v6, 0xff

    :goto_1
    and-int/lit8 v7, v5, 0x3

    if-eqz v7, :cond_1

    shl-int/lit8 v6, v6, 0x8

    add-int/lit8 v5, v5, -0x1

    aget-byte v7, p0, v5

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v6, v7

    goto :goto_1

    .line 399
    :cond_1
    aput v6, v2, v3

    move v3, v4

    goto :goto_0

    :cond_2
    return-object v2
.end method

.method private setSeed(I)V
    .locals 5

    .line 152
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    const/16 v1, 0x270

    if-nez v0, :cond_0

    new-array v0, v1, [I

    .line 153
    iput-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    const/4 v2, 0x0

    aput p1, v0, v2

    const/4 p1, 0x1

    .line 156
    :goto_0
    iput p1, p0, Lcom/snatik/matches/rng/MTRandom;->mti:I

    iget p1, p0, Lcom/snatik/matches/rng/MTRandom;->mti:I

    if-ge p1, v1, :cond_1

    .line 158
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    const v2, 0x6c078965

    add-int/lit8 v3, p1, -0x1

    aget v3, v0, v3

    add-int/lit8 v4, p1, -0x1

    aget v4, v0, v4

    ushr-int/lit8 v4, v4, 0x1e

    xor-int/2addr v3, v4

    mul-int v3, v3, v2

    add-int/2addr v3, p1

    aput v3, v0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected final declared-synchronized next(I)I
    .locals 9

    monitor-enter p0

    .line 307
    :try_start_0
    iget v0, p0, Lcom/snatik/matches/rng/MTRandom;->mti:I

    const/16 v1, 0x270

    if-lt v0, v1, :cond_2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0xe3

    const v3, 0x7fffffff

    const/high16 v4, -0x80000000

    if-ge v1, v2, :cond_0

    .line 318
    iget-object v2, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    aget v5, v2, v1

    and-int/2addr v4, v5

    add-int/lit8 v5, v1, 0x1

    aget v6, v2, v5

    and-int/2addr v3, v6

    or-int/2addr v3, v4

    add-int/lit16 v4, v1, 0x18d

    .line 319
    aget v4, v2, v4

    ushr-int/lit8 v6, v3, 0x1

    xor-int/2addr v4, v6

    sget-object v6, Lcom/snatik/matches/rng/MTRandom;->MAGIC:[I

    and-int/lit8 v3, v3, 0x1

    aget v3, v6, v3

    xor-int/2addr v3, v4

    aput v3, v2, v1

    move v1, v5

    goto :goto_0

    :cond_0
    :goto_1
    const/16 v2, 0x26f

    if-ge v1, v2, :cond_1

    .line 323
    iget-object v2, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    aget v5, v2, v1

    and-int/2addr v5, v4

    add-int/lit8 v6, v1, 0x1

    aget v7, v2, v6

    and-int/2addr v7, v3

    or-int/2addr v5, v7

    add-int/lit16 v7, v1, -0xe3

    .line 324
    aget v7, v2, v7

    ushr-int/lit8 v8, v5, 0x1

    xor-int/2addr v7, v8

    sget-object v8, Lcom/snatik/matches/rng/MTRandom;->MAGIC:[I

    and-int/lit8 v5, v5, 0x1

    aget v5, v8, v5

    xor-int/2addr v5, v7

    aput v5, v2, v1

    move v1, v6

    goto :goto_1

    .line 326
    :cond_1
    iget-object v1, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    aget v5, v1, v2

    and-int/2addr v4, v5

    aget v5, v1, v0

    and-int/2addr v3, v5

    or-int/2addr v3, v4

    const/16 v4, 0x18c

    .line 327
    aget v4, v1, v4

    ushr-int/lit8 v5, v3, 0x1

    xor-int/2addr v4, v5

    sget-object v5, Lcom/snatik/matches/rng/MTRandom;->MAGIC:[I

    and-int/lit8 v3, v3, 0x1

    aget v3, v5, v3

    xor-int/2addr v3, v4

    aput v3, v1, v2

    .line 328
    iput v0, p0, Lcom/snatik/matches/rng/MTRandom;->mti:I

    .line 330
    :cond_2
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    iget v1, p0, Lcom/snatik/matches/rng/MTRandom;->mti:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/snatik/matches/rng/MTRandom;->mti:I

    aget v0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    ushr-int/lit8 v1, v0, 0xb

    xor-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0x7

    const v2, -0x62d3a980

    and-int/2addr v1, v2

    xor-int/2addr v0, v1

    shl-int/lit8 v1, v0, 0xf

    const/high16 v2, -0x103a0000

    and-int/2addr v1, v2

    xor-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x12

    xor-int/2addr v0, v1

    rsub-int/lit8 p1, p1, 0x20

    ushr-int p1, v0, p1

    .line 337
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public final declared-synchronized setSeed(J)V
    .locals 3

    monitor-enter p0

    .line 179
    :try_start_0
    iget-boolean v0, p0, Lcom/snatik/matches/rng/MTRandom;->compat:Z

    if-eqz v0, :cond_0

    long-to-int p2, p1

    .line 181
    invoke-direct {p0, p2}, Lcom/snatik/matches/rng/MTRandom;->setSeed(I)V

    goto :goto_0

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->ibuf:[I

    if-nez v0, :cond_1

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 191
    iput-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->ibuf:[I

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->ibuf:[I

    const/4 v1, 0x0

    long-to-int v2, p1

    aput v2, v0, v1

    const/4 v1, 0x1

    const/16 v2, 0x20

    ushr-long/2addr p1, v2

    long-to-int p2, p1

    .line 193
    aput p2, v0, v1

    .line 194
    invoke-virtual {p0, v0}, Lcom/snatik/matches/rng/MTRandom;->setSeed([I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setSeed([B)V
    .locals 0

    .line 214
    invoke-static {p1}, Lcom/snatik/matches/rng/MTRandom;->pack([B)[I

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/snatik/matches/rng/MTRandom;->setSeed([I)V

    return-void
.end method

.method public final declared-synchronized setSeed([I)V
    .locals 12

    monitor-enter p0

    .line 229
    :try_start_0
    array-length v0, p1

    if-eqz v0, :cond_6

    const/16 v1, 0x270

    if-le v1, v0, :cond_0

    const/16 v2, 0x270

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    const v3, 0x12bd6aa

    .line 234
    invoke-direct {p0, v3}, Lcom/snatik/matches/rng/MTRandom;->setSeed(I)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    :goto_1
    const/16 v7, 0x26f

    if-lez v2, :cond_3

    .line 237
    iget-object v8, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    aget v9, v8, v5

    add-int/lit8 v10, v5, -0x1

    aget v11, v8, v10

    aget v10, v8, v10

    ushr-int/lit8 v10, v10, 0x1e

    xor-int/2addr v10, v11

    const v11, 0x19660d

    mul-int v10, v10, v11

    xor-int/2addr v9, v10

    aget v10, p1, v6

    add-int/2addr v9, v10

    add-int/2addr v9, v6

    aput v9, v8, v5

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v6, v6, 0x1

    if-lt v5, v1, :cond_1

    .line 242
    aget v5, v8, v7

    aput v5, v8, v3

    const/4 v5, 0x1

    :cond_1
    if-lt v6, v0, :cond_2

    const/4 v6, 0x0

    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_3
    const/16 p1, 0x26f

    :goto_2
    if-lez p1, :cond_5

    .line 250
    iget-object v0, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    aget v2, v0, v5

    add-int/lit8 v6, v5, -0x1

    aget v8, v0, v6

    aget v6, v0, v6

    ushr-int/lit8 v6, v6, 0x1e

    xor-int/2addr v6, v8

    const v8, 0x5d588b65

    mul-int v6, v6, v8

    xor-int/2addr v2, v6

    sub-int/2addr v2, v5

    aput v2, v0, v5

    add-int/lit8 v5, v5, 0x1

    if-lt v5, v1, :cond_4

    .line 254
    aget v2, v0, v7

    aput v2, v0, v3

    const/4 v5, 0x1

    :cond_4
    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    .line 258
    :cond_5
    iget-object p1, p0, Lcom/snatik/matches/rng/MTRandom;->mt:[I

    const/high16 v0, -0x80000000

    aput v0, p1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 260
    monitor-exit p0

    return-void

    .line 231
    :cond_6
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Seed buffer may not be empty"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method
