Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :collectives

  resources :events
end
