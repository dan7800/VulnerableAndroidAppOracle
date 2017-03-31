.class Lcom/example/hussienalrubaye/webview/welcomeActivity$1;
.super Ljava/util/TimerTask;
.source "welcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/hussienalrubaye/webview/welcomeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/welcomeActivity;


# direct methods
.method constructor <init>(Lcom/example/hussienalrubaye/webview/welcomeActivity;)V
    .locals 0

    .prologue
    .line 26
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/welcomeActivity$1;->this$0:Lcom/example/hussienalrubaye/webview/welcomeActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 30
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/welcomeActivity$1;->this$0:Lcom/example/hussienalrubaye/webview/welcomeActivity;

    invoke-virtual {v1}, Lcom/example/hussienalrubaye/webview/welcomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/example/hussienalrubaye/webview/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 31
    .local v0, "br":Landroid/content/Intent;
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/welcomeActivity$1;->this$0:Lcom/example/hussienalrubaye/webview/welcomeActivity;

    invoke-virtual {v1, v0}, Lcom/example/hussienalrubaye/webview/welcomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 32
    return-void
.end method
