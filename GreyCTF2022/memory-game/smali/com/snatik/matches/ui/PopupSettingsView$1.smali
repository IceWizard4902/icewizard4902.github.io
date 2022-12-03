.class Lcom/snatik/matches/ui/PopupSettingsView$1;
.super Ljava/lang/Object;
.source "PopupSettingsView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/snatik/matches/ui/PopupSettingsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/snatik/matches/ui/PopupSettingsView;


# direct methods
.method constructor <init>(Lcom/snatik/matches/ui/PopupSettingsView;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/snatik/matches/ui/PopupSettingsView$1;->this$0:Lcom/snatik/matches/ui/PopupSettingsView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 41
    sget-boolean p1, Lcom/snatik/matches/common/Music;->OFF:Z

    xor-int/lit8 p1, p1, 0x1

    sput-boolean p1, Lcom/snatik/matches/common/Music;->OFF:Z

    .line 42
    iget-object p1, p0, Lcom/snatik/matches/ui/PopupSettingsView$1;->this$0:Lcom/snatik/matches/ui/PopupSettingsView;

    invoke-static {p1}, Lcom/snatik/matches/ui/PopupSettingsView;->access$000(Lcom/snatik/matches/ui/PopupSettingsView;)V

    return-void
.end method
