class GenresController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page])
  end

  

end
