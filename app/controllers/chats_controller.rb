class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @room= Room.find(params[:room_id])
    @chats = @room.chats.includes(:user)
  end

  def create
    @chat=Chat.new(chat_params)
    @room= Room.find(params[:room_id])
    if @chat.valid?
      @chat.save
      redirect_to room_chats_path(@room)
    else
      @chats = @room.chats.includes(:user)
      render :index
    end 
  end

  private

  def chat_params
    params.require(:chat).permit(:chat).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
