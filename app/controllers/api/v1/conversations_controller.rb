class Api::V1::ConversationsController < ApplicationController

  def show
    conversation = Conversation.find_by(id: params[:id])

    if conversation
      render json: conversation.messages
    else
      render json: {error: 'That conversation does not exist'}, status: 404
    end
  end

  def create

  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
