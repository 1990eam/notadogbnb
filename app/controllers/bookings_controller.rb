class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def index
    @bookings = policy_scope(Booking).order(created_at: :asc)
  end

  def show
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @notdog = params[:notdog_id]
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.notdog = Notdog.find(params[:notdog_id])
    @booking.price = @booking.notdog.cost_per_day * (@booking.end_date - @booking.start_date)
    authorize @booking
    if @booking.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :show
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :notdog, :user, :price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
