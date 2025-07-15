class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @disasters = Disaster.all
  end
end
