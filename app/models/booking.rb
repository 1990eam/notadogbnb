class Booking < ApplicationRecord
  belongs_to :notdog
  belongs_to :user
  has_one :owner, through: :notdog
  validates :notdog, :start_date, :end_date, :user, presence: true
end
