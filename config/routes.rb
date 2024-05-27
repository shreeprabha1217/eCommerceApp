Rails.application.routes.draw do
  resources :orders
  resources :products

  # Route for sessions new action (login page) and create action
  resource :sessions, only: [:new, :create, :destroy]
  # config/routes.rb
  post 'add_to_orders', to: 'orders#add_to_orders', as: 'add_to_orders'
  # Route for health check
  get "up" => "rails/health#show", as: :rails_health_check
  get '/orders/:id/buy', to: 'orders#buy', as: 'buy_order'

  # Root route
  root "sessions#new"
end
