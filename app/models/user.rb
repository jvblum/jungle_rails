class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitive => false}
  validates :password, presence: true, length: {minimum: 10}

  def self.authenticate_with_credentials email, password
    user = User.find_by_email(email.strip)
    if (user && user == user.authenticate(password))
      return user
    end
  end

end
