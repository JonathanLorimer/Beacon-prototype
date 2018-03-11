class ContinentsController < ApplicationController
  def index
    @continents = Continent.all
    render json: {data: @continents}
  end

  def show
    @continent = Continent.find(params[:id])
    render json: {data:@continent}
  end
end