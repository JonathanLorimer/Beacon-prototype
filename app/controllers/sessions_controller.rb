class SessionsController < ApplicationController

  def new
    Session.create(user_params)
  end

  def create

    @user = User.find_by_email(params[:email])
    puts @user
    if @user && @user.authenticate(params[:password])
      @achievements = {
        locations: {},
        neighbourhoods: {},
        cities: {},
        regions: {},
        countries: {}
      }
      # session[:user_id] = user.id
      find_achievements(@user)

      locations_visited_at = []

      @user.locations.select('locations.*, user_locations.created_at').each do |location|
        locations_visited_at << {name: location.name, visited_at: location.created_at}
      end

      render json: {data: [@user, @achievements, locations_visited_at]}

    else
    # If user's login doesn't work, send them back to the login form.
      render json: {data: 'failed'}

    end
  end

  def destroy
    session[:user_id] = nil

  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def find_achievements(user)
      puts "finding achievements for #{user}"
      achievements_locations = find_achievements_locations(user)
      if achievements_locations
        achievements_neigh = find_achievements_neigh(achievements_locations)
        puts 'FINISHED SEARCHING FOR ACHIEVEMENTS'
      end
    end

    def find_achievements_locations(user)
      # First, find all of the user locations
      locations = user.locations.find_all()
      if locations
        puts "found locations: #{locations}"
        locations
      else
        false
      end
    end

    def find_achievements_neigh(locations)

      locations_by_neigh = {}
      neigh_to_return = []

      # We organize our locations by neigh id keys
      locations.each do |location|
        @achievements[:locations][location.id] = location #achievements is returned to the React client
        if !locations_by_neigh[location.neighbourhood_id]
          locations_by_neigh[location.neighbourhood_id] = []
        end
        locations_by_neigh[location.neighbourhood_id] << location
      end

      # Now we have our locations arrays ordered by neighbourhood ids as keys
      # We are gonna compare our locations arrays to the size of our neigh/locations join
      locations_by_neigh.each do |neigh_id, location|

        neigh_to_count = Neighbourhood.find(neigh_id)
        # How much locations does that neigh have ?
        neigh_size = neigh_to_count.locations.count()
        if neigh_size == locations_by_neigh[neigh_id].length
          # You get the Neigh achievements !!!!
          puts neigh_to_count.name
          neigh_to_return << neigh_to_count
          puts "#{@user.username} gets the #{neigh_to_count.name} achievements !!!!"

          # Now we want to see you get the City achievements
        end
      end
      find_achievements_cities(neigh_to_return)
    end

    def find_achievements_cities(neighbourhoods)
      neigh_by_city = {}
      cities_to_return = []

      # We organize our neighbourhoods by neigh id keys
      neighbourhoods.each do |neighbourhood|
        @achievements[:neighbourhoods][neighbourhood.id] = neighbourhood
        if !neigh_by_city[neighbourhood.city_id]
          neigh_by_city[neighbourhood.city_id] = []
        end
        neigh_by_city[neighbourhood.city_id] << neighbourhood
      end

      # Now we have our neighbourhoods arrays ordered by neighbourhood ids as keys
      # We are gonna compare our neighbourhoods arrays to the size of our neigh/neighbourhoods join
      neigh_by_city.each do |city_id, neighbourhood|

        city_to_count = City.find(city_id)

        # How much neighbourhoods does that neigh have ?
        city_size = city_to_count.neighbourhoods.count()

        if city_size == neigh_by_city[city_id].length
          # You get the Neigh achievements !!!!
          puts "#{@user.username} gets the #{city_to_count.name} achievements !!!!"
          cities_to_return << city_to_count
          # Now we want to see you get the City achievements
        end
      end
      find_achievements_regions(cities_to_return)

    end

    def find_achievements_regions(cities)
      cities_by_region = {}
      regions_to_return = []

      # We organize our cities by neigh id keys
      cities.each do |city|
        @achievements[:cities][city.id] = city #achievements is returned to the React client
        if !cities_by_region[city.region_id]
          cities_by_region[city.region_id] = []
        end
        cities_by_region[city.region_id] << city
      end

      # Now we have our cities arrays ordered by city ids as keys
      # We are gonna compare our cities arrays to the size of our neigh/cities join
      cities_by_region.each do |region_id, city|
        region_to_count = Region.find(region_id)

        # How much cities does that neigh have ?
        region_size = region_to_count.cities.count()
        if region_size == cities_by_region[region_id].length
          # You get the Neigh achievements !!!!
          puts "#{@user.username} gets the #{region_to_count.name} achievements !!!!"
          @achievements[:regions][region_id] = region_to_count
        end
      end

    end

end
