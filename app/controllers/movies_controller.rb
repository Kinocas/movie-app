class MoviesController < ApplicationController
  before_action :get_image_url
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destory, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destory]
  before_action :search_movie

  def index
    @movies = Movie.where(release: "公開").includes(:user).order("created_at DESC")
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
    @movies = @q.result.order("created_at DESC")
  end

  private

  def movie_params
    params.require(:movie).permit(:movie_title, :image, :image_url, :thought, :genre_id, :evaluation, :release).merge(user_id: current_user.id)
  end 

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @movie.user_id
      redirect_to action: :index
    end
  end

  def get_image_url
    @image_url = Movie.where.not(image_url: "").pluck(:image_url)
  end

  def search_movie
    @q = Movie.where(release: "公開").ransack(params[:q])
  end

end
