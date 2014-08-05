Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders
  resources :units
  
  
  root 'welcome#index'
  
  # LOGIN
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  # ORDERING
  match '/ordering', to: 'orders#new', via: 'get'
  match '/cunit', to: 'units#create', via: 'post'
  #
end
