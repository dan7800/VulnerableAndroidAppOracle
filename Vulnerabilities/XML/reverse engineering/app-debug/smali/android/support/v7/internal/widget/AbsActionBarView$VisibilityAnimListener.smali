.class public Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;
.super Ljava/lang/Object;
.source "AbsActionBarView.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/AbsActionBarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "VisibilityAnimListener"
.end annotation


# instance fields
.field private mCanceled:Z

.field mFinalVisibility:I

.field final synthetic this$0:Landroid/support/v7/internal/widget/AbsActionBarView;


# direct methods
.method protected constructor <init>(Landroid/support/v7/internal/widget/AbsActionBarView;)V
    .locals 1

    .prologue
    .line 277
    iput-object p1, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->this$0:Landroid/support/v7/internal/widget/AbsActionBarView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 278
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mCanceled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 304
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mCanceled:Z

    .line 305
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 296
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mCanceled:Z

    if-eqz v0, :cond_0

    .line 300
    :goto_0
    return-void

    .line 298
    :cond_0
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->this$0:Landroid/support/v7/internal/widget/AbsActionBarView;

    const/4 v1, 0x0

    iput-object v1, v0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisibilityAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 299
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->this$0:Landroid/support/v7/internal/widget/AbsActionBarView;

    iget v1, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mFinalVisibility:I

    # invokes: Landroid/view/View;->setVisibility(I)V
    invoke-static {v0, v1}, Landroid/support/v7/internal/widget/AbsActionBarView;->access$101(Landroid/support/v7/internal/widget/AbsActionBarView;I)V

    goto :goto_0
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 290
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->this$0:Landroid/support/v7/internal/widget/AbsActionBarView;

    # invokes: Landroid/view/View;->setVisibility(I)V
    invoke-static {v0, v1}, Landroid/support/v7/internal/widget/AbsActionBarView;->access$001(Landroid/support/v7/internal/widget/AbsActionBarView;I)V

    .line 291
    iput-boolean v1, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mCanceled:Z

    .line 292
    return-void
.end method

.method public withFinalVisibility(Landroid/support/v4/view/ViewPropertyAnimatorCompat;I)Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;
    .locals 1
    .param p1, "animation"    # Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .param p2, "visibility"    # I

    .prologue
    .line 283
    iget-object v0, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->this$0:Landroid/support/v7/internal/widget/AbsActionBarView;

    iput-object p1, v0, Landroid/support/v7/internal/widget/AbsActionBarView;->mVisibilityAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 284
    iput p2, p0, Landroid/support/v7/internal/widget/AbsActionBarView$VisibilityAnimListener;->mFinalVisibility:I

    .line 285
    return-object p0
.end method
