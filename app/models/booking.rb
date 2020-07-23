class Booking < ApplicationRecord
  belongs_to :notdog
  belongs_to :user
  has_one :owner, through: :notdog
  has_one :review
  validates :notdog, :start_date, :end_date, :user, presence: true
  #validates :start_date_lower_than_end_date

  def start_date_lower_than_end_date
    if start_date > end_date
      errors.add(:start_date, "No puede ser mayor que la fecha final")
    end
  end
end
