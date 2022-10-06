Rails.application.routes.draw do
  devise_for :users

  root "events#index"
  
  resources :events, only: [:index, :new, :create, :show]

  resources :users, only: [:show]
end
