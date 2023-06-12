Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :users, only: [:show]

  resources :collectives do
    # TODO: eliminar rotas não utilizadas?
    resources :memberships
  end

  resources :events
end
