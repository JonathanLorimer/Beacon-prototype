class UpdatesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # last_location = @user.locations.order("created_at desc").limit(1)
    last_location= @user.locations.order(:created_at => :desc).limit(1)
    puts last_location

    # @user.locations.select('locations.*, user_locations.created_at').each do |location|
    #   locations_visited_at << {name: location.name, visited_at: location.created_at}
    # end

    render json: { data: last_location }
  end


end