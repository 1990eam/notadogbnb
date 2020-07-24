class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :asc)
  end

  def show
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @notdog = Notdog.find(params[:notdog_id].to_i)
    @booking.notdog = @notdog
    @dates = set_invalid_dates
    authorize @notdog
    authorize @booking
  end

  def create
    @booking = Booking.new(start_date: booking_params[:start_date].split[0], end_date: booking_params[:start_date].split[2])
    @booking.user = current_user
    @booking.notdog = Notdog.find(params[:notdog_id])
    @notdog = Notdog.find(params[:notdog_id])
    @booking.price = @booking.notdog.cost_per_day * (@booking.end_date - @booking.start_date)
    authorize @booking
    if @booking.save
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

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :notdog, :user, :price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_invalid_dates
    array = []
    bookings = Booking.where(notdog_id: @notdog.id)
    bookings.each do |booking|
      booking_dates = {from: booking.start_date.to_s, to: booking.end_date.to_s}
      array << JSON.generate(booking_dates)
    end
    array
  end
end
