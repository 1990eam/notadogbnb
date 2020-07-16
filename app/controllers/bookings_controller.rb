class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update]
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show; end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
  end

  def edit

  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:time)
  end

  def set_booking
    @booking = booking.find(params[:id])
    authorize @booking
  end
end
