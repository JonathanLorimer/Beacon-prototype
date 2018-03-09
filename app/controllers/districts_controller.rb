class DistrictsController < ApplicationController
  def index
    @districts = District.all
    render json: {data: @districts}
  end

  def show
    render json: {data:@district}
  end

end
