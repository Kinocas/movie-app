class MoviesController < ApplicationController

  def index
    @movies = Movie.includes(:user).order("created_at DESC")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.valid?
      @movie.save
      redirect_to root_path
    else
      render :new
    end 
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  def search
    @movies = Movie.search(params[:keyword]).order("created_at DESC")
  end

  private
  def movie_params
    params.require(:movie).permit(:movie_title, :image, :image_url, :thought, :genre_id, :evaluation).merge(user_id: current_user.id)
  end 
end
