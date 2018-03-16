class DiariesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @locations = @user.locations.find_all()
    puts @locations
    render json: {data: @locations}
  end
end