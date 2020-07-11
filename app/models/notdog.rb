class Notdog < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :bookings
end
