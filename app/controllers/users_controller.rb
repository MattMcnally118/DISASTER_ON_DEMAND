class UsersController < ApplicationController
  before_action :authenticate_user!
  # Method to change the users role
  def toggle_role
    if current_user.visitor?
      current_user.owner!
    else
      current_user.visitor!
    end
    redirect_back fallback_location: root_path, notice: "Your role is now #{current_user.role.humanize}"
  end
end
