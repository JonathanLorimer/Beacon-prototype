class City < ApplicationRecord
  belongs_to :region
  has_many :neighbourhoods

  def as_json(options={})
    {
      id: id,
      name: name,
      region_id: region_id,
      created_at: created_at,
      updated_at: updated_at,
      neighbourhoods_ids: neighbourhoods.to_a.map{ |neighbourhood| neighbourhood.city_id}
    }
  end
end
