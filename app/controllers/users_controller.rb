class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def edit
  end

  def show
    @user = User.find(params[:id])
    
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :nick_name)
  end

  #ユーザー本人のみアクセス可能にする
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
