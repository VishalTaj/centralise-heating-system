module V1
  class ReadingsController < ApplicationController
    include ReadingConcern
    skip_before_action :authenticate_api, only: [:index]

    private

    def reading_params
      params.require(:reading).permit(:tracking_number, :humidity, :temperature, :battery_charge)
    end
  end
end