class Notdog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings
  validates :owner, :cost_per_day, :description, :name, presence: true
end
