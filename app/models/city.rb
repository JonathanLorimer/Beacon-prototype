class City < ApplicationRecord
  belongs_to :region
  has_many :neighbourhoods

  def as_json(options={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
