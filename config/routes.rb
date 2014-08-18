Rails.application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders
  resources :units
  resources :articles
  
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
  
  # WELCOME
  match '/pricing', to: 'orders#pricing', via: 'get'
  match '/qna', to: 'articles#qna', via: 'get'
  
  # ADMIN PAGE
  match '/admin', to: 'admin/admin#index', via: 'get'

end
