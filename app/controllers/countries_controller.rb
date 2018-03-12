class CountriesController < ApplicationController
  def index
    @countries = Country.all
    render json: {data: @countries}
  end

  def show
    @country = Country.find(params[:id])
    render json: {data:@country}
  end
end
