class DistrictsController < ApplicationController
  def index
    @districts = District.all
    render json: {data: @districts}
  end

  def show
    @district = District.find(params[:id])
    render json: {data:@district}
  end

end
