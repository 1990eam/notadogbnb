class Notdog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :owner, :cost_per_day, :description, :name, :address, presence: true
end
