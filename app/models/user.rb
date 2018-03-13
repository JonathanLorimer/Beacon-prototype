class User < ApplicationRecord
  has_secure_password

  has_many :user_locations
  has_many :locations, through: :user_location

  validates :username, presence:true
  validates :email, presence:true,
                    uniqueness: { case_sensitive: false }
  validates :password, presence:true


    def as_json(options={})
    {
      id: id,
      username: username,
      email: email,
      password: password_digest,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  #   def self.authenticate_with_credentials(email, password)
  #    email_valid = email.downcase.strip
  #    user = User.find_by(email:email_valid)
  #      if user && user.authenticate(password)
  #       user
  #     end
  # end

end
