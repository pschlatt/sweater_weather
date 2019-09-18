class DarkskyApi

  def initialize(lat, long, time = "")
    @lat = lat
    @long = long
    @time = time
  end

  def make_call
    response = conn.get("/forecast/#{ENV['DARKSKY_KEY']}/#{@lat},#{@long}")
    JSON.parse(response.body)
  end

  def make_time_call
    response = conn.get("/forecast/#{ENV['DARKSKY_KEY']}/#{@lat},#{@long},#{@time}?exclude=hourly,daily,flags")
    JSON.parse(response.body)
  end

  private

  def conn
    conn = Faraday.new(url: 'https://api.darksky.net') do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
