class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find_by(params[:id])
    # stream from the found conversaton
    stream_from conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    raise "stop"
  end
end
