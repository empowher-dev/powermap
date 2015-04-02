class LocationsController < ApplicationController
  before_action :find_location

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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_location
  end

  def location_params
    params.require(:location).permit(:name, :city, :description)
  end
end
