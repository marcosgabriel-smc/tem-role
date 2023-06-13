Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :users, only: %i[index show]

  resources :collectives do
    # TODO: eliminar rotas não utilizadas?
    resources :memberships, except: %i[index show new edit]
  end

  resources :events

  get "/teste", to: "pages#teste"
end
