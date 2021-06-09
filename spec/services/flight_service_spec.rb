require 'rails_helper'

RSpec.describe FlightService, type: :model do

  describe "#get_data", :vcr do
    it "should return json for for flight api" do
      result = FlightService.get_flight_token("NYC", "LAX", 1, "2021-06-17")

      expect(result.class).to eq(Hash)
      expect(result[:data].length).to eq(145)
    end
  end
end