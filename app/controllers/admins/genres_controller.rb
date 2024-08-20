class Admins::GenresController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!



  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの登録に成功しました"
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end


  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの更新に成功しました"
      redirect_to admins_genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      flash[:notice] = "ジャンルの削除に成功しました"
      redirect_to admins_genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
