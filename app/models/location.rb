class Location < ApplicationRecord
  belongs_to :district
  belongs_to :category_achievement

  has_many :user_locations
  has_many :users, through: :user_location
end
