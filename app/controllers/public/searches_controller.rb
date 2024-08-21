class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "post"
      @records = Post.search_for(@content, @method).page(params[:page]).per(10)
    else
      @records = User.search_for(@content, @method).page(params[:page]).per(10)
    end
  end
end
