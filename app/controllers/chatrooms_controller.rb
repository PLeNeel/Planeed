class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @last_message = LastMessage.create(user: current_user, message: @chatroom.messages.last)
    @message = Message.new
  end
end
