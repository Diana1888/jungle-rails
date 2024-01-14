class User < ApplicationRecord

  has_secure_password
  validates :first_name, :last_name, :password_confirmation, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end

end
