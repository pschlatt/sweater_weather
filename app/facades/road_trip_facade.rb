class RoadTripFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_info
    grab_road_trip
  end


private

  def grab_road_trip
    DirectionsApi.new(@origin, @destination).make_call
  end

end
