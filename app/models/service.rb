class Service < ApplicationRecord
  has_many :users
  has_many :missions
  has_many :toxics
  validates :name, :phone_number, :predominant_disease, :typical_workday, :predominant_drugs, presence: true
end
