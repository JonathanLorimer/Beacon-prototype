# class UpdatesController < ApplicationController

#   def index
#     @user = User.find(params[:user_id])
#     location_to_return = false
#     # last_location = @user.locations.order("created_at desc").limit(1)
#     last_location = (@user.locations.select('locations.*, user_locations')).order('user_locations.created_at ASC').limit(1)


#      last_location.each do |location|
#         puts location.name
#       location_to_return = location
#      end

#     # @user.locations.select('locations.*, user_locations.created_at').each do |location|
#     #   locations_visited_at << {name: location.name, visited_at: location.created_at}
#     # end
#     if location_to_return
#         render json: { data: location_to_return }
#     end
#   end


# end

class UpdatesController < ApplicationController

 def index
   @user = User.find(params[:user_id])
   location_to_return = false
   last_location = (@user.locations.select('locations.*, user_locations')).order('user_locations.created_at ASC').last(1)

    last_location.each do |location|
     location_to_return = location
    end

   @user.locations.select('locations.*, user_locations.created_at').each do |location|
     if location.name == location_to_return.name
       puts location_to_return.created_at
       puts location.created_at
       location_to_return[:created_at] = location.created_at
     end
   end

   if location_to_return
       render json: { data: location_to_return }
   end
 end


end