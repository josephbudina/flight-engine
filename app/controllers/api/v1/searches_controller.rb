class Api::V1::SearchesController < ApplicationController

  def index
    if required_params &&  User.find_by(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])  
      if user.searches.find_by(required_params)
        user.searches.update(searches_params)
        flights = FlightsFacade.flight_object(params[:origin], params[:destination], params[:passengers], params[:departure], params[:returndate], params[:maxprice], params[:limit])
        render json: FlightsSerializer.new(flights)
      else
        user.searches.create!(searches_params)
        flights = FlightsFacade.flight_object(params[:origin], params[:destination], params[:passengers], params[:departure], params[:returndate], params[:maxprice], params[:limit])
        render json: FlightsSerializer.new(flights)
      end
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end

  private

  def required_params
    params.permit(:origin, :destination, :passengers, :departure)
  end

  def searches_params
    params.permit(:origin, :destination, :passengers, :departure, :returndate, :maxprice, :limit)
  end
end