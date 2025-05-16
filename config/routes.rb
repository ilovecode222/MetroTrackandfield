Rails.application.routes.draw do
  resources :athletes
  resources :events do
    collection do
      get :leaderboard
    end
  end

  resources :results do
    collection do
      get 'meets'
    end
  end
  if Rails.env.production?
  get "/seed_events", to: "seeds#add_events"
end

  root "home#index"

  get "home/index"
  get "home/about"
  get "home/contactus"
  get "home/help"
  get 'results/meets', to: 'results#meets'


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :microposts do
    member do
      get :like
    end
  end

  resources :users
end
