class Flight
  attr_reader :id,
              :bookable_seats,
              :last_ticketing_date,
              :departure,
              :arrival,
              :number_of_stops,
              :price

  def initialize(data)
    @id = data[:id]
    @bookable_seats = data[:bookable_seats]
    @last_ticketing_date = data[:last_ticketing_date]
    @departure = data[:departure]
    @arrival = data[:arrival]
    @number_of_stops = data[:number_of_stops] 
    @price = data[:price]
  end
end