
class DirectionsApi

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def make_call
    response = conn.get("/maps/api/directions/json?origin=#{@origin}&destination=#{@destination}")
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
