class RegionsController < ApplicationController
  def index
    @regions = Region.all
    render json: {data: @regions}
  end

  def show
    render json: {data:@regions}
  end
end
