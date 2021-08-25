class MoviesController < ApplicationController

  def index
    @movies = Movie.includes(:user)
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

  private
  def movie_params
    params.require(:movie).permit(:movie_title, :image, :thought, :genre_id, :evaluation).merge(user_id: current_user.id)
  end 
end
