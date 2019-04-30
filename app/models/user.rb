class User < ApplicationRecord

  has_secure_password

  has_many :messages
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :friendships
  has_many :amigas, through: :friendships

  # validations for username, password and language
  validates :username, uniqueness: { case_sensitive: true}
  validates :password, presence: true
  validates :language, presence: true

end
