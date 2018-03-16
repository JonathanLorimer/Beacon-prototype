class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :user, :uniqueness => {:scope => :location}

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
