class Api::V1::UserConversationsController < ApplicationController

  def create
    # find user & amiga
    # find or create conversation
    # find or create instance of UserConversation (for both users)
    @user = User.find(params[:user][:user_id])
    @amiga = User.find(params[:user][:amiga_id])
    @conversation = Conversation.find_or_create_by(title: "Conversation with #{@user.username.capitalize} and #{@amiga.username.capitalize}")
    @user_conversation = UserConversation.find_or_create_by(conversation_id: @conversation.id, user_id: @user.id)
    @amiga_conversation = UserConversation.find_or_create_by(conversation_id: @conversation.id, user_id: @amiga.id)
    render json: {user_conversation: @user_conversation, amiga_conversation: @amiga_conversation}
  end

end
