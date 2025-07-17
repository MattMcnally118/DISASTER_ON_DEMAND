class DisastersController < ApplicationController
  before_action :set_disaster, only: %w[show edit update destroy]

  def index
    @disasters = Disaster.all
    if params[:query].present?
      if params[:query] =~ /\A\d+(\.\d+)?\z/
        num_query = params[:query].to_f
        @disasters = Disaster.where("price <= :num OR intensity >= :num", num: num_query)
      else
        sql_subquery = <<~SQL
          disasters.disaster_type @@ :query
          OR disasters.description @@ :query
          OR disasters.name @@ :query
          OR disasters.location @@ :query
        SQL

        @disasters = Disaster.where(sql_subquery, query: params[:query])
      end
    end
  end


  def show
    # initaialize Booking so a booking can be made in the show page
    @booking = Booking.new
    # This sets markers for the map in the show page
    if @disaster.geocoded?
      @markers = [{
        lat: @disaster.latitude,
        lng: @disaster.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { disaster: @disaster }),
        marker_html: render_to_string(partial: "marker")
      }]
    else
      @markers = []
    end
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    # This sets the new disasters user to the current user that is logged in
    @disaster.user = current_user
    if @disaster.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @disaster.update(disaster_params)
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @disaster.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def disaster_params
    params.require(:disaster).permit(:name, :disaster_type, :location, :description, :intensity, :price, :user_id, :photo)
  end

  def set_disaster
    @disaster = Disaster.find(params[:id])
  end
end
