.class public Lcom/example/hussienalrubaye/webview/SubResourceItems;
.super Ljava/lang/Object;
.source "SubResourceItems.java"


# instance fields
.field public ChannelImage:Ljava/lang/String;

.field public ID:I

.field public Name:Ljava/lang/String;

.field public folowers:I

.field public isfolowed:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .locals 0
    .param p1, "Name"    # Ljava/lang/String;
    .param p2, "folowers"    # I
    .param p3, "ID"    # I
    .param p4, "isfolowed"    # I
    .param p5, "ChannelImage"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/SubResourceItems;->Name:Ljava/lang/String;

    .line 15
    iput p3, p0, Lcom/example/hussienalrubaye/webview/SubResourceItems;->ID:I

    .line 16
    iput p4, p0, Lcom/example/hussienalrubaye/webview/SubResourceItems;->isfolowed:I

    .line 17
    iput p2, p0, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    .line 18
    iput-object p5, p0, Lcom/example/hussienalrubaye/webview/SubResourceItems;->ChannelImage:Ljava/lang/String;

    .line 20
    return-void
.end method
