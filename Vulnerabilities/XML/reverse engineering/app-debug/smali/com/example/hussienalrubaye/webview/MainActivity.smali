.class public Lcom/example/hussienalrubaye/webview/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/hussienalrubaye/webview/MainActivity$MyBrowser;
    }
.end annotation


# instance fields
.field browser:Landroid/webkit/WebView;

.field buadd:Landroid/widget/Button;

.field buhome:Landroid/widget/Button;

.field bulogotype:Landroid/widget/Button;

.field bunewsa:Landroid/widget/Button;

.field searchView:Landroid/widget/SearchView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 186
    return-void
.end method

.method private SetDuttons()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 153
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->buhome:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 154
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->buadd:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 155
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->bunewsa:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 156
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->bulogotype:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 157
    return-void
.end method

.method static synthetic access$100(Lcom/example/hussienalrubaye/webview/MainActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/example/hussienalrubaye/webview/MainActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/example/hussienalrubaye/webview/MainActivity;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method private forceRTLIfSupported()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 76
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutDirection(I)V

    .line 79
    :cond_0
    return-void
.end method

.method private loadUrl(Ljava/lang/String;)V
    .locals 3
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "newfeeds.aspx?id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " &q="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 150
    invoke-direct {p0}, Lcom/example/hussienalrubaye/webview/MainActivity;->SetDuttons()V

    .line 151
    return-void
.end method


# virtual methods
.method public buajala(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 173
    const-string v0, "%\u0639\u0627\u062c\u0644%"

    invoke-direct {p0, v0}, Lcom/example/hussienalrubaye/webview/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 174
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->bunewsa:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 175
    return-void
.end method

.method public bunews(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 162
    const-string v0, "%"

    invoke-direct {p0, v0}, Lcom/example/hussienalrubaye/webview/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->buhome:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 165
    return-void
.end method

.method public buyoutube(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 168
    const-string v0, "%\u0641\u064a\u062f\u064a\u0648%"

    invoke-direct {p0, v0}, Lcom/example/hussienalrubaye/webview/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 169
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->bulogotype:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 170
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 41
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 42
    const v2, 0x7f040018

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->setContentView(I)V

    .line 46
    const v2, 0x7f0d004e

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->buhome:Landroid/widget/Button;

    .line 47
    const v2, 0x7f0d0051

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->buadd:Landroid/widget/Button;

    .line 48
    const v2, 0x7f0d0050

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->bunewsa:Landroid/widget/Button;

    .line 49
    const v2, 0x7f0d004f

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->bulogotype:Landroid/widget/Button;

    .line 50
    const v2, 0x7f0d004d

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebView;

    iput-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    .line 51
    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    new-instance v3, Lcom/example/hussienalrubaye/webview/MainActivity$MyBrowser;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/example/hussienalrubaye/webview/MainActivity$MyBrowser;-><init>(Lcom/example/hussienalrubaye/webview/MainActivity;Lcom/example/hussienalrubaye/webview/MainActivity$1;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 53
    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    .line 54
    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 55
    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 56
    const-string v2, "%"

    invoke-direct {p0, v2}, Lcom/example/hussienalrubaye/webview/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 57
    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->buhome:Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setSelected(Z)V

    .line 60
    const-string v2, "1"

    sput-object v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->Deviceuid:Ljava/lang/String;

    .line 62
    new-instance v0, Lcom/example/hussienalrubaye/webview/FileLoad;

    invoke-direct {v0, p0}, Lcom/example/hussienalrubaye/webview/FileLoad;-><init>(Landroid/content/Context;)V

    .line 63
    .local v0, "fileinfo":Lcom/example/hussienalrubaye/webview/FileLoad;
    invoke-virtual {v0}, Lcom/example/hussienalrubaye/webview/FileLoad;->LoadData()V

    .line 65
    sget-boolean v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->ServiceIsRun:Z

    if-nez v2, :cond_0

    .line 66
    sput-boolean v5, Lcom/example/hussienalrubaye/webview/GlobalClass;->ServiceIsRun:Z

    .line 67
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/example/hussienalrubaye/webview/ServiceNotification;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 68
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/example/hussienalrubaye/webview/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 72
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f0e0004

    invoke-virtual {v1, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 87
    const-string v1, "search"

    invoke-virtual {p0, v1}, Lcom/example/hussienalrubaye/webview/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/SearchManager;

    .line 88
    .local v0, "searchManager":Landroid/app/SearchManager;
    const v1, 0x7f0d006a

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SearchView;

    iput-object v1, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->searchView:Landroid/widget/SearchView;

    .line 89
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->searchView:Landroid/widget/SearchView;

    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/MainActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/SearchManager;->getSearchableInfo(Landroid/content/ComponentName;)Landroid/app/SearchableInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/SearchView;->setSearchableInfo(Landroid/app/SearchableInfo;)V

    .line 91
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->searchView:Landroid/widget/SearchView;

    new-instance v2, Lcom/example/hussienalrubaye/webview/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/example/hussienalrubaye/webview/MainActivity$1;-><init>(Lcom/example/hussienalrubaye/webview/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/SearchView;->setOnQueryTextListener(Landroid/widget/SearchView$OnQueryTextListener;)V

    .line 106
    const/4 v1, 0x1

    return v1
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 140
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity;->browser:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 142
    const/4 v0, 0x0

    .line 144
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 128
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 131
    .local v1, "id":I
    const v2, 0x7f0d0067

    if-ne v1, v2, :cond_0

    .line 132
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 133
    .local v0, "br":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/example/hussienalrubaye/webview/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 136
    .end local v0    # "br":Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 112
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 114
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 118
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 121
    return-void
.end method

.method public onadd(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 180
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 181
    .local v0, "br":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/example/hussienalrubaye/webview/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 183
    return-void
.end method
