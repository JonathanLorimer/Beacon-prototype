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
churchs = CategoryAchievement.create! name: 'All Churchs'
parks = CategoryAchievement.create! name: 'All Parks'


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
chinatown = centertown.districts.find_or_create_by! name: 'Chinatown'
university_of_toronto = centertown.districts.find_or_create_by! name: 'University Of Toronto'
midtown_south = midtown.districts.find_or_create_by! name: 'Midtown South'
midtown_north = midtown.districts.find_or_create_by! name: 'Midtown North'

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
  category: 'Museums',
  category_achievement: museums,
  name: 'Hockey Hall of Fame'
})

downtown_east.locations.find_or_create_by!({
  latitude: '43.648591',
  longitude: '-79.371543',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'St. Lawrence Market'
})

downtown_east.locations.find_or_create_by!({
  latitude: '43.651034',
  longitude: '-79.374450',
  category: 'Churchs',
  category_achievement: churchs,
  name: 'The Cathedral Church of St. James'
})

downtown_east.locations.find_or_create_by!({
  latitude: '43.650438',
  longitude: '-79.359806',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'The Distillery Historic District'
})

downtown_east.locations.find_or_create_by!({
  latitude: '43.642908',
  longitude: '-79.367423',
  category: 'Parks',
  category_achievement: parks,
  name: 'Sugar Beach'
})

downtown_west.locations.find_or_create_by!({
  latitude: '43.637442',
  longitude: '-79.406219',
  category: 'Museums',
  category_achievement: museums,
  name: 'Fort York National Historic Site'
})

downtown_west.locations.find_or_create_by!({
  latitude: '43.635283',
  longitude: '-79.406068',
  category: 'Parks',
  category_achievement: parks,
  name: 'Coronation Park'
})

downtown_west.locations.find_or_create_by!({
  latitude: '43.645485',
  longitude: '-79.413900',
  category: 'Parks',
  category_achievement: parks,
  name: 'Trinity Bellwoods Park'
})

downtown_west.locations.find_or_create_by!({
  latitude: '43.645929',
  longitude: '-79.410043',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'Queen St West'
})

chinatown.locations.find_or_create_by!({
  latitude: '43.654801',
  longitude: '-79.400189',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'Kensington Market'
})

chinatown.locations.find_or_create_by!({
  latitude: '43.653621',
  longitude: '-79.392529',
  category: 'Museums',
  category_achievement: museums,
  name: 'Art Gallery of Ontario'
})

chinatown.locations.find_or_create_by!({
  latitude: '43.651044',
  longitude: '-79.398043',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'Chinatown Centre'
})

university_of_toronto.locations.find_or_create_by!({
  latitude: '43.664379',
  longitude: '-79.392335',
  category: 'Parks',
  category_achievement: parks,
  name: 'Queen\'s Park'
})

university_of_toronto.locations.find_or_create_by!({
  latitude: '43.662905',
  longitude: '-79.395661',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'University of Toronto'
})

university_of_toronto.locations.find_or_create_by!({
  latitude: '43.662440',
  longitude: '-79.391697',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'Legislative Offices of the Government'
})

midtown_south.locations.find_or_create_by!({
  latitude: '43.673661',
  longitude: '-79.387851',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'Toronto Public Library'
})

midtown_south.locations.find_or_create_by!({
  latitude: '43.667716',
  longitude: '-79.394782',
  category: 'Museums',
  category_achievement: museums,
  name: 'Royal Ontario Museum'
})

midtown_south.locations.find_or_create_by!({
  latitude: '43.666062',
  longitude: '-79.405693',
  category: 'Churchs',
  category_achievement: churchs,
  name: 'Trinity-St. Paul\'s United Church'
})

midtown_north.locations.find_or_create_by!({
  latitude: '43.676873',
  longitude: '-79.397185',
  category: 'Landmarks',
  category_achievement: landmarks,
  name: 'Hare Krishna Temple'
})

midtown_north.locations.find_or_create_by!({
  latitude: '43.678037',
  longitude: '-79.409459',
  category: 'Museums',
  category_achievement: museums,
  name: 'Casa Loma'
})

midtown_north.locations.find_or_create_by!({
  latitude: '43.686463',
  longitude: '-79.388709',
  category: 'Parks',
  category_achievement: parks,
  name: 'David A. Balfour Park'
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