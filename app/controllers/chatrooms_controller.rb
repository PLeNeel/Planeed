class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    #@last_message = current_user.
    @message = Message.new
  end


end
