.class public Lcom/example/hussienalrubaye/webview/ServiceNotification;
.super Landroid/app/IntentService;
.source "ServiceNotification.java"


# static fields
.field static SendtNotification:Z


# instance fields
.field ServiceIsRun:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x1

    sput-boolean v0, Lcom/example/hussienalrubaye/webview/ServiceNotification;->SendtNotification:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, "MyWebRequestService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/example/hussienalrubaye/webview/ServiceNotification;->ServiceIsRun:Z

    .line 27
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 13
    .param p1, "workIntent"    # Landroid/content/Intent;

    .prologue
    const/4 v12, 0x1

    .line 31
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    .line 32
    .local v2, "dataString":Ljava/lang/String;
    :goto_0
    iget-boolean v10, p0, Lcom/example/hussienalrubaye/webview/ServiceNotification;->ServiceIsRun:Z

    if-eqz v10, :cond_2

    .line 34
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "MobileWebService1.asmx/IsGetNewsWithHeader?NewsID="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget v11, Lcom/example/hussienalrubaye/webview/GlobalClass;->LastNewsID:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "&UserID="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget v11, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 37
    .local v7, "murl":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 38
    .local v3, "httpClient":Lorg/apache/http/client/HttpClient;
    new-instance v10, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v10, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v10}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 39
    .local v4, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 40
    .local v5, "inputStream":Ljava/io/InputStream;
    if-eqz v5, :cond_1

    .line 41
    invoke-static {v5}, Lcom/example/hussienalrubaye/webview/Operations;->ConvertInputToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v9

    .line 45
    .local v9, "result":Ljava/lang/String;
    :goto_1
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 48
    .local v6, "js":Lorg/json/JSONObject;
    const-string v10, "HasNews"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    if-ne v10, v12, :cond_0

    .line 49
    const-string v10, "NewsTitle"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 50
    .local v1, "NewsTitle":Lorg/json/JSONArray;
    const-string v10, "NewsIDAr"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 51
    .local v0, "NewsIDAr":Lorg/json/JSONArray;
    const/4 v10, 0x0

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getInt(I)I

    move-result v10

    sput v10, Lcom/example/hussienalrubaye/webview/GlobalClass;->LastNewsID:I

    .line 54
    const/4 v10, 0x1

    sput-boolean v10, Lcom/example/hussienalrubaye/webview/ServiceNotification;->SendtNotification:Z

    .line 55
    new-instance v8, Landroid/content/Intent;

    const-class v10, Lcom/example/hussienalrubaye/webview/MyBroadcastReceiver;

    invoke-direct {v8, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 56
    .local v8, "myintent":Landroid/content/Intent;
    const-string v10, "NewsTitle"

    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    invoke-virtual {p0, v8}, Lcom/example/hussienalrubaye/webview/ServiceNotification;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 69
    .end local v0    # "NewsIDAr":Lorg/json/JSONArray;
    .end local v1    # "NewsTitle":Lorg/json/JSONArray;
    .end local v3    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v4    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v6    # "js":Lorg/json/JSONObject;
    .end local v8    # "myintent":Landroid/content/Intent;
    .end local v9    # "result":Ljava/lang/String;
    :cond_0
    :goto_2
    const-wide/32 v10, 0xc350

    :try_start_1
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 70
    :catch_0
    move-exception v10

    goto/16 :goto_0

    .line 43
    .restart local v3    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    :cond_1
    :try_start_2
    const-string v9, "Did not work"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .restart local v9    # "result":Ljava/lang/String;
    goto :goto_1

    .line 74
    .end local v3    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v4    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "murl":Ljava/lang/String;
    .end local v9    # "result":Ljava/lang/String;
    :cond_2
    return-void

    .line 63
    .restart local v7    # "murl":Ljava/lang/String;
    :catch_1
    move-exception v10

    goto :goto_2
.end method
