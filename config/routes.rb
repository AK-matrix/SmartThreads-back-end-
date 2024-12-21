Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  resources :topics, only: [:index]
  resources :discussions, only: [:index]
  resources :posts, only: [:index]
  post '/login', to: 'sessions#create' # Login endpoint
  post '/users/login', to: 'users#login'
  get '/protected_route', to: 'protected#index' # Protected endpoint
end
