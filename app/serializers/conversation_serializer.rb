class ConversationSerializer < ActiveModel::Serializer

  # send attributes of the conversation
  # and the messages that belong to this convo
  attributes :id, :title, :messages
  has_many :messages

end
