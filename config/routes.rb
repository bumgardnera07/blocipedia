Rails.application.routes.draw do
  resources :wikis
  resources :users, only: [:update]
  resources :charges, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'
  
  root 'wikis#index'
  
end
