class CoordinatesController < ApplicationController
  
  def index
  end
  
  def new
  end

  def show
  end

  def create
    parsedCoord = JSON.parse(request.raw_post)
   
    @latitude = parsedCoord['latitude'].to_f
    @longitude = parsedCoord['longitude'].to_f

    find_region(@latitude, @longitude)
    
    
    
    render json: {data:'null'}
  end

  private
    def find_region(latitude, longitude)
      regions = Region.all
      @region = "Not Found" 

      regions.to_a.map do |region|
        if latitude >= region.least_lat && latitude <= region.greatest_lat && longitude >= region.least_lng && longitude <= region.greatest_lng
          @region = region
          break
        end
      end
      find_city(@latitude, @longitude)
    end

    def find_city(latitude, longitude)
      cities = @region.cities.all
      @city = "Not Found" 

      cities.to_a.map do |city|
        if latitude >= city.least_lat && latitude <= city.greatest_lat && longitude >= city.least_lng && longitude <= city.greatest_lng
          @city = city
          break
        end
      end
      find_neigh(@latitude, @longitude)
    end

    def find_neigh(latitude, longitude)
      neighbourhoods = @city.neighbourhoods.all
      @neighbourhood = "Not Found" 

      neighbourhoods.to_a.map do |neighbourhood|
        if latitude >= neighbourhood.least_lat && latitude <= neighbourhood.greatest_lat && longitude >= neighbourhood.least_lng && longitude <= neighbourhood.greatest_lng
          @neighbourhood = neighbourhood
          break
        end
      end
      find_location(@latitude, @longitude)
    end

    def find_location(latitude, longitude)
      locations = @neighbourhood.locations.all
      @location = "Not Found" 

      locations.to_a.map do |location|
        if latitude.round(2) == location.latitude.round(2) && longitude.round(2) == location.longitude.round(2)
          @location = location
          break
        end
      end
      puts @location.name
    end
end



    # t.float "greatest_lat"
    # t.float "least_lat"
    # t.float "greatest_lng"
    # t.float "least_lng"