class Notdog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :owner, :cost_per_day, :description, :name, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :messages
  validate :photo_present

  def photo_present
    unless self.photo.attached?
      self.photo.attach(io: File.open(Dir.getwd + "/app/assets/images/notdog-marker.png"), filename: "default.png", content_type: 'image/png')
    end
  end

  def average_score
    self.reviews.average(:user_score)
  end
end
