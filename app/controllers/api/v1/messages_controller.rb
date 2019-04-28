class Api::V1::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    conversation = Conversation.find(message_params[:conversation_id])
    if message.save
      MessagesChannel.broadcast_to conversation, message
      render json: message
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end

end
