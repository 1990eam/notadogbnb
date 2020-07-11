class Notdog < ApplicationRecord
  belongs_to :species
  belongs_to :owner, class_name: "user", foreign_key: 'user_id'
  has_many :bookings
end
