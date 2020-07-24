class Booking < ApplicationRecord
  belongs_to :notdog
  belongs_to :user
  has_one :owner, through: :notdog
  has_one :review
  validates :notdog, :start_date, :end_date, :user, presence: true
  validate :start_date_lower_than_end_date
  validate :start_date_lower_than_today
  validate :valid_booking_status

  def start_date_lower_than_end_date
    if start_date > end_date
      errors.add(:start_date, "no puede ser mayor que la fecha final")
    end
  end

  def valid_booking_status
    status == "pending" || status == "accepted" || status == "rejected"
  end

  def start_date_lower_than_today
    Date.today > start_date ? errors.add(:start_date, "no puede ser en el pasado, Marty!") : true
  end
end
