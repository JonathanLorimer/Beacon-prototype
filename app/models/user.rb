class User < ApplicationRecord
  has_secure_password

  has_many :user_locations
  has_many :locations, through: :user_location

    def as_json(options={})
    {
      id: id,
      username: username,
      email: email,
      password: password,
      created_at: created_at,
      updated_at: updated_at
    }
  end

end
