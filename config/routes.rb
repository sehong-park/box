Rails.application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders
  resources :units
  resources :articles, only: [:create, :edit, :update, :destroy]
  
  namespace :admin do
    resources :users, :orders, :units, :articles
  end
  
  root 'welcome#index'
  
  
  # LOGIN
  #match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  #match 'auth/failure', to: redirect('/'), via: [:get, :post]
  #match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  #match 
  
  # QnA
  match '/question/:type', to: 'articles#new', via: 'get'
  match '/question/:type/:order_id', to: 'articles#new', via: 'get'
  match '/article/:id/answer', to: 'articles#answer', via: 'get'
  
  # ORDERING
  match '/ordering', to: 'orders#new', via: 'get'
  
  # WELCOME
  match '/pricing', to: 'orders#pricing', via: 'get'
  match '/qna', to: 'articles#qna', via: 'get'
  
  # ADMIN PAGE
  match '/admin', to: 'admin/admin#index', via: 'get'

  # FOOTER
  match '/policy', to: 'welcome#policy', via: 'get'
  match '/privacy', to: 'welcome#privacy', via: 'get'
end
