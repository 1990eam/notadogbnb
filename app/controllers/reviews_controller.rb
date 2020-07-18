class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review
    @review.save
    redirect_to notdog_path(@notdog)
  end

  private

  def review_params
    params.require(:review).permit(:user_review, :user_score)
  end
end
