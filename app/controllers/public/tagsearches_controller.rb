class Public::TagsearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @word = params[:content]
    @posts = Post.where("category LIKE?","%#{@word}%").page(params[:page]).per(10)
    render "public/tagsearches/tagsearch"
  end
end
