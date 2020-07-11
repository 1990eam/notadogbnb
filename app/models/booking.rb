class Booking < ApplicationRecord
  belongs_to :notdog
  belongs_to :user
  has_one :owner, through: :notdog
  validates :time, :notdog, :user, presence: true
end
