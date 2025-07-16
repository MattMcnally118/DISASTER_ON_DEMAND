class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # this allows us to call @disasters on the home page
  def home
    @disasters = Disaster.all
  end

  def dashboard
    # This sets @disasters to the disasters of the current user/ used in owners dashboard
    @disasters = current_user.disasters
    # This allows the new disaster form to be initialized
    @disaster = Disaster.new
    # This sets the @bookings to the bookings of the current user including the disaster/ used in visitors dashboard
    @bookings = current_user.bookings.includes(:disaster)
    # This allows the new review form to be initialized
    @review = Review.new
  end

end
