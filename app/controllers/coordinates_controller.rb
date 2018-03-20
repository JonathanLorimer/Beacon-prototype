class CoordinatesController < ApplicationController

  def index
  end

  def new
  end

  def show
  end



  def create
  ## You already have that achievement
  ## Didnt find any location/neigh/city/region ??
  ## Else it work and added the achivement

    parsedCoord = JSON.parse(request.raw_post)
    # user_id = parsedCoord['user_id'].to_i

    user_id = 1 # DEMO USER, data comes from the React Native dummy app

    @latitude = parsedCoord['latitude'].to_f
    @longitude = parsedCoord['longitude'].to_f

    if user_id && @latitude && @longitude
      found_result = find_region(@latitude, @longitude)
      if @location
        @user = User.find(user_id)
        new_user_location = @user.user_locations.create({
          location: @location
        })
        new_user_location.save!

        found_result = "Achievement Added #{@location.name}"
        return render json: {data: found_result}
      else
        render json: {data: found_result}
      end
    end
    rescue StandardError => e
      puts "this is the error: #{e}"
      found_result = "You already visited that Location !!"
      render json: {data: found_result}
  end

  private

    def find_region(latitude, longitude)
      @region = false
      @city = false
      @neighbourhood = false
      @location = false

      regions = Region.all
      regions.to_a.map do |region|
        if latitude >= region.least_lat && latitude <= region.greatest_lat && longitude >= region.least_lng && longitude <= region.greatest_lng
          @region = region
          break
        end
      end
      if @region
        find_city(@latitude, @longitude)
      else
        "Region not found in Canada."
      end
    end

    def find_city(latitude, longitude)
      cities = @region.cities.all

      cities.to_a.map do |city|
        if latitude >= city.least_lat && latitude <= city.greatest_lat && longitude >= city.least_lng && longitude <= city.greatest_lng
          @city = city
          break
        end
      end
      if @city
        find_neigh(@latitude, @longitude)
      else
        "City not found in #{@region.name}, Canada."
      end
    end

    def find_neigh(latitude, longitude)
      neighbourhoods = @city.neighbourhoods.all

      neighbourhoods.to_a.map do |neighbourhood|
        locations = neighbourhood.locations.all
        locations.to_a.map do |location|
            if (latitude - location.latitude).abs <= 0.001 && (longitude - location.longitude).abs <= 0.001
              @location = location
              return location
            end
        end
      end
    end

    def find_location(latitude, longitude)

    end
end





