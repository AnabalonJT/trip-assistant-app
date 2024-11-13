Rails.application.routes.draw do
  devise_for :users

  # Set the root to the Devise login page
  authenticated :user do
    root 'trips#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  # Other routes, such as resources
  resources :trips do
    get "join_trip", on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
