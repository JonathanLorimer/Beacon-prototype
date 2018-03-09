class NeighbourhoodsController < ApplicationController
    def index
    @neighbourhoods = Neighbourhood.all
    render json: {data: @neighbourhoods}
  end

  def show
    render json: {data:@neighbourhoods}
  end
end
