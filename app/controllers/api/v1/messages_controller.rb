class Api::V1::MessagesController < ApplicationController

  def create

  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end

end
