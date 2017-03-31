.class Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;
.super Ljava/lang/Object;
.source "SubResources.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

.field final synthetic val$bufolow:Landroid/widget/Button;

.field final synthetic val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

.field final synthetic val$txtflollower:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;Lcom/example/hussienalrubaye/webview/SubResourceItems;Landroid/widget/Button;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iput-object p2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iput-object p3, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$bufolow:Landroid/widget/Button;

    iput-object p4, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$txtflollower:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v5, 0x7f06001d

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 125
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v1, v1, Lcom/example/hussienalrubaye/webview/SubResourceItems;->isfolowed:I

    if-ne v1, v3, :cond_0

    .line 126
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iput v4, v1, Lcom/example/hussienalrubaye/webview/SubResourceItems;->isfolowed:I

    .line 127
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v2, v2, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "MobileWebService1.asmx/Follow2Unfallow?UserID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&SubNesourceID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v2, v2, Lcom/example/hussienalrubaye/webview/SubResourceItems;->ID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&Tag=0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "murl":Ljava/lang/String;
    new-instance v1, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v2, v2, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-direct {v1, v2}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;-><init>(Lcom/example/hussienalrubaye/webview/SubResources;)V

    new-array v2, v3, [Ljava/lang/String;

    aput-object v0, v2, v4

    invoke-virtual {v1, v2}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 131
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$bufolow:Landroid/widget/Button;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v2, v2, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v2}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f060018

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$txtflollower:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v3, v3, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v3}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v3, v3, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$bufolow:Landroid/widget/Button;

    const v2, 0x7f02003e

    invoke-virtual {v1, v4, v4, v2, v4}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 148
    :goto_0
    return-void

    .line 137
    .end local v0    # "murl":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iput v3, v1, Lcom/example/hussienalrubaye/webview/SubResourceItems;->isfolowed:I

    .line 138
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v2, v2, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->WebURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "MobileWebService1.asmx/Follow2Unfallow?UserID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/example/hussienalrubaye/webview/GlobalClass;->UserID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&SubNesourceID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v2, v2, Lcom/example/hussienalrubaye/webview/SubResourceItems;->ID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&Tag=1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 141
    .restart local v0    # "murl":Ljava/lang/String;
    new-instance v1, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v2, v2, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-direct {v1, v2}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;-><init>(Lcom/example/hussienalrubaye/webview/SubResources;)V

    new-array v2, v3, [Ljava/lang/String;

    aput-object v0, v2, v4

    invoke-virtual {v1, v2}, Lcom/example/hussienalrubaye/webview/SubResources$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 142
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$bufolow:Landroid/widget/Button;

    iget-object v2, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v2, v2, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v2}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f060012

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$txtflollower:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->this$1:Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;

    iget-object v3, v3, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter;->this$0:Lcom/example/hussienalrubaye/webview/SubResources;

    invoke-virtual {v3}, Lcom/example/hussienalrubaye/webview/SubResources;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$s:Lcom/example/hussienalrubaye/webview/SubResourceItems;

    iget v3, v3, Lcom/example/hussienalrubaye/webview/SubResourceItems;->folowers:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v1, p0, Lcom/example/hussienalrubaye/webview/SubResources$MyCustomAdapter$1;->val$bufolow:Landroid/widget/Button;

    const v2, 0x7f02003f

    invoke-virtual {v1, v4, v4, v2, v4}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto/16 :goto_0
.end method
