.class public Lcom/snatik/matches/fragments/DifficultySelectFragment;
.super Landroid/support/v4/app/Fragment;
.source "DifficultySelectFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private varargs animate([Landroid/view/View;)V
    .locals 7

    .line 107
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 108
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 109
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_0

    .line 110
    aget-object v3, p1, v2

    const/4 v4, 0x2

    new-array v5, v4, [F

    fill-array-data v5, :array_0

    const-string v6, "scaleX"

    invoke-static {v3, v6, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 111
    aget-object v5, p1, v2

    new-array v4, v4, [F

    fill-array-data v4, :array_1

    const-string v6, "scaleY"

    invoke-static {v5, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 112
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v1, 0x1f4

    .line 114
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 115
    new-instance p1, Landroid/view/animation/BounceInterpolator;

    invoke-direct {p1}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 116
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private getBestTimeForStage(II)Ljava/lang/String;
    .locals 2

    .line 94
    invoke-static {p1, p2}, Lcom/snatik/matches/common/Memory;->getBestTime(II)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    .line 96
    rem-int/lit16 p2, p1, 0xe10

    div-int/lit8 p2, p2, 0x3c

    .line 97
    rem-int/lit8 p1, p1, 0x3c

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 98
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v0, v1

    const/4 p2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p2

    const-string p1, "BEST : %02d:%02d"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "BEST : -"

    return-object p1
.end method

.method private setOnClick(Landroid/view/View;I)V
    .locals 1

    .line 120
    new-instance v0, Lcom/snatik/matches/fragments/DifficultySelectFragment$1;

    invoke-direct {v0, p0, p2}, Lcom/snatik/matches/fragments/DifficultySelectFragment$1;-><init>(Lcom/snatik/matches/fragments/DifficultySelectFragment;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 16

    move-object/from16 v0, p0

    .line 27
    sget-object v1, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f09001f

    const/4 v3, 0x0

    move-object/from16 v4, p2

    invoke-virtual {v1, v2, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 28
    sget-object v2, Lcom/snatik/matches/common/Shared;->engine:Lcom/snatik/matches/engine/Engine;

    invoke-virtual {v2}, Lcom/snatik/matches/engine/Engine;->getSelectedTheme()Lcom/snatik/matches/themes/Theme;

    move-result-object v2

    const v4, 0x7f070072

    .line 30
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/snatik/matches/ui/DifficultyView;

    .line 31
    iget v5, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v6, 0x1

    invoke-static {v5, v6}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Lcom/snatik/matches/ui/DifficultyView;->setDifficulty(II)V

    .line 32
    invoke-direct {v0, v4, v6}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V

    const v5, 0x7f070073

    .line 34
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/snatik/matches/ui/DifficultyView;

    .line 35
    iget v7, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v8, 0x2

    invoke-static {v7, v8}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v7

    invoke-virtual {v5, v8, v7}, Lcom/snatik/matches/ui/DifficultyView;->setDifficulty(II)V

    .line 36
    invoke-direct {v0, v5, v8}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V

    const v7, 0x7f070074

    .line 38
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/snatik/matches/ui/DifficultyView;

    .line 39
    iget v9, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v10, 0x3

    invoke-static {v9, v10}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v9

    invoke-virtual {v7, v10, v9}, Lcom/snatik/matches/ui/DifficultyView;->setDifficulty(II)V

    .line 40
    invoke-direct {v0, v7, v10}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V

    const v9, 0x7f070075

    .line 42
    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/snatik/matches/ui/DifficultyView;

    .line 43
    iget v11, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v12, 0x4

    invoke-static {v11, v12}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v11

    invoke-virtual {v9, v12, v11}, Lcom/snatik/matches/ui/DifficultyView;->setDifficulty(II)V

    .line 44
    invoke-direct {v0, v9, v12}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V

    const v11, 0x7f070076

    .line 46
    invoke-virtual {v1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/snatik/matches/ui/DifficultyView;

    .line 47
    iget v13, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v14, 0x5

    invoke-static {v13, v14}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v13

    invoke-virtual {v11, v14, v13}, Lcom/snatik/matches/ui/DifficultyView;->setDifficulty(II)V

    .line 48
    invoke-direct {v0, v11, v14}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V

    const v13, 0x7f070077

    .line 50
    invoke-virtual {v1, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Lcom/snatik/matches/ui/DifficultyView;

    .line 51
    iget v15, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v14, 0x6

    invoke-static {v15, v14}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v15

    invoke-virtual {v13, v14, v15}, Lcom/snatik/matches/ui/DifficultyView;->setDifficulty(II)V

    .line 52
    invoke-direct {v0, v13, v14}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->setOnClick(Landroid/view/View;I)V

    new-array v15, v14, [Landroid/view/View;

    aput-object v4, v15, v3

    aput-object v5, v15, v6

    aput-object v7, v15, v8

    aput-object v9, v15, v10

    aput-object v11, v15, v12

    const/4 v3, 0x5

    aput-object v13, v15, v3

    .line 54
    invoke-direct {v0, v15}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->animate([Landroid/view/View;)V

    .line 56
    sget-object v3, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "fonts/grobold.ttf"

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v3

    const v4, 0x7f07009e

    .line 59
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const/16 v5, 0x11

    .line 60
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 61
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 62
    iget v7, v2, Lcom/snatik/matches/themes/Theme;->id:I

    invoke-direct {v0, v7, v6}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->getBestTimeForStage(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f07009f

    .line 64
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 65
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 66
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 67
    iget v6, v2, Lcom/snatik/matches/themes/Theme;->id:I

    invoke-direct {v0, v6, v8}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->getBestTimeForStage(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f0700a0

    .line 69
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 70
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 71
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 72
    iget v6, v2, Lcom/snatik/matches/themes/Theme;->id:I

    invoke-direct {v0, v6, v10}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->getBestTimeForStage(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f0700a1

    .line 74
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 75
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 76
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 77
    iget v6, v2, Lcom/snatik/matches/themes/Theme;->id:I

    invoke-direct {v0, v6, v12}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->getBestTimeForStage(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f0700a2

    .line 79
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 80
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 81
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 82
    iget v6, v2, Lcom/snatik/matches/themes/Theme;->id:I

    const/4 v7, 0x5

    invoke-direct {v0, v6, v7}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->getBestTimeForStage(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f0700a3

    .line 84
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 85
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 86
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 87
    iget v2, v2, Lcom/snatik/matches/themes/Theme;->id:I

    invoke-direct {v0, v2, v14}, Lcom/snatik/matches/fragments/DifficultySelectFragment;->getBestTimeForStage(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v1
.end method
