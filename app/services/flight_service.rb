require 'amadeus'
class FlightService

  def self.get_flight_token(origin, destination, passengers, departure_date, return_date = nil, max_price = nil, limit = nil)
    amadeus = Amadeus::Client.new({
      client_id: ENV['API_KEY'],
      client_secret: ENV['API_SECRET']
    })

    response = amadeus.shopping.flight_offers_search.get(originLocationCode: origin, destinationLocationCode: destination, departureDate: departure_date, adults: passengers, returnDate: return_date, maxPrice: max_price, max: limit)
    JSON.parse(response.body, symbolize_names: true)
  end
end