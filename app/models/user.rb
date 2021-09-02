class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :service
  has_many :availabilities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :withdraws, dependent: :destroy

  validates :phone_number, :first_name, :last_name, :experience, :speciality, presence: true

  def last_withdraw_for(toxic)
    withdraws.where(toxic_id: toxic).last
  end

  def pending_bookings_count
    self.service.bookings.where(progress: "En attente").count
  end

  def no_seen_bookings_count
    self.bookings.where(progress: "Validé", seen: nil).count
  end
end
