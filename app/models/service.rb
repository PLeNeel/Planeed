class Service < ApplicationRecord
  has_many :users
  has_many :missions, dependent: :destroy
  has_many :bookings, through: :missions
  has_many :toxics, dependent: :destroy
  has_many :chatrooms
  validates :name, :phone_number, :predominant_disease, :typical_workday, :predominant_drugs, presence: true
end
