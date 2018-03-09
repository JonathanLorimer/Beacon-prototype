class Region < ApplicationRecord
  belongs_to :country
  has_many :cities

    def as_json(options={})
    {
      id: id,
      name: name,
      country_id: country_id,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
