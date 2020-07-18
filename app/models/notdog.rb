class Notdog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :owner, :cost_per_day, :description, :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
