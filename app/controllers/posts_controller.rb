class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
    
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿の更新に成功しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "投稿の削除に成功しました"
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :category, images: [])
  end

  def ensure_current_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      flash[:alert] = "あなたはこの投稿を編集する権限がありません"
      redirect_to posts_path
    end
  end
end
