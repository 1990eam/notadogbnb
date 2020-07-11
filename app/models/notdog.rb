class Notdog < ApplicationRecord
  has_one :taxonomy
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings
  validates :owner, :cost_per_day, :description, presence: true
end
