class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: {data: @locations}
  end

  def show
    render json: {data:@location}
  end
end