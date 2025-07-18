class BookingsController < ApplicationController
  before_action :set_booking, only: %w[show edit update destroy]
  # This calls the private method set_disaster
  before_action :set_disaster, except: [:destroy]

  def index
    # This sets the bookings to being the Bookings make for a specific disaster (used on the Disasters show page)
    @bookings = @disaster.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @disaster.bookings.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to disaster_booking_path(@disaster, @booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: "Booking deleted", status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :disaster_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  # This makes it possible to call @disaster in any booking methods
  def set_disaster
    @disaster = Disaster.find(params[:disaster_id])
  end
end
