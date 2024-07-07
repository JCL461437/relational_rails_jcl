Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/gyms", to: "gyms#index"
  get "/gyms/new", to: "gyms#new"
  post "/gyms", to: "gyms#create"
  get "/gyms/:id/edit", to: "gyms#edit"
  patch "/gyms/:id", to: "gyms#update"
  get "/gyms/:id", to: "gyms#show"

  get "gyms/:id/fighters", to: "gym_fighters#index"
  get "gyms/:id/fighters/new", to: "gym_fighters#new"
  post "gyms/:id/fighters", to: "gym_fighters#create"

  get "/fighters", to: "fighters#index"
  get "/fighters/:id/edit", to: "fighters#edit"
  patch "/fighters/:id", to: "fighters#update"
  get "/fighters/:id", to: "fighters#show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
