class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :user
  # belongs_to :notdog
  # validate :booking_after_end_date
  validates :user_review, presence: true, unless: :owner_review
  validates :owner_review, presence: true, unless: :user_review

  validates :user_score, presence: true, unless: :owner_score
  validates :owner_score, presence: true, unless: :user_score
  validates :owner_score, inclusion: { in: (1..5) }, unless: :user_score
  validates :user_score, inclusion: { in: (1..5) }, unless: :owner_score
  # validate :booking_after_end_date

  scope :valid_user_reviews, -> { where.not(user_score: nil) }

  private

  def booking_after_end_date
    if booking.end_date > Time.current
      errors.add(:booking, "No puede hacer un review antes de terminar su experiencia")
    end
  end
end
