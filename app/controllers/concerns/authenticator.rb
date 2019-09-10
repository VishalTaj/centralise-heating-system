module Authenticator
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_api

    def authenticate_api
      @thermostat = Thermostat.where(household_token: http_auth_header).first
      unless @thermostat
        render json: { error: 'Unauthorized access' }, status: 401
      end
    end
  end

  def http_auth_header
    if request.headers['Authorization'].present?
      return request.headers['Authorization'].split(' ').last
    end
  end
end
