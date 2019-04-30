class Api::V1::ConversationsController < ApplicationController
  def show
    # find conversation & user
    conversation = Conversation.find_by(id: params[:id])
    user = User.find(params[:user][:user_id])

    # if there is a conversation, initiate translation
    if conversation
      project_id = ENV["CLOUD_PROJECT_ID"]
      translate = Google::Cloud::Translate.new project: project_id
      target = user.language
      messages = conversation.messages.map { |text|
        # map over messages and send author and message content
        if text.content
          author = User.find(text.user_id)
          message = translate.translate text.content, to: target
          author.username + ": " + message
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
    # create conversation and broadcast
    conversation = Conversation.find_or_create_by(conversation_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  def update
    # update conversation title
    conversation = Conversation.find(params[:id])
    title = params[:title][:title]
    conversation.update(title: title)
    render json: {conversation: conversation}
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
