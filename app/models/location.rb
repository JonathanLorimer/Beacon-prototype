class Location < ApplicationRecord
  belongs_to :district
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
      created_at: created_at,
      updated_at: updated_at
    }
  end


end
