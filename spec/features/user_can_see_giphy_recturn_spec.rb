require "rails_helper"


  describe "When I visit the giphy page" do
    describe "and enter a location" do

      it "I can see all the fields I expect with the correct data" do
        visit "/api/v1/gifs?location=Denver,CO"
        expect(page).to have_content("data")
        expect(page).to have_content("type")
        expect(page).to_not have_content("Null")
      end
    end
  end
