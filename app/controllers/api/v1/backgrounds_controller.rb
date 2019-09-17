class Api::V1::BackgroundsController < ApplicationController

  def index
    image = ForecastFacade.new(location_params).background
    render json: BackgroundSerializer.new(image)
  end

  private

  def location_params
    params.permit(:location)
  end

end
