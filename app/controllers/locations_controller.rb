class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: {data: @locations}
  end

  def show
    @location = Location.find(params[:id])
    render json: {data:@location}
  end
end