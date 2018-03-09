class ContinentsController < ApplicationController
  def index
    @continents = Continent.all
    render json: {data: @continents}
  end

  def show
    render json: {data:@continent}
  end
end