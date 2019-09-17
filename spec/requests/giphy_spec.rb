require "rails_helper"


  describe "Giphy Request Spec" do
    describe "and enter a location" do

      it "can call my own endpoint" do
        get "http://localhost:3000/api/v1/gifs?location=Denver,CO"
        expect(response).to have_http_status(:success)
        expect(response.body).to include "images"
        expect(response.body).to include "time"
        expect(response.body).to include "summary"
        expect(response.body).to include "url"
      end
    end
  end
