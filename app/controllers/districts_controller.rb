class DistrictsController < ApplicationController
  def index
    if params[:neighbourhood_id]
      @districts = District.where(neighbourhood_id: params[:neighbourhood_id])
      render json: {data: @districts}
    else
      @districts = District.all
      render json: {data:  @districts}
    end
  end

  def show
    @district = District.find(params[:id])
    render json: {data:@district}
  end

end
