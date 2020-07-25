class Booking < ApplicationRecord
  belongs_to :notdog
  belongs_to :user
  has_one :owner, through: :notdog
  has_many :reviews
  validates :notdog, :start_date, :end_date, :user, presence: true
  validate :start_date_lower_than_end_date
  validate :start_date_lower_than_today
  # validate :notdog_booked

  def start_date_lower_than_end_date
    if start_date > end_date
      errors.add(:start_date, "no puede ser mayor que la fecha final")
    end
  end

  def start_date_lower_than_today
    if Date.today > start_date
      errors.add(:start_date, "no puede ser en el pasado, Marty!")
    end
  end

  def notdog_booked
    start_date = self.start_date.beginning_of_day
    end_date = self.end_date.end_of_day
    if Booking.where(notdog_id: self.notdog_id).where('start_date BETWEEN ? AND ?', start_date, end_date).where('end_date BETWEEN ? AND ?', start_date, end_date).present?
      errors.add(:start_date, "el Notdog ya está reservado en esas fechas!")
    end
    #if !Booking.where(:start_date => start_date..end_date, :end_date => start_date..end_date, :notdog_id => self.notdog_id).empty?
    #  errors.add(:start_date, "el Notdog ya está reservado en esas fechas!")
    #end
  end
end
