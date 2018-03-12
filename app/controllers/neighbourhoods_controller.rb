class NeighbourhoodsController < ApplicationController
  def index
    if params[:city_id]
      @neighbourhoods = Neighbourhood.where(city_id: params[:city_id])
      render json: {data: @neighbourhoods}
    else
      @neighbourhoods = Neighbourhood.all
      render json: {data:  @neighbourhoods}
    end
  end

  def show
    @neighbourhood = Neighbourhood.find(params[:id])
    render json: {data:@neighbourhood}
  end
end
