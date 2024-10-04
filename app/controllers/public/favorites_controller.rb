class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save

    @post = post
    #リクエストを送信した元のページのURL
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy

    @post = post
  end
end
