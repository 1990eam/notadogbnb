class AddBookingIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, reference: :booking, index: true
  end
end
