.class public Lcom/example/hussienalrubaye/webview/welcomeActivity;
.super Landroid/app/Activity;
.source "welcomeActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 19
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    const v1, 0x7f04001b

    invoke-virtual {p0, v1}, Lcom/example/hussienalrubaye/webview/welcomeActivity;->setContentView(I)V

    .line 25
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 26
    .local v0, "timer":Ljava/util/Timer;
    new-instance v1, Lcom/example/hussienalrubaye/webview/welcomeActivity$1;

    invoke-direct {v1, p0}, Lcom/example/hussienalrubaye/webview/welcomeActivity$1;-><init>(Lcom/example/hussienalrubaye/webview/welcomeActivity;)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 36
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/welcomeActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0e0003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 44
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 52
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 55
    .local v0, "id":I
    const v1, 0x7f0d0069

    if-ne v0, v1, :cond_0

    .line 56
    const/4 v1, 0x1

    .line 59
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method
