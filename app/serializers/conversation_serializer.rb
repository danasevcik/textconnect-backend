class ConversationSerializer < ActiveModel::Serializer

  attributes :id, :title, :messages
  has_many :messages

end
