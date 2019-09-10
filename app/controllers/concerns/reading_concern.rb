module ReadingConcern
  extend ActiveSupport::Concern

  def create
    reading = Rails.cache.fetch("#{@thermostat.household_token}/#{reading_params[:tracking_number]}", expires_in: 30.minutes) do
      reading_params
    end
    AddReadingWorker.perform_async(@thermostat.household_token, reading_params.to_json)
    render json: reading, status: 200
  end

  def show
    reading = Rails.cache.fetch("#{@thermostat.household_token}/#{params[:tracking_number]}") do
      @thermostat.readings.find_by_tracking_number(params[:tracking_number])
    end
    if reading
      render json: reading, status: 200
    else
      render json: {error: 'reading not found'}, status: 404
    end
  end

  def stats
    stats = @thermostat.readings.select("max(humidity) as max_humidity, max(temperature) as max_temperature, max(battery_charge) as max_battery_charge, min(humidity) as min_humidity, min(temperature) as min_temperature, min(battery_charge) as min_battery_charge, avg(humidity) as avg_humidity, avg(temperature) as avg_temperature, avg(battery_charge) as avg_battery_charge").first
    if stats
      render json: stats.as_json.except('id'), status: 200
    else
      render json: {error: "Something went wrong"}, status: 400
    end
  end
end