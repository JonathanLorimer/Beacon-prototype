class District < ApplicationRecord
  belongs_to :neighbourhood
  has_many :locations

   def as_json(options={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }
   end

end
