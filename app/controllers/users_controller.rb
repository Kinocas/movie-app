class UsersController < ApplicationController
  before_action :set_user, only: [:show, :search]
  before_action :search_movie, only: [:show, :search]

  def show
    @movies = @user.movies.order("created_at DESC")
  end

  def search
    @movies = @q.result.order("created_at DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def search_movie
    @q = Movie.where(user_id: current_user.id).ransack(params[:q])
  end

end
