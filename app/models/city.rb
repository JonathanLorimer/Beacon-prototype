class City < ApplicationRecord
  belongs_to :region
  has_many :neighbourhoods

  def as_json(options={})
    {
      id: id,
      name: name,
      region_id: region_id,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
