Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders
  resources :units
  
  namespace :admin do
    resources :users, :orders, :units
  end
  
  root 'welcome#index'
  
  # LOGIN
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  # ORDERING
  match '/ordering', to: 'orders#new', via: 'get'
  match '/pricing', to: 'orders#pricing', via: 'get'
  
  # ADMIN PAGE
  match '/admin', to: 'admin/admin#index', via: 'get'

end
