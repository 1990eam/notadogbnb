class Booking < ApplicationRecord
  belongs_to :notdog
  belongs_to :user
  belongs_to :owner, class_name: "user", foreign_key: 'user_id', through: :notdog
end
