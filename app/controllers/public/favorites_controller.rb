class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    flash[:notice] = "投稿にいいね！しました"
    redirect_to request.referer
    #リクエストを送信した元のページのURL
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    flash[:notice] = "投稿へのいいね！を取り消しました"
    redirect_to request.referer
  end
end
