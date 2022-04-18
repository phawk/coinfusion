Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :registrations, only: %i[new create]
  get "/signup_success", to: "pages#signup_success", as: :signup_success
  resources :sessions, only: %i[new create]
  get "/logout", to: "sessions#destroy"
  root "registrations#new"
end
