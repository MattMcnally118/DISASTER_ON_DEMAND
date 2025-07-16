Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for Dashboard.
  get 'dashboard', to: 'pages#dashboard'
  # Route for changing the user role: Visitor or Owner: Used in Nav Bar.
  patch 'users/toggle_role', to: 'users#toggle_role', as: :toggle_user_role

  # Main Routes Bookings mostly nested in Disasters.
  resources :disasters do
    resources :bookings, except: [:update]
  end
  # Bookings update not nested so it can be called in Dashboard.
  resources :bookings, only: [:update]
  # Reviews not nested, Can only make a review can't delete or edit.
  resources :reviews, only: [:new, :create]
end
