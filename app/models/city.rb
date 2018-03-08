class City < ApplicationRecord
  belongs_to :region
  has_many :neighbourhoods
end
