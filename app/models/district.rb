class District < ApplicationRecord
  belongs_to :neighbourhood
  has_many :locations
end
