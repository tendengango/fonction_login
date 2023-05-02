Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks 
  resources :users, except: :index
  resources :sessions, only: %w(new create destroy)
  
end
