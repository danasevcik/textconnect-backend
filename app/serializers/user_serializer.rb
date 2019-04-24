class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :bio, :phone_number, :language, :photo, :username, :password
end
