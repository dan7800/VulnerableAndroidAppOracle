.class Lcom/example/hussienalrubaye/webview/MainActivity$MyBrowser;
.super Landroid/webkit/WebViewClient;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/hussienalrubaye/webview/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyBrowser"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/MainActivity;


# direct methods
.method private constructor <init>(Lcom/example/hussienalrubaye/webview/MainActivity;)V
    .locals 0

    .prologue
    .line 186
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/MainActivity$MyBrowser;->this$0:Lcom/example/hussienalrubaye/webview/MainActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/example/hussienalrubaye/webview/MainActivity;Lcom/example/hussienalrubaye/webview/MainActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/example/hussienalrubaye/webview/MainActivity;
    .param p2, "x1"    # Lcom/example/hussienalrubaye/webview/MainActivity$1;

    .prologue
    .line 186
    invoke-direct {p0, p1}, Lcom/example/hussienalrubaye/webview/MainActivity$MyBrowser;-><init>(Lcom/example/hussienalrubaye/webview/MainActivity;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 198
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 190
    const/4 v0, 0x1

    return v0
.end method
