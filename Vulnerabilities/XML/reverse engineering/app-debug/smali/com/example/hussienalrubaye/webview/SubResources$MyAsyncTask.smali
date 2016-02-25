.class public Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;
.super Landroid/os/AsyncTask;
.source "SubResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/hussienalrubaye/webview/SubResources;
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
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/SubResources;


# direct methods
.method public constructor <init>(Lcom/example/hussienalrubaye/webview/SubResources;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 155
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 166
    :try_start_0
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 167
    .local v1, "httpClient":Lorg/apache/http/client/HttpClient;
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 168
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 169
    .local v3, "inputStream":Ljava/io/InputStream;
    if-eqz v3, :cond_0

    .line 170
    iget-object v4, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-static {v3}, Lcom/example/hussienalrubaye/webview/Operations;->ConvertInputToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/example/hussienalrubaye/webview/SubResources;->result:Ljava/lang/String;

    .line 173
    :goto_0
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-object v6, v6, Lcom/example/hussienalrubaye/webview/SubResources;->result:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {p0, v4}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 180
    .end local v1    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :goto_1
    const/4 v4, 0x0

    return-object v4

    .line 172
    .restart local v1    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    :cond_0
    iget-object v4, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    const-string v5, "Did not work"

    iput-object v5, v4, Lcom/example/hussienalrubaye/webview/SubResources;->result:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 175
    .end local v1    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 155
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 14
    .param p1, "result1"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-boolean v0, v0, Lcom/example/hussienalrubaye/webview/SubResources;->isListOfChannel:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 188
    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-object v0, v0, Lcom/example/hussienalrubaye/webview/SubResources;->result:Ljava/lang/String;

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 189
    .local v12, "js":Lorg/json/JSONObject;
    const-string v0, "ResourcesName"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 190
    .local v10, "SubResourcesName":Lorg/json/JSONArray;
    const-string v0, "SubNesourceID"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 191
    .local v9, "SubNesourceID":Lorg/json/JSONArray;
    const-string v0, "IsFollow"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 192
    .local v7, "IsFollow":Lorg/json/JSONArray;
    const-string v0, "NumberOfFollowers"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 193
    .local v8, "NumberOfFollowers":Lorg/json/JSONArray;
    const-string v0, "ChannelImage"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 194
    .local v6, "ChannelImage":Lorg/json/JSONArray;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v11, v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-object v13, v0, Lcom/example/hussienalrubaye/webview/SubResources;->fullsongpath:Ljava/util/ArrayList;

    new-instance v0, Lcom/example/hussienalrubaye/webview/SubResourceItems;

    invoke-virtual {v10, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v11}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    invoke-virtual {v9, v11}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    invoke-virtual {v6, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/example/hussienalrubaye/webview/SubResourceItems;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-object v0, v0, Lcom/example/hussienalrubaye/webview/SubResources;->ls:Landroid/widget/ListView;

    new-instance v1, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-direct {v1, v2}, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;-><init>(Lcom/example/hussienalrubaye/webview/SubResources;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .end local v6    # "ChannelImage":Lorg/json/JSONArray;
    .end local v7    # "IsFollow":Lorg/json/JSONArray;
    .end local v8    # "NumberOfFollowers":Lorg/json/JSONArray;
    .end local v9    # "SubNesourceID":Lorg/json/JSONArray;
    .end local v10    # "SubResourcesName":Lorg/json/JSONArray;
    .end local v11    # "i":I
    .end local v12    # "js":Lorg/json/JSONObject;
    :goto_1
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/example/hussienalrubaye/webview/SubResources;->isListOfChannel:Z

    .line 202
    :cond_1
    return-void

    .line 200
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 159
    return-void
.end method
