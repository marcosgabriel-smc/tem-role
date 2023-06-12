Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :users, only: [:show]

  resources :collectives do
    # TODO: eliminar rotas não utilizadas?
    resources :memberships
  end

  resources :events

  get "my_profile", to: "pages#my_profile"
  get "/teste", to: "pages#teste"
end
