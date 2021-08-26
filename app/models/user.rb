class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :service
  has_many :availabilities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :withdraws

  validates :phone_number, :first_name, :last_name, :experience, :speciality, presence: true
end
