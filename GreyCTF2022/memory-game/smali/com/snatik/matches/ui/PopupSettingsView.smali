.class public Lcom/snatik/matches/ui/PopupSettingsView;
.super Landroid/widget/LinearLayout;
.source "PopupSettingsView.java"


# instance fields
.field private mSoundImage:Landroid/widget/ImageView;

.field private mSoundText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, v0}, Lcom/snatik/matches/ui/PopupSettingsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x1

    .line 30
    invoke-virtual {p0, p2}, Lcom/snatik/matches/ui/PopupSettingsView;->setOrientation(I)V

    const v0, 0x7f060109

    .line 31
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/PopupSettingsView;->setBackgroundResource(I)V

    .line 32
    invoke-virtual {p0}, Lcom/snatik/matches/ui/PopupSettingsView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f090028

    invoke-virtual {v0, v1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const v0, 0x7f07007f

    .line 33
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/PopupSettingsView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundText:Landroid/widget/TextView;

    const v0, 0x7f07005e

    .line 34
    invoke-virtual {p0, v0}, Lcom/snatik/matches/ui/PopupSettingsView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/widget/TextView;

    .line 35
    iget-object v2, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundText:Landroid/widget/TextView;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    aput-object v0, v1, p2

    sget-object p2, Lcom/snatik/matches/utils/FontLoader$Font;->GROBOLD:Lcom/snatik/matches/utils/FontLoader$Font;

    invoke-static {p1, v1, p2}, Lcom/snatik/matches/utils/FontLoader;->setTypeface(Landroid/content/Context;[Landroid/widget/TextView;Lcom/snatik/matches/utils/FontLoader$Font;)V

    const p1, 0x7f07007d

    .line 36
    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/PopupSettingsView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundImage:Landroid/widget/ImageView;

    const p1, 0x7f07007e

    .line 37
    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/PopupSettingsView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 38
    new-instance p2, Lcom/snatik/matches/ui/PopupSettingsView$1;

    invoke-direct {p2, p0}, Lcom/snatik/matches/ui/PopupSettingsView$1;-><init>(Lcom/snatik/matches/ui/PopupSettingsView;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f07005d

    .line 45
    invoke-virtual {p0, p1}, Lcom/snatik/matches/ui/PopupSettingsView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 46
    new-instance p2, Lcom/snatik/matches/ui/PopupSettingsView$2;

    invoke-direct {p2, p0}, Lcom/snatik/matches/ui/PopupSettingsView$2;-><init>(Lcom/snatik/matches/ui/PopupSettingsView;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    invoke-direct {p0}, Lcom/snatik/matches/ui/PopupSettingsView;->setMusicButton()V

    return-void
.end method

.method static synthetic access$000(Lcom/snatik/matches/ui/PopupSettingsView;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/snatik/matches/ui/PopupSettingsView;->setMusicButton()V

    return-void
.end method

.method private setMusicButton()V
    .locals 2

    .line 61
    sget-boolean v0, Lcom/snatik/matches/common/Music;->OFF:Z

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundText:Landroid/widget/TextView;

    const-string v1, "Sound OFF"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundImage:Landroid/widget/ImageView;

    const v1, 0x7f060092

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundText:Landroid/widget/TextView;

    const-string v1, "Sound ON"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v0, p0, Lcom/snatik/matches/ui/PopupSettingsView;->mSoundImage:Landroid/widget/ImageView;

    const v1, 0x7f060093

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_0
    return-void
.end method
