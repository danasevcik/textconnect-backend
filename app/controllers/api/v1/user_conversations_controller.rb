class Api::V1::UserConversationsController < ApplicationController

  def create
    # byebug
    @user = User.find(params[:user][:user_id])
    @amiga = User.find(params[:user][:amiga_id])
    @conversation = Conversation.create(title: "Conversation with #{@user.username.capitalize} and #{@amiga.username.capitalize}")
    @user_conversation = UserConversation.create(conversation_id: @conversation.id, user_id: @user.id)
    @amiga_conversation = UserConversation.create(conversation_id: @conversation.id, user_id: @amiga.id)
    render json: {user_conversation: @user_conversation, amiga_conversation: @amiga_conversation}
  end

end
