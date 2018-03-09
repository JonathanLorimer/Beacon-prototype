class CountriesController < ApplicationController
  def index
    @countries = Country.all
    render json: {data: @countries}
  end

  def show
    render json: {data:@country}
  end
end
