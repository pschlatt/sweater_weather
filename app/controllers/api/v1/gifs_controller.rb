class Api::V1::GifsController < ApplicationController

  def index
    list = ForecastFacade.new(location_params)
    render json: GiphySerializer.new(list.images)
  end

  private

  def location_params
    params.permit(:location)
  end

end
