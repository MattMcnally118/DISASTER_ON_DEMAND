class BookingsController < ApplicationController
  before_action :set_booking, only: %w[show edit update destroy]
  # This calls the private method set_disaster
  before_action :set_disaster

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
    @booking = Booking.new(booking_params)
    # This sets the Disaster ID of the booking
    @booking.disaster_id = @disaster.id
    if @booking.save
      redirect_to disaster_bookings_path(@disaster)
    else
      render :new, status: :unprocessable_entity
    end
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
    redirect_to disaster_bookings_path(@disaster), status: :see_other
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
