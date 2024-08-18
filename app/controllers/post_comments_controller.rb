class PostCommentsController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :destroy, :update]

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:notice] = "コメントに成功しました"
      redirect_to post_path(post)
    else
      flash[:alert] = "コメントに失敗しました"
      redirect_to post_path(post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = PostComment.find(params[:id])
  end

  def update
    @comment = PostComment.find(params[:id])
    if @comment.update(post_comment_params)
      flash[:notice] = "コメントの更新に成功しました"
      redirect_to post_path(@comment.post.id)
    end
  end

  def destroy
    if PostComment.find(params[:id]).destroy
      flash[:notice] = "コメントの削除に成功しました"
      redirect_to post_path(params[:post_id])
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def ensure_current_user
	  @post_comment = PostComment.find(params[:id])
	  unless @post_comment.user == current_user
	  	flash[:alert] = "あなたはこの投稿を編集する権限がありません"
	  	redirect_to posts_path
	  end
  end
end
