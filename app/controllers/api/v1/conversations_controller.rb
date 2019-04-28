class Api::V1::ConversationsController < ApplicationController
  def show
    conversation = Conversation.find_by(id: params[:id])
    user = User.find(params[:user][:user_id])
    # byebug
    if conversation
      project_id = ENV["CLOUD_PROJECT_ID"]
      translate = Google::Cloud::Translate.new project: project_id
      target = user.language

      messages = conversation.messages.map { |text|
        if text.content
          translate.translate text.content, to: target
        else
          translate.translate text, to:target
        end
      }

      render json: {messages: messages, conversation_id: conversation.id, conversation: conversation}
    else
      render json: {error: 'That conversation does not exist'}, status: 404
    end
  end

  def create
    byebug
    conversation = Conversation.find_or_create_by(conversation_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
