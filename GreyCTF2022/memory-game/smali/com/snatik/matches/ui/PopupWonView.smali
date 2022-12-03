.class public Lcom/snatik/matches/ui/PopupWonView;
.super Landroid/widget/RelativeLayout;
.source "PopupWonView.java"


# instance fields
.field private mBackButton:Landroid/widget/ImageView;

.field private mHandler:Landroid/os/Handler;

.field private mNextButton:Landroid/widget/ImageView;

.field private mScore:Landroid/widget/TextView;

.field private mStar1:Landroid/widget/ImageView;

.field private mStar2:Landroid/widget/ImageView;

.field private mStar3:Landroid/widget/ImageView;

.field private mTime:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, p1, v0}, Lcom/snatik/matches/ui/PopupWonView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f090029

    const/4 v1, 0x1

    invoke-virtual {p2, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const p2, 0x7f07009d

    .line 44
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mTime:Landroid/widget/TextView;

    const p2, 0x7f070062

    .line 45
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mScore:Landroid/widget/TextView;

    const p2, 0x7f070085

    .line 46
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    const p2, 0x7f070086

    .line 47
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    const p2, 0x7f070087

    .line 48
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    const p2, 0x7f070023

    .line 49
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mBackButton:Landroid/widget/ImageView;

    const p2, 0x7f070024

    .line 50
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupWonView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/ui/PopupWonView;->mNextButton:Landroid/widget/ImageView;

    const/4 p2, 0x2

    new-array p2, p2, [Landroid/widget/TextView;

    .line 51
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView;->mTime:Landroid/widget/TextView;

    const/4 v2, 0x0

    aput-object v0, p2, v2

    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView;->mScore:Landroid/widget/TextView;

    aput-object v0, p2, v1

    sget-object v0, Lcom/snatik/matches/utils/FontLoader$Font;->GROBOLD:Lcom/snatik/matches/utils/FontLoader$Font;

    invoke-static {p1, p2, v0}, Lcom/snatik/matches/utils/FontLoader;->setTypeface(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;)V

    const p1, 0x7f0600cf

    .line 52
    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/PopupWonView;->setBackgroundResource(I)V

    .line 53
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mHandler:Landroid/os/Handler;

    .line 55
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mBackButton:Landroid/widget/ImageView;

    new-instance p2, Lcom/snatik/matches/ui/PopupWonView$1;

    invoke-direct {p2, p0}, Lcom/snatik/matches/ui/PopupWonView$1;-><init>(Lcom/snatik/matches/ui/PopupWonView;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mNextButton:Landroid/widget/ImageView;

    new-instance p2, Lcom/snatik/matches/ui/PopupWonView$2;

    invoke-direct {p2, p0}, Lcom/snatik/matches/ui/PopupWonView$2;-><init>(Lcom/snatik/matches/ui/PopupWonView;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/ui/PopupWonView;II)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/snatik/matches/ui/PopupWonView;->animateScoreAndTime(II)V

    return-void
.end method

.method static synthetic access$100(Lcom/snatik/matches/ui/PopupWonView;I)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/snatik/matches/ui/PopupWonView;->animateStars(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/snatik/matches/ui/PopupWonView;)Landroid/widget/TextView;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/snatik/matches/ui/PopupWonView;->mTime:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/snatik/matches/ui/PopupWonView;)Landroid/widget/TextView;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/snatik/matches/ui/PopupWonView;->mScore:Landroid/widget/TextView;

    return-object p0
.end method

.method private animateScoreAndTime(II)V
    .locals 6

    .line 149
    invoke-static {}, Lcom/snatik/matches/utils/Clock;->getInstance()Lcom/snatik/matches/utils/Clock;

    move-result-object v0

    new-instance v5, Lcom/snatik/matches/ui/PopupWonView$5;

    invoke-direct {v5, p0, p2, p1}, Lcom/snatik/matches/ui/PopupWonView$5;-><init>(Lcom/snatik/matches/ui/PopupWonView;II)V

    const-wide/16 v1, 0x4b0

    const-wide/16 v3, 0x23

    invoke-virtual/range {v0 .. v5}, Lcom/snatik/matches/utils/Clock;->startTimer(JJLcom/snatik/matches/utils/Clock$OnTimerCount;)V

    return-void
.end method

.method private animateStar(Landroid/view/View;I)V
    .locals 7

    const/4 v0, 0x2

    new-array v1, v0, [F

    .line 125
    fill-array-data v1, :array_0

    const-string v2, "alpha"

    invoke-static {p1, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-wide/16 v2, 0x64

    .line 126
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-array v2, v0, [F

    .line 127
    fill-array-data v2, :array_1

    const-string v3, "scaleX"

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    new-array v3, v0, [F

    .line 128
    fill-array-data v3, :array_2

    const-string v4, "scaleY"

    invoke-static {p1, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 129
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v5, 0x3

    new-array v5, v5, [Landroid/animation/Animator;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v1, 0x1

    aput-object v2, v5, v1

    aput-object v3, v5, v0

    .line 130
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 131
    new-instance v1, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v1}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {v4, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    int-to-long v1, p2

    .line 132
    invoke-virtual {v4, v1, v2}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    const-wide/16 v5, 0x258

    .line 133
    invoke-virtual {v4, v5, v6}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    const/4 p2, 0x0

    .line 134
    invoke-virtual {p1, v0, p2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 135
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 137
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mHandler:Landroid/os/Handler;

    new-instance p2, Lcom/snatik/matches/ui/PopupWonView$4;

    invoke-direct {p2, p0}, Lcom/snatik/matches/ui/PopupWonView$4;-><init>(Lcom/snatik/matches/ui/PopupWonView;)V

    invoke-virtual {p1, p2, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private animateStars(I)V
    .locals 5

    const/16 v0, 0x8

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eq p1, v1, :cond_2

    const/4 v1, 0x2

    const/16 v4, 0x258

    if-eq p1, v1, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto/16 :goto_0

    .line 109
    :cond_0
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 110
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 111
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v3}, Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V

    .line 112
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 113
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 114
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v4}, Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V

    .line 115
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 116
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 117
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    const/16 v0, 0x4b0

    invoke-direct {p0, p1, v0}, Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V

    goto :goto_0

    .line 100
    :cond_1
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 101
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 102
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 103
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v3}, Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V

    .line 104
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 105
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 106
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v4}, Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V

    goto :goto_0

    .line 94
    :cond_2
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 95
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 96
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 97
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v3}, Lcom/snatik/matches/ui/PopupWonView;->animateStar(Landroid/view/View;I)V

    goto :goto_0

    .line 89
    :cond_3
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar1:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 90
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar2:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 91
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupWonView;->mStar3:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public setGameState(Lcom/snatik/matches/model/GameState;)V
    .locals 7

    .line 71
    iget v0, p1, Lcom/snatik/matches/model/GameState;->remainedSeconds:I

    div-int/lit8 v0, v0, 0x3c

    .line 72
    iget v1, p1, Lcom/snatik/matches/model/GameState;->remainedSeconds:I

    mul-int/lit8 v2, v0, 0x3c

    sub-int/2addr v1, v2

    .line 73
    iget-object v2, p0, Lcom/snatik/matches/ui/PopupWonView;->mTime:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const-string v0, "%02d"

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v6

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView;->mScore:Landroid/widget/TextView;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupWonView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/snatik/matches/ui/PopupWonView$3;

    invoke-direct {v1, p0, p1}, Lcom/snatik/matches/ui/PopupWonView$3;-><init>(Lcom/snatik/matches/ui/PopupWonView;Lcom/snatik/matches/model/GameState;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
