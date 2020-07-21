class Review < ApplicationRecord
  belongs_to :bookings
  validates :end_date
end
