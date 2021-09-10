class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :search]
  before_action :set_user, only: [:show, :search, :user_to_index, :get_image_url]
  before_action :user_to_index, only: [:show, :search]
  before_action :search_movie, only: [:show, :search]
  before_action :movie_count, only: [:show, :search]


  def show
    if params[:release]== "公開"
      @movies = @user.movies.where(release: "公開").order("created_at DESC")
      @release = "公開"
    elsif params[:release]== "非公開"
      @movies = @user.movies.where(release: "非公開").order("created_at DESC")
      @release = "非公開"
    else
      @movies = @user.movies.order("created_at DESC")
      @release = "すべて"
    end
  end

  def search
    @movies = @q.result.order("created_at DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_to_index
    unless current_user.id == @user.id
      redirect_to movies_path
    end
  end
  
  def search_movie
    @q = Movie.where(user_id: current_user.id).ransack(params[:q])
  end

  def movie_count
    @movie_count_all = []
    4.times do |years_ago|
      @strat_year = Time.now.beginning_of_year.years_ago(years_ago)
      @end_year = Time.now.end_of_year.years_ago(years_ago)
      @movie_count = @user.movies.where(created_at: @strat_year..@end_year).group('MONTH(created_at)').count
      12.times do |month|
        if @movie_count.include?(month+1)
        else
          @movie_count[month+1] = 0
        end
      end
      @movie_count_all << @movie_count.sort
    end
  end

end
