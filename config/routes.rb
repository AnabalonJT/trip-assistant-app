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
    post 'add_recipe', to: 'trips#add_recipe', as: :add_recipe, on: :member
  end
  
  resources :recipes do
    get "join_trip" , to: 'trips#join_trip', as: :join_trip, on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
