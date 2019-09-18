class Api::V1::RoadTripController < ApplicationController

  def create
    origin = road_trip_params[:origin]
    dest = road_trip_params[:destination]
    key = road_trip_params[:api_key]
    if key == current_user.api_key
      render local: {facade: RoadTripFacade.new(origin, destination).road_trip_info}
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

end
