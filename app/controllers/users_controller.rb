class UsersController < ApplicationController
  before_action :set_user, only: [:show, :search, :get_image_url]
  before_action :get_image_url
  before_action :search_movie, only: [:show, :search]


  def show
    @movies = @user.movies.order("created_at DESC")
    movie_count
  end

  def search
    @movies = @q.result.order("created_at DESC")
  end

  private

  def get_image_url
    @image_url = @user.movies.where.not(image_url: "").pluck(:image_url)
  end

  def set_user
    @user = User.find(params[:id])
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
