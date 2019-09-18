

class UnsplashApi

  def initialize(location)
    @location = location
  end

  def make_call
    response = conn.get("/search/photos?query=#{@location}")
    JSON.parse(response.body)
  end

  private

  def conn
    conn = Faraday.new(url: "https://api.unsplash.com") do |f|
            f.adapter Faraday.default_adapter
            f.params["client_id"] = ENV['UNSPLASH_KEY']
          end
  end
end
