Rails.application.routes.draw do
  resources :games, except: [:edit, :update]
  root to: "games#index"
end
