class Neighbourhood < ApplicationRecord
  belongs_to :city
  has_many :districts

  def as_json(options={})
    {
      id: id,
      name: name,
      city_id: city_id,
      created_at: created_at,
      updated_at: updated_at,
      districts_ids: districts.to_a.map{ |district| district.id}
    }
  end
end
