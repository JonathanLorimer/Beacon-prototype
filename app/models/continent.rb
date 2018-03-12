class Continent < ApplicationRecord
  has_many :countries

  def as_json(options={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at,
      countries_ids: countries.to_a.map{ |country| country.continent_id}
    }
  end
end


# countries: countries.to_a.map{ |country| country.continent_id}