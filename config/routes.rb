Rails.application.routes.draw do

  devise_for :users

  root "pages#home"

  resources :users, only: [:show]

  resources :collectives do
    # TODO: eliminar rotas não utilizadas?
    resources :memberships
  end

  resources :events do
    resources :event_lists, path: 'lists', as: :lists do
      post '/subscribe', to: 'event_lists#subscribe'
      delete '/subscribe', to: 'event_lists#unsubscribe'
    end
  end

  ## Sandbox page
  get "/teste", to: "pages#teste"
end
