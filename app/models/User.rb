class User < ApplicationRecord
  has_secure_password
  before_create :generate_key
  validates_presence_of :email
  validates_presence_of :password

  def generate_key
    self.api_key = SecureRandom.hex
  end
end
