class PlacesController < ApplicationController
  def index
    @places = Place.order('created_at DESC')
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Place added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def near_by_stores
    @place = Place.new
  end

  def find_near_by_stores
    logger.info "latitude : #{params[:latitude]}"
    logger.info "longitude : #{params[:longitude]}"
    @place = Place.new(current_params)
    logger.info "#{@place}"
    render :layout => false
  end

  private

  def place_params
    # params.require(:place).permit(:title, :address, :visited_by)
    params.require(:place).permit(:title, :raw_address, :latitude, :longitude, :visited_by)
  end

  def current_params
    params.permit(:latitude, :longitude)
  end

end
