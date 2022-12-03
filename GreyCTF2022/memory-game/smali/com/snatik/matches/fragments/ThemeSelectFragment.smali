.class public Lcom/snatik/matches/fragments/ThemeSelectFragment;
.super Landroid/support/v4/app/Fragment;
.source "ThemeSelectFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private animateShow(Landroid/view/View;)V
    .locals 6

    const/4 v0, 0x2

    new-array v1, v0, [F

    .line 70
    fill-array-data v1, :array_0

    const-string v2, "scaleX"

    invoke-static {p1, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-array v2, v0, [F

    .line 71
    fill-array-data v2, :array_1

    const-string v3, "scaleY"

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 72
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v4, 0x12c

    .line 73
    invoke-virtual {v3, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-array v4, v0, [Landroid/animation/Animator;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v1, 0x1

    aput-object v2, v4, v1

    .line 74
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 75
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const/4 v1, 0x0

    .line 76
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 77
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private setStars(Landroid/widget/ImageView;Lcom/snatik/matches/themes/Theme;Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x6

    if-gt v2, v4, :cond_0

    .line 83
    iget v4, p2, Lcom/snatik/matches/themes/Theme;->id:I

    invoke-static {v4, v2}, Lcom/snatik/matches/common/Memory;->getHighStars(II)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 85
    :cond_0
    div-int/2addr v3, v4

    if-eqz v3, :cond_1

    .line 87
    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "_theme_star_%d"

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-static {p2, p3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 88
    sget-object p3, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget-object v0, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "drawable"

    invoke-virtual {p3, p2, v1, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 89
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6

    .line 26
    sget-object p1, Lcom/snatik/matches/common/Shared;->context:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p3, 0x7f09002e

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f070096

    .line 27
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const p3, 0x7f07009a

    .line 28
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    const v0, 0x7f070098

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 31
    invoke-static {}, Lcom/snatik/matches/themes/Themes;->createAnimalsTheme()Lcom/snatik/matches/themes/Theme;

    move-result-object v1

    const v2, 0x7f070095

    .line 32
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const-string v3, "animals"

    invoke-direct {p0, v2, v1, v3}, Lcom/snatik/matches/fragments/ThemeSelectFragment;->setStars(Landroid/widget/ImageView;Lcom/snatik/matches/themes/Theme;Ljava/lang/String;)V

    .line 33
    invoke-static {}, Lcom/snatik/matches/themes/Themes;->createMosterTheme()Lcom/snatik/matches/themes/Theme;

    move-result-object v2

    const v3, 0x7f070099

    .line 34
    invoke-virtual {p3, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const-string v4, "monsters"

    invoke-direct {p0, v3, v2, v4}, Lcom/snatik/matches/fragments/ThemeSelectFragment;->setStars(Landroid/widget/ImageView;Lcom/snatik/matches/themes/Theme;Ljava/lang/String;)V

    .line 35
    invoke-static {}, Lcom/snatik/matches/themes/Themes;->createEmojiTheme()Lcom/snatik/matches/themes/Theme;

    move-result-object v3

    const v4, 0x7f070097

    .line 36
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const-string v5, "emoji"

    invoke-direct {p0, v4, v3, v5}, Lcom/snatik/matches/fragments/ThemeSelectFragment;->setStars(Landroid/widget/ImageView;Lcom/snatik/matches/themes/Theme;Ljava/lang/String;)V

    .line 38
    new-instance v4, Lcom/snatik/matches/fragments/ThemeSelectFragment$1;

    invoke-direct {v4, p0, v1}, Lcom/snatik/matches/fragments/ThemeSelectFragment$1;-><init>(Lcom/snatik/matches/fragments/ThemeSelectFragment;Lcom/snatik/matches/themes/Theme;)V

    invoke-virtual {p2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    new-instance v1, Lcom/snatik/matches/fragments/ThemeSelectFragment$2;

    invoke-direct {v1, p0, v2}, Lcom/snatik/matches/fragments/ThemeSelectFragment$2;-><init>(Lcom/snatik/matches/fragments/ThemeSelectFragment;Lcom/snatik/matches/themes/Theme;)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    new-instance v1, Lcom/snatik/matches/fragments/ThemeSelectFragment$3;

    invoke-direct {v1, p0, v3}, Lcom/snatik/matches/fragments/ThemeSelectFragment$3;-><init>(Lcom/snatik/matches/fragments/ThemeSelectFragment;Lcom/snatik/matches/themes/Theme;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    invoke-direct {p0, p2}, Lcom/snatik/matches/fragments/ThemeSelectFragment;->animateShow(Landroid/view/View;)V

    .line 63
    invoke-direct {p0, p3}, Lcom/snatik/matches/fragments/ThemeSelectFragment;->animateShow(Landroid/view/View;)V

    .line 64
    invoke-direct {p0, v0}, Lcom/snatik/matches/fragments/ThemeSelectFragment;->animateShow(Landroid/view/View;)V

    return-object p1
.end method
