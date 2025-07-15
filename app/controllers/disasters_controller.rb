class DisastersController < ApplicationController
  before_action :set_disaster, only: %w[show edit update destroy]

  def index
    @disasters = Disaster.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    @disaster.user = current_user
    if @disaster.save
      redirect_to disaster_path(@disaster)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @disaster.update(disaster_params)
      redirect_to disaster_path(@disaster)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @disaster.destroy
    redirect_to disasters_path, status: :see_other
  end

  private

  def disaster_params
    params.require(:disaster).permit(:name, :disaster_type, :location, :description, :intensity, :price, :user_id)
  end

  def set_disaster
    @disaster = Disaster.find(params[:id])
  end
end
