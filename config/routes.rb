Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"
  resources :organizer
  resources :party_guest
  resources :shop_list, only: [:show]
  resource :report, only: [:show]
  resources :products do
    get '/assign_product', to: 'products#assign', as: 'assign'
  end
end
