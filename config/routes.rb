Rails.application.routes.draw do
  resources :registrations, only: %i[new create]
  # Defines the root path route ("/")
  root "registrations#new"
end
