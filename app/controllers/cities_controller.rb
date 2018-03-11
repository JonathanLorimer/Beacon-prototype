class CitiesController < ApplicationController
  def index

    if params[:region_id]
      @cities = City.where(region_id: params[:region_id])
      render json: {data: @cities}
    else
      @cities = City.all
      render json: {data: @cities}
    end
  end

  def show
    @city = City.find(params[:id])
    render json: {data:@city}
  end
end
