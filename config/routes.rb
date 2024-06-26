Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'
  
  
  resources :users, only: [:show, :edit, :update, :index]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  
  get 'home/about', to: 'home#about', as: 'about'
end
