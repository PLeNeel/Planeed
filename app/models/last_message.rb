class LastMessage < ApplicationRecord
  belongs_to :message, optional: true
  belongs_to :chatroom, optional: true
  belongs_to :user
end
