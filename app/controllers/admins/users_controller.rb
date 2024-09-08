class Admins::UsersController < ApplicationController
  layout 'admin'
  def index
    @users = User.page(params[:page]).per(50)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path, notice: 'ユーザーを削除しました。'
  end
end
