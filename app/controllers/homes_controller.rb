class HomesController < ApplicationController
  def top
    @posts = Post.all
    @genres = Genre.all
  end
end
