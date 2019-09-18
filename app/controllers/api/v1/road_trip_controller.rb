class Api::V1::RoadTripController < ApplicationController
  include ActionController::Helpers


# skip_before_filter :verify_authenticity_token
  def create
    origin = road_trip_params[:origin]
    dest = road_trip_params[:destination]
    key = road_trip_params[:api_key]
    user = User.where("users.api_key = ?", key)
    if user
      roadtrip = RoadTripFacade.new(origin, dest).build_road_trip
      render json: RoadtripSerializer.new(roadtrip)
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

end
