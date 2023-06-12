Rails.application.routes.draw do

  devise_for :users

  root "pages#home"

  resources :users, only: [:show]

  resources :collectives do
    # TODO: eliminar rotas não utilizadas?
    resources :memberships
  end

  resources :events do
    resources :event_lists, as: "lists" do
      resources :event_list_subscriptions, only: [:create], as: "subscriptions"
    end
  end

  ## Sandbox page
  get "/teste", to: "pages#teste"
end
