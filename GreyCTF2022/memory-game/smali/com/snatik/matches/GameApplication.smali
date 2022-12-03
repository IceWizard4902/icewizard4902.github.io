.class public Lcom/snatik/matches/GameApplication;
.super Landroid/app/Application;
.source "GameApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .line 11
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 12
    invoke-static {p0}, Lcom/snatik/matches/utils/FontLoader;->loadFonts(Landroid/content/Context;)V

    return-void
.end method
