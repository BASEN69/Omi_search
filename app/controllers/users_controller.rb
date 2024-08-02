class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:my_page]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def my_page
    @user = current_user
    render :show
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
    redirect_to about_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :nick_name, :email)
  end

  #ユーザー本人のみアクセス可能にする
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
