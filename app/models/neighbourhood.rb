class Neighbourhood < ApplicationRecord
  belongs_to :city
  has_many :locations

  def as_json(options={})
    {
      id: id,
      name: name,
      city_id: city_id,
      created_at: created_at,
      updated_at: updated_at,
      locations_ids: locations.to_a.map{ |location| location.neighbourhood_id},
      least_lat: least_lat,
      greatest_lat: greatest_lat,
      least_lng: least_lng,
      greatest_lng: greatest_lng
    }
  end
end
