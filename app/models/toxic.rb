class Toxic < ApplicationRecord
  belongs_to :service
  has_many :withdraws
  validates :name, :total_quantity, :current_quantity, :name, presence: true
  validates :total_quantity, numericality: { only_integer: true }
end
