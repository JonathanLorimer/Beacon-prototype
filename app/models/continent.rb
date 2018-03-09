class Continent < ApplicationRecord
  has_many :countries

  def as_json(options={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
