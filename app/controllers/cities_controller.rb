class CitiesController < ApplicationController
     def index
    @cities = City.all
    render json: {data: @cities}
  end

  def show
    render json: {data:@city}
  end
end
