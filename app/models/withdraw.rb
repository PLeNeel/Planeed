class Withdraw < ApplicationRecord
  belongs_to :user
  belongs_to :toxic
  validates :quantity, presence: true
end
