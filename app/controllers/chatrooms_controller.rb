class ChatroomsController < ApplicationController
  def show
    @service = current_user.service
    @chatroom = Chatroom.find(params[:id])
    @last_message = LastMessage.create(user: current_user, message: @chatroom.messages.last)
    @message = Message.new
  end
end
