require 'rails_helper'

RSpec.describe 'Readings', type: :request do
  let(:url) { '/v1/readings' }
  let(:params) do
    {
      reading: {
        tracking_number: 1232456,
        humidity: 35.24,
        temperature: 13.34,
        battery_charge: 25
      }
    }
  end

  context 'Api to add readings' do
    before do
      @thermostat = create(:thermostat)
    end

    it 'Add Readings' do
      post url, params: params, headers: {'Authorization' => @thermostat.household_token}
      @reading = JSON.parse(response.body)["tracking_number"].to_i
      expect(JSON.parse(response.body)["tracking_number"].to_i).to eq(params[:reading][:tracking_number])
    end

    it 'Get Reading' do
      reading = create(:reading, thermostat: @thermostat)
      get "/v1/readings/#{reading.tracking_number}", params: {}, headers: {'Authorization' => @thermostat.household_token}
      expect(JSON.parse(response.body)["tracking_number"].to_i).to eq(reading.tracking_number)
    end

    it 'Get Stats' do
      reading = create(:reading, thermostat: @thermostat)
      get "/v1/readings/stats", params: {}, headers: {'Authorization' => @thermostat.household_token}
      expect(response.code).to eq("200")
    end
  end
end