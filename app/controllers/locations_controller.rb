class LocationsController < ApplicationController
  def index
    if params[:neighbourhood_id]
      @locations = Location.where(neighbourhood_id: params[:neighbourhood_id])
      render json: {data: @locations}
    else
      @locations = Location.all
      render json: {data:  @locations}
    end
  end

  def show
    @location = Location.find(params[:id])
    render json: {data:@location}
  end
end