class Api::V1::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.new(location_params).forecast
    render json: ForecastSerializer.new(forecast)
  end

  private

  def location_params
    params.permit(:location)
  end

end
