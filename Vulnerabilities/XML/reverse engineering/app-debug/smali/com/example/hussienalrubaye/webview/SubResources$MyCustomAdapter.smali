.class Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;
.super Landroid/widget/BaseAdapter;
.source "SubResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/hussienalrubaye/webview/SubResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyCustomAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/hussienalrubaye/webview/SubResources;


# direct methods
.method public constructor <init>(Lcom/example/hussienalrubaye/webview/SubResources;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 85
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-object v0, v0, Lcom/example/hussienalrubaye/webview/SubResources;->fullsongpath:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 95
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 100
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v9, 0x0

    .line 105
    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v6}, Lcom/example/hussienalrubaye/webview/SubResources;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 106
    .local v1, "mInflater":Landroid/view/LayoutInflater;
    const v6, 0x7f04001d

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 107
    .local v2, "myView":Landroid/view/View;
    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    iget-object v6, v6, Lcom/example/hussienalrubaye/webview/SubResources;->fullsongpath:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/example/hussienalrubaye/webview/SubResourceItems;

    .line 108
    .local v3, "s":Lcom/example/hussienalrubaye/webview/SubResourceItems;
    const v6, 0x7f0d0056

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 109
    .local v4, "textView":Landroid/widget/TextView;
    iget-object v6, v3, Lcom/example/hussienalrubaye/webview/SubResourceItems;->Name:Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    const v6, 0x7f0d0058

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 111
    .local v5, "txtflollower":Landroid/widget/TextView;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v7}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f06001d

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v3, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    const v6, 0x7f0d0057

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 114
    .local v0, "bufolow":Landroid/widget/Button;
    iget v6, v3, Lcom/example/hussienalrubaye/webview/SubResourceItems;->isfolowed:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    .line 115
    const v6, 0x7f02003f

    invoke-virtual {v0, v9, v9, v6, v9}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 116
    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v6}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060012

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 121
    :goto_0
    new-instance v6, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;

    invoke-direct {v6, p0, v3, v0, v5}, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;-><init>(Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;Lcom/example/hussienalrubaye/webview/SubResourceItems;Landroid/widget/Button;Landroid/widget/TextView;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    return-object v2

    .line 118
    :cond_0
    const v6, 0x7f02003e

    invoke-virtual {v0, v9, v9, v6, v9}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 119
    iget-object v6, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v6}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060018

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
