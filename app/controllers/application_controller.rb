class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ::NameError, with: :internal_server_error
  rescue_from ::ActionController::RoutingError, with: :internal_server_error

  include Authenticator

  protected

  [:not_found, :internal_server_error].each do |method|
    define_method method do |exception|
      render json: {error: exception.message}.to_json, status: Rack::Utils::SYMBOL_TO_STATUS_CODE[method] 
      return
    end
  end
end
