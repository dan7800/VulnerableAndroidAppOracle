.class Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;
.super Landroid/widget/BaseAdapter;
.source "ResourcesName.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/hussienalrubaye/webview/ResourcesName;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyCustomAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;


# direct methods
.method public constructor <init>(Lcom/example/hussienalrubaye/webview/ResourcesName;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 103
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    iget-object v0, v0, Lcom/example/hussienalrubaye/webview/ResourcesName;->fullsongpath:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 113
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 118
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 123
    iget-object v4, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    invoke-virtual {v4}, Lcom/example/hussienalrubaye/webview/ResourcesName;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 124
    .local v0, "mInflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04001c

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 125
    .local v1, "myView":Landroid/view/View;
    iget-object v4, p0, Lcom/example/hussienalrubaye/webview/ResourcesName$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/ResourcesName;

    iget-object v4, v4, Lcom/example/hussienalrubaye/webview/ResourcesName;->fullsongpath:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/hussienalrubaye/webview/ResourceItem;

    .line 126
    .local v2, "s":Lcom/example/hussienalrubaye/webview/ResourceItem;
    const v4, 0x7f0d0055

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 127
    .local v3, "textView":Landroid/widget/TextView;
    iget-object v4, v2, Lcom/example/hussienalrubaye/webview/ResourceItem;->Name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    return-object v1
.end method
