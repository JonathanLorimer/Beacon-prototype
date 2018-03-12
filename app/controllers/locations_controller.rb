class LocationsController < ApplicationController
  def index
    if params[:district_id]
      @locations = Location.where(district_id: params[:district_id])
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