class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation
  end

  def unsubscribed
    # puts "here" * 100
    raise "stop"
    # Any cleanup needed when channel is unsubscribed
  end
end
