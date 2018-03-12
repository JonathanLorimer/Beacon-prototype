class Country < ApplicationRecord
  belongs_to :continent
  has_many :regions

  def as_json(options={})
    {
      id: id,
      name: name,
      continent_id: continent_id,
      created_at: created_at,
      updated_at: updated_at,
      regions_ids: regions.to_a.map{ |region| region.country_id}
    }
  end

end
