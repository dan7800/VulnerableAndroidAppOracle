.class Lcom/example/hussienalrubaye/webview/ResourcesName$1;
.super Ljava/lang/Object;
.source "ResourcesName.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/hussienalrubaye/webview/ResourcesName;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;


# direct methods
.method constructor <init>(Lcom/example/hussienalrubaye/webview/ResourcesName;)V
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$1;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$1;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-virtual {v3}, Lcom/example/hussienalrubaye/webview/ResourcesName;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 58
    .local v2, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 59
    .local v0, "b":Landroid/os/Bundle;
    const-string v4, "ID"

    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$1;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    iget-object v3, v3, Lcom/example/hussienalrubaye/webview/ResourcesName;->fullsongpath:Ljava/util/ArrayList;

    invoke-virtual {v3, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/example/hussienalrubaye/webview/ResourceItem;

    iget v3, v3, Lcom/example/hussienalrubaye/webview/ResourceItem;->ID:I

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 60
    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 61
    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$1;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-virtual {v3, v2}, Lcom/example/hussienalrubaye/webview/ResourcesName;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
