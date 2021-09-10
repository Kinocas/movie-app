class RoomsController < ApplicationController
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

end
