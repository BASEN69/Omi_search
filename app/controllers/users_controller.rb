class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:my_page, :edit]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def my_page
    @user = current_user
    render :show
  end



  def show
    @user = User.find(params[:id])
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
    redirect_to about_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :nick_name, :email)
  end


  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:alert] = "あなたはこのアカウントを編集する権限がありません"
      redirect_to user_path(current_user)
    end
  end
end
