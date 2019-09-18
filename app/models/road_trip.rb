class RoadTrip
  attr_reader :id, :temperature, :summary, :duration
  @@id = 0
  def initialize(forecast_data, duration)
    @@id += 1
    @id = 0
    @temperature = forecast_data[:temperature]
    @summary = forecast_data[:summary]
    @duration = duration
  end
end
