class UsersController < ApplicationController
  before_action :set_user, only: [:show, :search]

  def show
    @movies = @user.movies.order("created_at DESC")
  end

  def search
    @movies = User.search(params[:keyword], params[:id]).order("created_at DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
