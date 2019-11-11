class UserSerializer < ActiveModel::Serializer
  
  # send all attributes of a user and include that user's conversations
  attributes :id, :name, :age, :bio, :phone_number, :language, :photo, :username, :password, :conversations

end
