Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :api_routes do
    resources :readings, only: [:create, :show], param: :tracking_number do
      collection do
        get :stats
      end
    end
  end

  scope module: 'v1', path: 'v1', defaults: { format: 'json', version: 'v1'}, as: 'api_v1' do
    concerns :api_routes
  end
end
