.class public Lcom/snatik/matches/fragments/MenuFragment;
.super Landroid/support/v4/app/Fragment;
.source "MenuFragment.java"


# instance fields
.field private mGooglePlayGameButton:Landroid/widget/ImageView;

.field private mSettingsGameButton:Landroid/widget/ImageView;

.field private mStartButtonLights:Landroid/widget/ImageView;

.field private mStartGameButton:Landroid/widget/ImageView;

.field private mTitle:Landroid/widget/ImageView;

.field private mTooltip:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private startLightsAnimation()V
    .locals 4

    .line 137
    iget-object v0, p0, Lcom/snatik/matches/fragments/MenuFragment;->mStartButtonLights:Landroid/widget/ImageView;

    const/4 v1, 0x2

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    const-string v3, "rotation"

    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 138
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v2, 0x1770

    .line 139
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const/4 v2, -0x1

    .line 140
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 141
    iget-object v2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mStartButtonLights:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 142
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method private startTootipAnimation()V
    .locals 7

    .line 117
    iget-object v0, p0, Lcom/snatik/matches/fragments/MenuFragment;->mTooltip:Landroid/widget/ImageView;

    const/4 v1, 0x1

    new-array v2, v1, [F

    const v3, 0x3f4ccccd    # 0.8f

    const/4 v4, 0x0

    aput v3, v2, v4

    const-string v3, "scaleY"

    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v5, 0xc8

    .line 118
    invoke-virtual {v0, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 119
    iget-object v2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mTooltip:Landroid/widget/ImageView;

    new-array v5, v1, [F

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v5, v4

    invoke-static {v2, v3, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v5, 0x1f4

    .line 120
    invoke-virtual {v2, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 121
    new-instance v3, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v3}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 122
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v5, 0x3e8

    .line 123
    invoke-virtual {v3, v5, v6}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    const/4 v5, 0x2

    new-array v6, v5, [Landroid/animation/Animator;

    aput-object v0, v6, v4

    aput-object v2, v6, v1

    .line 124
    invoke-virtual {v3, v6}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 125
    new-instance v0, Lcom/snatik/matches/fragments/MenuFragment$4;

    invoke-direct {v0, p0, v3}, Lcom/snatik/matches/fragments/MenuFragment$4;-><init>(Lcom/snatik/matches/fragments/MenuFragment;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 132
    iget-object v0, p0, Lcom/snatik/matches/fragments/MenuFragment;->mTooltip:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v5, v1}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 133
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method


# virtual methods
.method protected animateAllAssetsOff(Landroid/animation/AnimatorListenerAdapter;)V
    .locals 16

    move-object/from16 v0, p0

    .line 83
    iget-object v1, v0, Lcom/snatik/matches/fragments/MenuFragment;->mTitle:Landroid/widget/ImageView;

    const/4 v2, 0x1

    new-array v3, v2, [F

    const/16 v4, -0xc8

    invoke-static {v4}, Lcom/snatik/matches/utils/Utils;->px(I)I

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x0

    aput v4, v3, v5

    const-string v4, "translationY"

    invoke-static {v1, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 84
    new-instance v3, Landroid/view/animation/AccelerateInterpolator;

    const/high16 v6, 0x40000000    # 2.0f

    invoke-direct {v3, v6}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v7, 0x12c

    .line 85
    invoke-virtual {v1, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 88
    iget-object v3, v0, Lcom/snatik/matches/fragments/MenuFragment;->mStartButtonLights:Landroid/widget/ImageView;

    new-array v9, v2, [F

    const/4 v10, 0x0

    aput v10, v9, v5

    const-string v11, "scaleX"

    invoke-static {v3, v11, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 89
    iget-object v9, v0, Lcom/snatik/matches/fragments/MenuFragment;->mStartButtonLights:Landroid/widget/ImageView;

    new-array v11, v2, [F

    aput v10, v11, v5

    const-string v12, "scaleY"

    invoke-static {v9, v12, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v9

    .line 92
    iget-object v11, v0, Lcom/snatik/matches/fragments/MenuFragment;->mTooltip:Landroid/widget/ImageView;

    new-array v12, v2, [F

    aput v10, v12, v5

    const-string v10, "alpha"

    invoke-static {v11, v10, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    const-wide/16 v11, 0x64

    .line 93
    invoke-virtual {v10, v11, v12}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 96
    iget-object v11, v0, Lcom/snatik/matches/fragments/MenuFragment;->mSettingsGameButton:Landroid/widget/ImageView;

    new-array v12, v2, [F

    const/16 v13, 0x78

    invoke-static {v13}, Lcom/snatik/matches/utils/Utils;->px(I)I

    move-result v14

    int-to-float v14, v14

    aput v14, v12, v5

    invoke-static {v11, v4, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    .line 97
    new-instance v12, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v12, v6}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v11, v12}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 98
    invoke-virtual {v11, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 101
    iget-object v12, v0, Lcom/snatik/matches/fragments/MenuFragment;->mGooglePlayGameButton:Landroid/widget/ImageView;

    new-array v14, v2, [F

    invoke-static {v13}, Lcom/snatik/matches/utils/Utils;->px(I)I

    move-result v13

    int-to-float v13, v13

    aput v13, v14, v5

    invoke-static {v12, v4, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    .line 102
    new-instance v13, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v13, v6}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v12, v13}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 103
    invoke-virtual {v12, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 106
    iget-object v13, v0, Lcom/snatik/matches/fragments/MenuFragment;->mStartGameButton:Landroid/widget/ImageView;

    new-array v14, v2, [F

    const/16 v15, 0x82

    invoke-static {v15}, Lcom/snatik/matches/utils/Utils;->px(I)I

    move-result v15

    int-to-float v15, v15

    aput v15, v14, v5

    invoke-static {v13, v4, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 107
    new-instance v13, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v13, v6}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v4, v13}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 108
    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 110
    new-instance v6, Landroid/animation/AnimatorSet;

    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v7, 0x7

    new-array v7, v7, [Landroid/animation/Animator;

    aput-object v1, v7, v5

    aput-object v3, v7, v2

    const/4 v1, 0x2

    aput-object v9, v7, v1

    const/4 v1, 0x3

    aput-object v10, v7, v1

    const/4 v1, 0x4

    aput-object v11, v7, v1

    const/4 v1, 0x5

    aput-object v12, v7, v1

    const/4 v1, 0x6

    aput-object v4, v7, v1

    .line 111
    invoke-virtual {v6, v7}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    move-object/from16 v1, p1

    .line 112
    invoke-virtual {v6, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 113
    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f090021

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0700a4

    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mTitle:Landroid/widget/ImageView;

    const p2, 0x7f070089

    .line 39
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mStartGameButton:Landroid/widget/ImageView;

    const p2, 0x7f070078

    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mSettingsGameButton:Landroid/widget/ImageView;

    .line 41
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 42
    iget-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mSettingsGameButton:Landroid/widget/ImageView;

    new-instance p3, Lcom/snatik/matches/fragments/MenuFragment$1;

    invoke-direct {p3, p0}, Lcom/snatik/matches/fragments/MenuFragment$1;-><init>(Lcom/snatik/matches/fragments/MenuFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f07003f

    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mGooglePlayGameButton:Landroid/widget/ImageView;

    .line 49
    new-instance p3, Lcom/snatik/matches/fragments/MenuFragment$2;

    invoke-direct {p3, p0}, Lcom/snatik/matches/fragments/MenuFragment$2;-><init>(Lcom/snatik/matches/fragments/MenuFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f07008a

    .line 55
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mStartButtonLights:Landroid/widget/ImageView;

    const p2, 0x7f0700a7

    .line 56
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mTooltip:Landroid/widget/ImageView;

    .line 57
    iget-object p2, p0, Lcom/snatik/matches/fragments/MenuFragment;->mStartGameButton:Landroid/widget/ImageView;

    new-instance p3, Lcom/snatik/matches/fragments/MenuFragment$3;

    invoke-direct {p3, p0}, Lcom/snatik/matches/fragments/MenuFragment$3;-><init>(Lcom/snatik/matches/fragments/MenuFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    invoke-direct {p0}, Lcom/snatik/matches/fragments/MenuFragment;->startLightsAnimation()V

    .line 73
    invoke-direct {p0}, Lcom/snatik/matches/fragments/MenuFragment;->startTootipAnimation()V

    .line 76
    invoke-static {}, Lcom/snatik/matches/common/Music;->playBackgroundMusic()V

    return-object p1
.end method
