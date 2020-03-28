Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :organizer
  resources :party_guest
  resources :shop_list, only: [:show]
  resources :products do
    get '/assign_product', to: 'products#assign', as: 'assign'
  end
end
