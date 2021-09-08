class RoomsController < ApplicationController
  before_action :get_image_url

  def index
    @rooms = Room.includes(:user).order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    @room=Room.new(room_params)
    if @room.valid?
      @room.save
      redirect_to rooms_path
    else
      render :new
    end 
  end

  def show
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :purpose).merge(user_id: current_user.id)
  end

  def get_image_url
    @image_url = Movie.where.not(image_url: "").pluck(:image_url)
  end

end
