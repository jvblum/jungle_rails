class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitive => false}
  validates :password, presence: true, length: {minimum: 10}

  def authenticate_with_credentials email, password
  end

end
