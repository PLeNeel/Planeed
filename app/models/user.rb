class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :service
  has_many :availabilities
  has_many :bookings
  has_many :withdraws

  validates :phone_number, :first_name, :last_name, :experience, :speciality, :mail_address, presence: true
end
