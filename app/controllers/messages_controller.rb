class MessagesController < ApplicationController
  def create
   room = Room.find(params[:room_id])
   message = Message.new(message_params)
   message.room = room
   message.save!
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end