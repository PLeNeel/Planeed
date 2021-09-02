class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :last_messages
end
