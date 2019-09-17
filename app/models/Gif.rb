require 'pry'

class Gif
  attr_reader :id, :time, :summary, :url
  @@id = 0
  def initialize(forecast_data, gif_data)
    @@id += 1
    @id = 0
    @time = forecast_data["time"]
    @summary = forecast_data["summary"]
    @url = gif_data["data"].first["images"]["original"]["url"]
  end

end
