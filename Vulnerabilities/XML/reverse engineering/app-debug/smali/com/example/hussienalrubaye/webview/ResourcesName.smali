.class public Lcom/example/hussienalrubaye/webview/ResourcesName;
.super Landroid/support/v7/app/AppCompatActivity;
.source "ResourcesName.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/hussienalrubaye/webview/ResourcesName$MyAsyncTask;,
        Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;
    }
.end annotation


# instance fields
.field fullsongpath:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/example/hussienalrubaye/webview/ResourceItem;",
            ">;"
        }
    .end annotation
.end field

.field ls:Landroid/widget/ListView;

.field private pb:Landroid/widget/ProgressBar;

.field result:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/example/hussienalrubaye/webview/ResourcesName;->fullsongpath:Ljava/util/ArrayList;

    .line 134
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    const v0, 0x7f040019

    invoke-virtual {p0, v0}, Lcom/example/hussienalrubaye/webview/ResourcesName;->setContentView(I)V

    .line 47
    const v0, 0x7f0d0052

    invoke-virtual {p0, v0}, Lcom/example/hussienalrubaye/webview/ResourcesName;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/example/hussienalrubaye/webview/ResourcesName;->ls:Landroid/widget/ListView;

    .line 49
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/ResourcesName;->ls:Landroid/widget/ListView;

    new-instance v1, Lcom/example/hussienalrubaye/webview/ResourcesName$1;

    invoke-direct {v1, p0}, Lcom/example/hussienalrubaye/webview/ResourcesName$1;-><init>(Lcom/example/hussienalrubaye/webview/ResourcesName;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 68
    new-instance v0, Lcom/example/hussienalrubaye/webview/ResourcesName$MyAsyncTask;

    invoke-direct {v0, p0}, Lcom/example/hussienalrubaye/webview/ResourcesName$MyAsyncTask;-><init>(Lcom/example/hussienalrubaye/webview/ResourcesName;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/example/hussienalrubaye/webview/ResourcesName$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 72
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/ResourcesName;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0e0001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 78
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 86
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 89
    .local v0, "id":I
    const v2, 0x7f0d0068

    if-ne v0, v2, :cond_0

    .line 90
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/ResourcesName;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/example/hussienalrubaye/webview/MainActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 91
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/example/hussienalrubaye/webview/ResourcesName;->startActivity(Landroid/content/Intent;)V

    .line 94
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2
.end method
