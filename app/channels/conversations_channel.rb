class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from expects a string - we will give it conversations channel
    stream_from "conversations_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
