class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notdogs, dependent: :destroy
  has_many :bookings
  has_many :reservations, through: :notdogs, source: :bookings
  validates :name, :address, :phone, presence: true
end
