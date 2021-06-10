class FlightsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :departure, :arrival, :number_of_stops, :bookable_seats, :last_ticketing_date, :price
end
