class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # find the conversation from the given conversation id
    # stream for the found conversation
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation
  end

  def unsubscribed
    # stop the channel from unsubscribing
    raise "stop"
    # Any cleanup needed when channel is unsubscribed
  end
end
