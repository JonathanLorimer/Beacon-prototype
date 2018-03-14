class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :user, :uniqueness => {:scope => :location}

end
