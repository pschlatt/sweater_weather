class Forecast

  attr_reader :id, :currently, :hourly, :daily
  @@id = 0
  def initialize(forecast)
    @@id += 1
    @id = 0
    @currently = forecast["currently"]
    @hourly = forecast["hourly"]
    @daily = forecast["daily"]
  end

end
