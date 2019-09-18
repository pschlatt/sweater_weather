require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
  end

  describe '#methods' do
    it "user gets a random key" do
      user = User.create(email: "whatever@yourmom.com")
      expect(user.generate_key.class).to eq(String)
    end
  end
end
