class RegionsController < ApplicationController
  def index
    @regions = Region.all
    render json: {data: @regions}
  end

  def show
    @region = Region.find(params[:id])
    render json: {data:@region}
  end
end
