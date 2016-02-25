.class public Lcom/example/hussienalrubaye/webview/ResourceItem;
.super Ljava/lang/Object;
.source "ResourceItem.java"


# instance fields
.field public ID:I

.field public Name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "Name"    # Ljava/lang/String;
    .param p2, "ID"    # I

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/ResourceItem;->Name:Ljava/lang/String;

    .line 14
    iput p2, p0, Lcom/example/hussienalrubaye/webview/ResourceItem;->ID:I

    .line 16
    return-void
.end method
