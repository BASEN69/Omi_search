class Admins::PostCommentsController < ApplicationController
  layout 'admin'
  
  def index
    @comments = PostComment.all
  end

  def destroy
    if PostComment.find(params[:id]).destroy
      flash[:notice] = "コメントの削除に成功しました"
      redirect_to admins_post_comments_path
    end
  end

end
