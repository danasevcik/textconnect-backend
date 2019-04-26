class User < ApplicationRecord

  has_secure_password

  has_many :messages
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :friendships
  has_many :amigas, through: :friendships

  validates :username, uniqueness: { case_sensitive: true}

end
