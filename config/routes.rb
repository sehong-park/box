Rails.application.routes.draw do
  get 'welcome/index'

  resources :users
  match '/signup', to: 'users#new', via: 'get'
  root 'welcome#index'
end
