class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:my_booked]


  def index
    @bookings = policy_scope(Booking).order(created_at: :asc)
  end

  def show
    @markers =
    [{
      lat: @booking.notdog.latitude,
      lng: @booking.notdog.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { notdog: @notdog }),
      image_url: helpers.asset_url('notdog-marker.png')
      }]
  end

  def new
    @booking = Booking.new
    @notdog = Notdog.find(params[:notdog_id].to_i)
    @booking.notdog = @notdog
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

  def my_booked
    @notdogs = current_user.notdogs
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "accepted")
    redirect_to my_booked_path
  end

  def decline
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "declined")
    redirect_to my_booked_path
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
