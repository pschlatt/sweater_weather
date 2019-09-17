class User < ApplicationRecord
  has_secure_password
  before_create :generate_key

  def generate_key
    self.api_key = SecureRandom.hex
  end

end
