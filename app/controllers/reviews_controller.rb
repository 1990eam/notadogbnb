class ReviewsController < ApplicationController
  def index
    notdog = policy_scope(Notdog).find(params[:notdog_id])
    @reviews = notdog.reviews
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save!
      redirect_to notdog_path(@booking.notdog)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_review, :user_score, :owner_review, :owner_score)
  end
end
