Rails.application.routes.draw do
  devise_for :users

  root "collectives#index"

  resources :collectives
end
