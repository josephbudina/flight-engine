class Api::V1::SearchesController < ApplicationController

  def index
    # binding.pry
    if params[:origin] && params[:destination] && params[:passengers] && params[:departure]
      flights = FlightsFacade.flight_object(params[:origin], params[:destination], params[:passengers], params[:departure], params[:return_date], params[:max_price], params[:limit])
      render json: FlightsSerializer.new(flights)
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end
end