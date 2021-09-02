class Chatroom < ApplicationRecord
  has_many :messages
  has_many :last_messages
  belongs_to :service

end
