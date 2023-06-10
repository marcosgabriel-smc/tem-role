Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :collectives

  resources :events

  get "my_profile", to: "pages#my_profile"
  get "/teste", to: "pages#teste"
end
