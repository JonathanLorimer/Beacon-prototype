class Country < ApplicationRecord
  belongs_to :continent
  has_many :regions

  def as_json(options={})
    {
      id: id,
      name: name,
      continent_id: continent_id,
      created_at: created_at,
      updated_at: updated_at
    }
  end

end
