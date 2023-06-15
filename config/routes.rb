Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root "pages#home"

  resources :users, only: %i[index show]

  resources :collectives do
    # TODO: eliminar rotas não utilizadas?
    resources :memberships, except: %i[index show new edit]
    post '/membership/:username', to: 'membership#new_membership', as: :new_membership
  end

  get '/events/state/:state', to: "events#state", as: 'events_by_state'
  resources :events do
    resources :event_lists, path: 'lists', as: :lists do
      get '/print', to: 'event_lists#print'
      post '/subscribe', to: 'event_lists#subscribe'
      delete '/subscribe', to: 'event_lists#unsubscribe'
    end
  end

  ## Sandbox page
  get "/teste", to: "pages#teste"
end
