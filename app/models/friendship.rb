class Friendship < ApplicationRecord

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :amiga, class_name: "User", foreign_key: "amiga_id"
  
end
