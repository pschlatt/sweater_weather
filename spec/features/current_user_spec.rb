require "rails_helper"


  RSpec.describe "I can be a current user" do
    it "after creating an account" do
      @user = User.create()
    end
  end
