class District < ApplicationRecord
  belongs_to :neighbourhood
  has_many :locations

   def as_json(options={})
    {
      id: id,
      name: name,
      neighbourhood_id: neighbourhood_id,
      created_at: created_at,
      updated_at: updated_at,
      locations_ids: locations.to_a.map{ |location| location.district_id}
    }
   end

end
