class RoadTripFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_duration
    results = grab_road_trip["routes"].first["legs"].first["duration"]["text"]
    require 'pry' ; binding.pry
  end

  def road_trip_forecast
    grab_forecast
    require 'pry' ; binding.pry
  end


private

  def grab_road_trip
    DirectionsApi.new(@origin, @destination).make_call
  end

  def grab_forecast
    DarkskyApi.new(lat_destination, lng_destination).make_call
  end

  def lat_destination
    results = grab_road_trip["routes"].first["legs"]
    results.first["end_location"]["lat"]
  end

  def lng_destination
    results = grab_road_trip["routes"].first["legs"]
    results.first["end_location"]["lng"]
  end

end
