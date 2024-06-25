Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'
  
  
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
  
  get 'home/about', to: 'home#about', as: 'about'
end
