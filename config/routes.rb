Rails.application.routes.draw do
  root :to => 'starter#home'

  
  get 'sessions/new'

  get 'users/new'

  get 'catering_items/CateringMenu'

  resources :cater_order_options


  get 'home/toppage'
  
  get 'cater_order_options/index'

  
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
