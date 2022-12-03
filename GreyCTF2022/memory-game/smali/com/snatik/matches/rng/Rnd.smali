.class public Lcom/snatik/matches/rng/Rnd;
.super Ljava/lang/Object;
.source "Rnd.java"


# static fields
.field private static rnd:Lcom/snatik/matches/rng/MTRandom;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 27
    new-instance v0, Lcom/snatik/matches/rng/MTRandom;

    const v1, -0x7538513e

    int-to-long v1, v1

    invoke-direct {v0, v1, v2}, Lcom/snatik/matches/rng/MTRandom;-><init>(J)V

    sput-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()F
    .locals 1

    .line 38
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextFloat()F

    move-result v0

    return v0
.end method

.method public static get(I)I
    .locals 4

    .line 49
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextDouble()D

    move-result-wide v0

    int-to-double v2, p0

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p0, v0

    return p0
.end method

.method public static get(II)I
    .locals 4

    .line 59
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextDouble()D

    move-result-wide v0

    sub-int/2addr p1, p0

    add-int/lit8 p1, p1, 0x1

    int-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p1, v0

    add-int/2addr p0, p1

    return p0
.end method

.method public static nextBoolean()Z
    .locals 1

    .line 95
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextBoolean()Z

    move-result v0

    return v0
.end method

.method public static nextDouble()D
    .locals 2

    .line 81
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public static nextGaussian()D
    .locals 2

    .line 88
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextGaussian()D

    move-result-wide v0

    return-wide v0
.end method

.method public static nextInt()I
    .locals 1

    .line 74
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextInt()I

    move-result v0

    return v0
.end method

.method public static nextInt(I)I
    .locals 4

    .line 67
    sget-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    invoke-virtual {v0}, Lcom/snatik/matches/rng/MTRandom;->nextDouble()D

    move-result-wide v0

    int-to-double v2, p0

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p0, v0

    return p0
.end method

.method public static reSeed()V
    .locals 3

    .line 30
    new-instance v0, Lcom/snatik/matches/rng/MTRandom;

    const v1, -0x7538513e

    int-to-long v1, v1

    invoke-direct {v0, v1, v2}, Lcom/snatik/matches/rng/MTRandom;-><init>(J)V

    sput-object v0, Lcom/snatik/matches/rng/Rnd;->rnd:Lcom/snatik/matches/rng/MTRandom;

    return-void
.end method
