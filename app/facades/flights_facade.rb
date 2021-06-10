class FlightsFacade

  def self.flight_object(origin, destination, passengers, departure_date, return_date = nil, max_price = nil, limit = nil, sort = nil)
    flight_data = FlightService.get_flight_token(
      origin, 
      destination, 
      passengers, 
      departure_date, 
      return_date, 
      max_price, 
      limit
    )

    flights = flight_data[:data].map do |data|
      flight_attributes = {
        id: data[:id],
        bookable_seats: data[:numberOfBookableSeats],
        last_ticketing_date: data[:lastTicketingDate],
        departure: data[:itineraries][0][:segments][0][:departure][:iataCode],
        departure_time: data[:itineraries][0][:segments][0][:departure][:at],
        arrival:  data[:itineraries][0][:segments][-1][:arrival][:iataCode],
        arrival_time: data[:itineraries][0][:segments][-1][:arrival][:at],
        number_of_stops: data[:itineraries][0][:segments].length - 1,
        price: "$#{data[:price][:grandTotal]}"
      }
      Flight.new(flight_attributes)
    end
    if sort == "layovers"
      flights.sort_by do |flight|
        flight.number_of_stops
      end
    elsif sort == "price"
      flights.sort_by do |flight|
        flight.price
      end
    else
      flights
    end
  end
end