# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## USERS

puts "Finding or Creating User and Special Achievement ..."

testuser1 = User.create! email: 'jon@email.com', username: 'jon', password: 'password'
testuser2 = User.create! email: 'romain@email.com', username: 'romain', password: 'password'
testuser3 = User.create! email: 'xiao@email.com', username: 'xiao', password: 'password'

landmarks = CategoryAchievement.create! name: 'All Landmarks'
museums = CategoryAchievement.create! name: 'All Museums'
entertainments = CategoryAchievement.create! name: 'All Entertainments'


## ACHIEVEMENTS

puts "creating Achievements ..."
north_amercia = Continent.find_or_create_by! name:'North America'
canada = north_amercia.countries.find_or_create_by! name: 'Canada'
ontario = canada.regions.find_or_create_by! name: 'Ontario'
toronto = ontario.cities.find_or_create_by! name: 'Toronto'

downtown = toronto.neighbourhoods.find_or_create_by! name: 'Downtown'
centertown = toronto.neighbourhoods.find_or_create_by! name: 'Centertown'
midtown = toronto.neighbourhoods.find_or_create_by! name: 'Midtown'

downtown_south = downtown.districts.find_or_create_by! name: 'Downtown South'
downtown_east = downtown.districts.find_or_create_by! name: 'Downtown East'
downtown_west = downtown.districts.find_or_create_by! name: 'Downtown West'

# ## LOCATIONS

puts "Re-creating Locations ..."

downtown_south.locations.find_or_create_by!({
  latitude: '43.642593',
  longitude: '-79.387090',
  category: 'Landmark',
  category_achievement: landmarks,
  name: 'CN Tower'
})

downtown_south.locations.find_or_create_by!({
  latitude: '43.642411',
  longitude: '-79.385984',
  category: 'Entertainment',
  category_achievement: entertainments,
  name: 'Ripley\'s Aquarium of Canada'
})

downtown_south.locations.find_or_create_by!({
  latitude: '43.641448',
  longitude: '-79.389374',
  category: 'Entertainment',
  category_achievement: entertainments,
  name: 'Rogers Centre'
})

downtown_south.locations.find_or_create_by!({
  latitude: '43.647287',
  longitude: '-79.377701',
  category: 'Restaurant',
  category_achievement: museums,
  name: 'Hockey Hall of Fame'
})

# location5 = lvl1Ach3.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Restaurant',
#   special_achievement: restaurants,
#   name: 'Big Crow'
# })

# location6 = lvl1Ach3.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Restaurant',
#   special_achievement: restaurants,
#   name: 'Fat Pasha'
# })
# location7 = lvl1Ach4.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Restaurant',
#   special_achievement: restaurants,
#   name: 'Great Canadian Burger'
# })

# location8 = lvl1Ach4.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Landmark',
#   special_achievement: landmarks,
#   name: 'St. Lawrence Market'
# })

# location9 = lvl1Ach5.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Landmark',
#   special_achievement: landmarks,
#   name: 'CN Tower'
# })

# location10 = lvl1Ach5.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Landmark',
#   special_achievement: landmarks,
#   name: 'Ripleys Aquarium'
# })

# location11 = lvl1Ach6.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Landmark',
#   special_achievement: landmarks,
#   name: 'Casa Loma'
# })

# location12 = lvl1Ach6.locations.find_or_create_by!({
#   latitude: '25',
#   longitude: '25',
#   category: 'Landmark',
#   special_achievement: landmarks,
#   name: 'Art Gallery Ontario'
# })

puts "DONE!"