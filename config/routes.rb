Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"
  resources :party_guests
  resources :types
  resources :shop_list, only: [:show]
  resource :report, only: [:show]
  resource :melange_management
  resources :products do
    get '/assign_product', to: 'products#assign', as: 'assign'
  end
end
