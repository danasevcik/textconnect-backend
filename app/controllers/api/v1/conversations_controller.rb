class Api::V1::ConversationsController < ApplicationController
  def show
    conversation = Conversation.find_by(id: params[:id])
    if conversation
      project_id = ENV["CLOUD_PROJECT_ID"]
      translate = Google::Cloud::Translate.new project: project_id
      text = "Hello, world!"
      target = "ru"
      translation = translate.translate text, to: target
      puts "Text: #{text}"
      puts "Translation: #{translation}"
      render json: {messages: conversation.messages, conversation_id: conversation.id, conversation: conversation}
    else
      render json: {error: 'That conversation does not exist'}, status: 404
    end
  end

  def create
    conversation = Conversation.new(conversation_params)
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
