class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    # find the conversation from the id
    # stream from the found conversaton
    conversation = Conversation.find_by(params[:id])
    stream_from conversation
  end

  def unsubscribed
    # stop the channel from unsubscribing
    raise "stop"
  end
end
