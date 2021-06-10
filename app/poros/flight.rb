class Flight
  attr_reader :id,
              :departure_time,
              :arrival_time,
              :bookable_seats,
              :last_ticketing_date,
              :departure,
              :arrival,
              :number_of_stops,
              :price

  def initialize(data)
    @id = data[:id]
    @arrival_time = data[:arrival_time]
    @departure_time = data[:departure_time]
    @bookable_seats = data[:bookable_seats]
    @last_ticketing_date = data[:last_ticketing_date]
    @departure = data[:departure]
    @arrival = data[:arrival]
    @number_of_stops = data[:number_of_stops] 
    @price = data[:price]
  end
end