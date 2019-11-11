class MessageSerializer < ActiveModel::Serializer
  
  # send the conversation id that this message belongs to
  # and content of message
  attributes :id, :conversation_id, :content, :created_at

end
