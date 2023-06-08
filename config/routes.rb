Rails.application.routes.draw do
  devise_for :users

  root "collectives#index"

  resources :collectives

  resources :events

  post '/zip_code_finder', to: 'pages#zip_code_finder', as: :find_address

  get '/home', to: 'pages#home', as: :home
end
