class RoadTripFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_duration
    results = grab_road_trip["routes"].first["legs"].first["duration"]["text"]
    if results.scan(/\d+/).length >= 2
      hour = results.scan(/\d+/)[0].to_f
      minute = results.scan(/\d+/)[1].to_f * 0.01
      duration = ((hour + minute) * 3600)
    else
      minute = results.scan(/\d+/)[0]
      duration = (minute * 3600)
    end
    duration.to_i + Time.new.strftime("%s").to_i
  end

  def road_trip_forecast
    rtsummary = grab_forecast["currently"]["summary"]
    rttemperature = grab_forecast["currently"]["temperature"]
    {summary: rtsummary, temperature: rttemperature}
  end

  def build_road_trip
    RoadTrip.new(road_trip_forecast, grab_road_trip["routes"].first["legs"].first["duration"]["text"])
  end




private

  def grab_road_trip
    DirectionsApi.new(@origin, @destination).make_call
  end

  def grab_forecast
    DarkskyApi.new(lat_destination, lng_destination, road_trip_duration).make_time_call
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
