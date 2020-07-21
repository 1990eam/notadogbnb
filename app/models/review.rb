class Review < ApplicationRecord
  belongs_to :user
  validates :end_date
end
