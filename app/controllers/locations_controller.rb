class LocationsController < ApplicationController
  before_action :find_location, only: [:edit, :update, :destroy]

  def index
    @locations = Location.all

    #create markers for the map
    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.title location.name
      #to do, complete the json to include html style
      marker.infowindow location.description
    end
  end

  def create
    @location = Location.new(location_params)
    # authorize @post
    if @location.save
      redirect_to page_path('home')
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to page_path('home')
    else
      render :index
    end
  end

  def destroy
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :description)
  end
end
