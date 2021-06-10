class FlightsFacade

  def self.flight_object(origin, destination, passengers, departure_date, return_date = nil, max_price = nil, limit = nil)
   flight_data = FlightService.get_flight_token(origin, 
                                                destination, 
                                                passengers, 
                                                departure_date, 
                                                return_date, 
                                                max_price, 
                                                limit)[:data]

    flight_data.map do |data|
      flight_attributes = {
                id: data[:id],
                bookable_seats: data[:numberOfBookableSeats],
                last_ticketing_date: data[:lastTicketingDate],
                departure: data[:itineraries][0][:segments][0][:departure],
                arrival:  data[:itineraries][0][:segments][-1][:arrival],
                number_of_stops: data[:itineraries][0][:segments][0][:numberOfStops],
                price: "$#{data[:price][:grandTotal]}"
      }
      Flight.new(flight_attributes)
    end
  end
end