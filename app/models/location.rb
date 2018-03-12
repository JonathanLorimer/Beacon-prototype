class Location < ApplicationRecord
  belongs_to :neighbourhood
  belongs_to :category_achievement

  has_many :user_locations
  has_many :users, through: :user_location

  def as_json(options={})
    {
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      category: category,
      neighbourhood_id: neighbourhood_id,
      created_at: created_at,
      updated_at: updated_at
    }
  end


end
