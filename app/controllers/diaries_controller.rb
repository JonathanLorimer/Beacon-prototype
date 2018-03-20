class DiariesController < ApplicationController

 def index
   @user = User.find(params[:user_id])
   @locations = @user.locations.find_all()
   locations_visited_at = []

   @user.locations.select('locations.*, user_locations.created_at').each do |location|
     locations_visited_at << {name: location.name, visited_at: location.created_at}
   end

   render json: { data: [@locations, locations_visited_at] }
 end
end