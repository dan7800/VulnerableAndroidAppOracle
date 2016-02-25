.class public Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;
.super Landroid/os/AsyncTask;
.source "FileLoad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/hussienalrubaye/webview/FileLoad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/FileLoad;


# direct methods
.method public constructor <init>(Lcom/example/hussienalrubaye/webview/FileLoad;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/FileLoad;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 79
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 89
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "MobileWebService1.asmx/InitializeAccount?MAC="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/example/hussienalrubaye/webview/GlobalClass;->Deviceuid:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 92
    .local v3, "murl":Ljava/lang/String;
    :try_start_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 93
    .local v0, "httpClient":Lorg/apache/http/client/HttpClient;
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v4, v3}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 94
    .local v1, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    .line 95
    .local v2, "inputStream":Ljava/io/InputStream;
    if-eqz v2, :cond_0

    .line 96
    iget-object v4, p0, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/FileLoad;

    invoke-static {v2}, Lcom/example/hussienalrubaye/webview/Operations;->ConvertInputToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/example/hussienalrubaye/webview/FileLoad;->result:Ljava/lang/String;

    .line 99
    :goto_0
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/FileLoad;

    iget-object v6, v6, Lcom/example/hussienalrubaye/webview/FileLoad;->result:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {p0, v4}, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 105
    .end local v0    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v2    # "inputStream":Ljava/io/InputStream;
    :goto_1
    const/4 v4, 0x0

    return-object v4

    .line 98
    .restart local v0    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v2    # "inputStream":Ljava/io/InputStream;
    :cond_0
    iget-object v4, p0, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/FileLoad;

    const-string v5, "Did not work"

    iput-object v5, v4, Lcom/example/hussienalrubaye/webview/FileLoad;->result:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 101
    .end local v0    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v1    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v2    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 79
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2
    .param p1, "result1"    # Ljava/lang/String;

    .prologue
    .line 112
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/FileLoad;

    iget-object v1, v1, Lcom/example/hussienalrubaye/webview/FileLoad;->result:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 113
    .local v0, "js":Lorg/json/JSONObject;
    const-string v1, "UserID"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    sput v1, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    .line 115
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/FileLoad;

    invoke-virtual {v1}, Lcom/example/hussienalrubaye/webview/FileLoad;->SaveData()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .end local v0    # "js":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 117
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 83
    return-void
.end method
