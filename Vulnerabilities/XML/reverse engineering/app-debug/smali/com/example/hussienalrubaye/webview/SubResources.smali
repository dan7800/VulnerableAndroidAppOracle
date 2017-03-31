.class public Lcom/example/hussienalrubaye/webview/SubResources;
.super Landroid/support/v7/app/AppCompatActivity;
.source "SubResources.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;,
        Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;
    }
.end annotation


# instance fields
.field NesourceID:I

.field context:Landroid/content/Context;

.field fullsongpath:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/example/hussienalrubaye/webview/SubResourceItems;",
            ">;"
        }
    .end annotation
.end field

.field isListOfChannel:Z

.field ls:Landroid/widget/ListView;

.field result:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources;->fullsongpath:Ljava/util/ArrayList;

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/hussienalrubaye/webview/SubResources;->NesourceID:I

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/example/hussienalrubaye/webview/SubResources;->isListOfChannel:Z

    .line 155
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 45
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const v2, 0x7f04001a

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/SubResources;->setContentView(I)V

    .line 47
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/SubResources;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 48
    .local v0, "b":Landroid/os/Bundle;
    const-string v2, "ID"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/example/hussienalrubaye/webview/SubResources;->NesourceID:I

    .line 49
    const v2, 0x7f0d0053

    invoke-virtual {p0, v2}, Lcom/example/hussienalrubaye/webview/SubResources;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources;->ls:Landroid/widget/ListView;

    .line 51
    iput-boolean v4, p0, Lcom/example/hussienalrubaye/webview/SubResources;->isListOfChannel:Z

    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "MobileWebService1.asmx/GetSubNesources?UserID="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&NesourceID="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/example/hussienalrubaye/webview/SubResources;->NesourceID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, "murl":Ljava/lang/String;
    new-instance v2, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;

    invoke-direct {v2, p0}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;-><init>(Lcom/example/hussienalrubaye/webview/SubResources;)V

    new-array v3, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 55
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/SubResources;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0e0002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 69
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 72
    .local v0, "id":I
    const v2, 0x7f0d0068

    if-ne v0, v2, :cond_0

    .line 73
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/example/hussienalrubaye/webview/SubResources;->startActivity(Landroid/content/Intent;)V

    .line 77
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2
.end method
