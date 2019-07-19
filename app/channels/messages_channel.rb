class MessagesChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation_id])
    # stream for the found conversation
    stream_for conversation
  end

  def unsubscribed
    # puts "here" * 100
    raise "stop"
    # Any cleanup needed when channel is unsubscribed
  end
end
