class Api::V1::MessagesController < ApplicationController

  def create
    user = User.find(message_params[:user_id])
    message = Message.new(message_params)
    conversation = Conversation.find(message_params[:conversation_id])
    # userConvosArr = UserConversation.where(conversation_id: conversation.id)
    # firstUserConvo = userConvosArr.first
    # secondUserConvo = userConvosArr.second
    # if !!(firstUserConvo[:user_id] = user.id)
    #   puts 'THATS THE FIRST USER'
    # else if !(firstUserConvo[:user_id] = user.id)
    #   amiga = User.find(firstUserConvo[:user_id])
    # else if !!(secondUserConvo[:user_id] = user.id)
    #   puts 'THATS THE FIRST USER'
    # byebug
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
