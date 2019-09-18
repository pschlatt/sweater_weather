require 'pry'
class DirectionsApi


  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def make_call
    response = conn.get("origin=#{@origin}&destination
      =#{@destination}&key=#{ENV['GOOGLE_KEY']}")
    JSON.parse(response.body)
    binding.pry
  end

private

  def conn
    conn = Faraday.new(url: 'https://maps.googleapis.com/maps/api/directions/json?') do |f|
      f.params['key'] = ENV['GOOGLE_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end
