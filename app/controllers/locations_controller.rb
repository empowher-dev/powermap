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
      marker.infowindow ("<div><h1 style='font-size: 20px; color: #385273 '>" + location.name + "</h1>" + "<div style=' padding:5px; font-size: 14px; color: #385273 ; white-space: pre-wrap; white-space: -moz-pre-wrap; white-space: -pre-wrap; white-space: -o-pre-wrap; word-wrap: break-word; text-align: justify'>" + location.description + "</div>" + "<a href='http://" + location.link + "' target='_blank'><em>" + "En savoir plus" + "</em></a></div>")
      marker.picture({
        "url": "http://img11.hostingpics.net/pics/222730faviconempower.png",
        "width": 25,
        "height": 25
        })
      marker.json({ id: location.id })
    end
  end

  def create
    @location = Location.new(location_params)
    # authorize @post
    if @location.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    if @location.delete
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :description, :link, :picture_url)
  end
end
