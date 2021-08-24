class Mission < ApplicationRecord
  belongs_to :service
  has_many :bookings
  validates :date, :description, presence: true
end
