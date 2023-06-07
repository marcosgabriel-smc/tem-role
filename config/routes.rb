Rails.application.routes.draw do
  devise_for :users

  root "collectives#index"

  resources :collectives

  resources :events

  get "map", to: "pages#home"
end
