class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :user
  # belongs_to :notdog
  validate :booking_after_end_date
  validates :user_score, :user_review, presence: true
  validates :user_score, inclusion: { in: (1..5) }

  private

  def booking_after_end_date
    if booking.end_date > Time.current
      errors.add(:booking, "No puede hacer un review antes de terminar su experiencia")
    end
  end
end
