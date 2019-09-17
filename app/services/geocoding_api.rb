class GeocodingApi

  def initialize(location)
    @location = location
  end

  def make_call
    response = conn.get("/maps/api/geocode/json?address=#{@location}")
    JSON.parse(response.body)
  end

  private

  def conn
    conn = Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.params['key'] = ENV['GOOGLE_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end
