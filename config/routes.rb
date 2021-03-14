Rails.application.routes.draw do
  resources :view_pricing, only: [:index]
  get '/service/AmazonCloudFront/region/:region', to: 'view_pricing#index'

  # For details on the DSL availab
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
