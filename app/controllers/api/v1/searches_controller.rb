class Api::V1::SearchesController < ApplicationController

  def index
    if params[:origin] && params[:destination] && params[:passengers] && params[:departure] &&  User.find_by(api_key: params[:api_key])
      user = User.find_by(api_key: params[:api_key])
      user.searches.create!(origin: params[:origin], destination: params[:destination], passengers: params[:passengers], departure: params[:departure], return_date: params[:returndate], max_price: params[:price], limit: params[:limit])
      flights = FlightsFacade.flight_object(params[:origin], params[:destination], params[:passengers], params[:departure], params[:returndate], params[:maxprice], params[:limit])
      render json: FlightsSerializer.new(flights)
    else
      render json: {error: "Invalid Parameters"}, status: 400
    end
  end
end