Rails.application.routes.draw do
  resources :users
  get  '/signup',  to: 'users#new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/signin',  to: 'user_sessions#new'
  post '/signin',  to: 'user_sessions#create'
  delete  '/signout', to: 'user_sessions#destroy'
  root 'static_pages#home'
end
