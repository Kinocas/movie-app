class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.movies.order("created_at DESC")
  end

  def search
    @user = User.find(params[:id])
    @movies = User.search(params[:keyword], params[:id]).order("created_at DESC")
  end
end
