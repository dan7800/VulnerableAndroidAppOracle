.class Lcom/example/hussienalrubaye/webview/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/hussienalrubaye/webview/MainActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/hussienalrubaye/webview/MainActivity;)V
    .locals 0

    .prologue
    .line 91
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/MainActivity$1;->this$0:Lcom/example/hussienalrubaye/webview/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1
    .param p1, "newText"    # Ljava/lang/String;

    .prologue
    .line 102
    const/4 v0, 0x0

    return v0
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/MainActivity$1;->this$0:Lcom/example/hussienalrubaye/webview/MainActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/example/hussienalrubaye/webview/MainActivity;->loadUrl(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/example/hussienalrubaye/webview/MainActivity;->access$100(Lcom/example/hussienalrubaye/webview/MainActivity;Ljava/lang/String;)V

    .line 97
    const/4 v0, 0x0

    return v0
.end method
