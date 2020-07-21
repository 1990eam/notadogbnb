class Message < ApplicationRecord
  belongs_to :notdog
  belongs_to :user

  validates :body, presence: true
end
