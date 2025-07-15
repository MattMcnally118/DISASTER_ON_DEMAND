class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @disasters = current_user.disasters
    @disaster = Disaster.new
    @bookings = current_user.bookings.includes(:disaster)
  end

end
