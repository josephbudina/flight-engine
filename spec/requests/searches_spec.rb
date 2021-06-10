require 'rails_helper'

RSpec.describe 'Api::V1::Searches API', type: :request do

  describe 'GET /searches' do
    valid_params = {
                  origin:"LAX",
                  destination: "NYC",
                  passengers:  1, 
                  departure_date: "2021-06-17"
    }

    it 'returns searches', :vcr do
      get api_v1_searches_path, params: valid_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json).not_to be_empty
      expect(json[:data].size).to eq(135)
      expect(json[:data][0][:id]).to eq("1")
      expect(json[:data][0][:type]).to eq("flights")
      expect(json[:data][0][:attributes].size).to eq(6)
    end

    it 'returns searches sad path', :vcr do
      get api_v1_searches_path
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(json).to eq({:error=>"Invalid Parameters"})
    end
  end
end