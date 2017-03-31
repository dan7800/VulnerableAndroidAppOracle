.class public Lcom/example/hussienalrubaye/webview/MyBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MyBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 15
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 16
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 17
    const-string v4, "NewsTitle"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 21
    .local v2, "mstring":Ljava/lang/String;
    new-instance v3, Lcom/example/hussienalrubaye/webview/NewMessageNotification;

    invoke-direct {v3}, Lcom/example/hussienalrubaye/webview/NewMessageNotification;-><init>()V

    .line 22
    .local v3, "notfiyme":Lcom/example/hussienalrubaye/webview/NewMessageNotification;
    const/16 v4, 0x7b

    invoke-static {p1, v2, v4}, Lcom/example/hussienalrubaye/webview/NewMessageNotification;->notify(Landroid/content/Context;Ljava/lang/String;I)V

    .line 24
    new-instance v1, Lcom/example/hussienalrubaye/webview/FileLoad;

    invoke-direct {v1, p1}, Lcom/example/hussienalrubaye/webview/FileLoad;-><init>(Landroid/content/Context;)V

    .line 25
    .local v1, "fileinfo":Lcom/example/hussienalrubaye/webview/FileLoad;
    invoke-virtual {v1}, Lcom/example/hussienalrubaye/webview/FileLoad;->SaveData()V

    .line 27
    .end local v1    # "fileinfo":Lcom/example/hussienalrubaye/webview/FileLoad;
    .end local v2    # "mstring":Ljava/lang/String;
    .end local v3    # "notfiyme":Lcom/example/hussienalrubaye/webview/NewMessageNotification;
    :cond_0
    return-void
.end method
