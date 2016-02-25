.class public Lcom/example/hussienalrubaye/webview/GlobalClass;
.super Ljava/lang/Object;
.source "GlobalClass.java"


# static fields
.field public static Deviceuid:Ljava/lang/String;

.field public static LastNewsID:I

.field public static ServiceIsRun:Z

.field public static UserID:I

.field public static WebURL:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 7
    const-string v0, "http://news.alrubaye.com/"

    sput-object v0, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    .line 9
    sput v1, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    .line 10
    sput v1, Lcom/example/hussienalrubaye/webview/GlobalClass;->LastNewsID:I

    .line 12
    const/4 v0, 0x0

    sput-boolean v0, Lcom/example/hussienalrubaye/webview/GlobalClass;->ServiceIsRun:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
