class Admins::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_dashboards_path, notice: 'ユーザーを削除しました。'
  end
end
