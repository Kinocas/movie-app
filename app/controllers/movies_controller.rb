class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destory, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destory]

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
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
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

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @movie.user_id
      redirect_to action: :index
    end
  end
end
