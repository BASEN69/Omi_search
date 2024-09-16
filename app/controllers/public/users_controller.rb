class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:my_page, :edit ]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy,:favorites]
  before_action :ensure_guest_user, only: [:edit, :my_page]

  def my_page
    @user = current_user
    @posts = @user.posts.page(params[:page])
    render :show
  end

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "アカウントが削除されました"
    redirect_to new_user_registration_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @post = Post.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end


  private

  def user_params
    params.require(:user).permit(:name, :nick_name, :email)
  end


  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:alert] = "あなたはアクセスする権限がありません"
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    if current_user.guest_user?
      redirect_to :root , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
