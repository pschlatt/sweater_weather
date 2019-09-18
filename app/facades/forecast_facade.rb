class ForecastFacade
  def initialize(location)
    @location = location
  end

  def geo_coordinates
    coords = grab_geocode["results"].first["geometry"]["location"]
    Coordinate.new(coords["lat"], coords['lng'])
  end

  def forecast
    Forecast.new(grab_forecast)
  end

  def background
    back = grab_background["results"].first["urls"]["full"]
    Background.new(back)
  end

  def images
    @all = []
      forecast.daily["data"].zip(grab_gifs).each do |d, e|
        @all << Gif.new(d, e)
      end
    @all
  end

private

  def grab_geocode
    GeocodingApi.new(@location).make_call
  end

  def grab_forecast
    DarkskyApi.new(geo_coordinates.latitude, geo_coordinates.longitude).make_call
  end

  def grab_gifs
    @gifs = []
    forecast.daily["data"].select do |f|
      @gifs << GiphyApi.new(f["summary"]).modified_query
    end
    @gifs
  end

  def grab_background
    UnsplashApi.new(@location).make_call
    #unsplashapi
  end
end
