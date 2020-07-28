class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notdogs, dependent: :destroy
  has_many :bookings
  has_many :reservations, through: :notdogs, source: :bookings
  has_one_attached :photo
  validates :email, uniqueness: true
  has_many :reviews, through: :bookings, dependent: :destroy
  validate :user_name_present

  def user_name_present
    name.nil? ? self.name = email.split('@').first.capitalize : name
  end

  def user_average_rating
    counter = 0
    quantity = 0
    self.bookings.each do |book|

      if !book.reviews.empty?
        owner_score = book.reviews.where(user_review: nil).pluck(:owner_score)
        if !owner_score.empty?
          counter += owner_score.first
          quantity += 1
        end
      end
    end
      return "No reviews yet" if quantity == 0
        rating_of_user = counter / quantity
  end
end
