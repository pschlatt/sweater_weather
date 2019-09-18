class Api::V1::RoadTripController < ApplicationController
  include ActionController::Helpers

  def create
    origin = road_trip_params[:origin]
    dest = road_trip_params[:destination]
    key = road_trip_params[:api_key]
    if User.where("users.api_key = ?", key).any?
    user = User.where("users.api_key = ?", key)
    session[:user_id] = user.first.id
      if current_user.api_key == key
        roadtrip = RoadTripFacade.new(origin, dest).build_road_trip
        render json: RoadtripSerializer.new(roadtrip)
      end
    else
      render json: {error: '(Unauthorized.)'}, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

end
