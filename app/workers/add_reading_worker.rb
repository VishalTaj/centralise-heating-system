class AddReadingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(token, reading_params)
    thermostat = Thermostat.find_by_household_token(token)
    params = JSON.parse(reading_params)
    reading = thermostat.readings.find_or_initialize_by(tracking_number: params["tracking_number"])
    reading.update_attributes(params)
  end
end