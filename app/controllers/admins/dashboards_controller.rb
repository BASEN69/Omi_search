class Admins::DashboardsController < ApplicationController
  layout 'admin'
  def index
    @posts = Post.page(params[:page]).per(50)

  end
end
