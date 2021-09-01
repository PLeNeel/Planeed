class Toxic < ApplicationRecord
  belongs_to :service
  has_many :withdraws, dependent: :destroy
  validates :name, :total_quantity, :current_quantity, presence: true
  validates :total_quantity, numericality: { only_integer: true }
end
