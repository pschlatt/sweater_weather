class DarkskyApi

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def make_call
    response = conn.get("/forecast/#{ENV['DARKSKY_KEY']}/#{@lat},#{@long}")
    JSON.parse(response.body)
  end

  private

  def conn
    conn = Faraday.new(url: 'https://api.darksky.net') do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
