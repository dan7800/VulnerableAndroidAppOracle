.class public Lcom/example/hussienalrubaye/webview/FileLoad;
.super Ljava/lang/Object;
.source "FileLoad.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;
    }
.end annotation


# static fields
.field private static FILENAME:Ljava/lang/String;


# instance fields
.field public context:Landroid/content/Context;

.field public result:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "SettingFile2"

    sput-object v0, Lcom/example/hussienalrubaye/webview/FileLoad;->FILENAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/FileLoad;->context:Landroid/content/Context;

    .line 29
    return-void
.end method


# virtual methods
.method public LoadData()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 61
    :try_start_0
    new-instance v5, Ljava/lang/StringBuffer;

    const-string v6, ""

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 62
    .local v5, "strContent":Ljava/lang/StringBuffer;
    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/FileLoad;->context:Landroid/content/Context;

    sget-object v7, Lcom/example/hussienalrubaye/webview/FileLoad;->FILENAME:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v3

    .line 63
    .local v3, "fin":Ljava/io/FileInputStream;
    :goto_0
    invoke-virtual {v3}, Ljava/io/FileInputStream;->read()I

    move-result v1

    .local v1, "ch":I
    const/4 v6, -0x1

    if-eq v1, v6, :cond_1

    .line 64
    int-to-char v6, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    .end local v1    # "ch":I
    .end local v3    # "fin":Ljava/io/FileInputStream;
    .end local v5    # "strContent":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v2

    .line 75
    .local v2, "e":Ljava/io/IOException;
    new-instance v6, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;

    invoke-direct {v6, p0}, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;-><init>(Lcom/example/hussienalrubaye/webview/FileLoad;)V

    new-array v7, v8, [Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/example/hussienalrubaye/webview/FileLoad$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 77
    .end local v2    # "e":Ljava/io/IOException;
    :cond_0
    :goto_1
    return-void

    .line 65
    .restart local v1    # "ch":I
    .restart local v3    # "fin":Ljava/io/FileInputStream;
    .restart local v5    # "strContent":Ljava/lang/StringBuffer;
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 67
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "CurrentString":Ljava/lang/String;
    const-string v6, ":"

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 70
    .local v4, "separated":[Ljava/lang/String;
    array-length v6, v4

    if-le v6, v9, :cond_0

    .line 71
    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    sput v6, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    .line 72
    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    sput v6, Lcom/example/hussienalrubaye/webview/GlobalClass;->LastNewsID:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public SaveData()V
    .locals 6

    .prologue
    .line 36
    :try_start_0
    const-string v2, "F"

    .line 38
    .local v2, "string":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/example/hussienalrubaye/webview/GlobalClass;->LastNewsID:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/FileLoad;->context:Landroid/content/Context;

    sget-object v4, Lcom/example/hussienalrubaye/webview/FileLoad;->FILENAME:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 41
    .local v1, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 42
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 45
    invoke-virtual {p0}, Lcom/example/hussienalrubaye/webview/FileLoad;->LoadData()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v2    # "string":Ljava/lang/String;
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/FileLoad;->context:Landroid/content/Context;

    const-string v4, "Unable to write to the SettingFile file."

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
