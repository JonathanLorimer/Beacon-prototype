class Region < ApplicationRecord
  belongs_to :country
  has_many :cities

    def as_json(options={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
