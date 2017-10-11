Rails.application.routes.draw do
  resources :wikis
  resources :users, only: [:update]

  devise_for :users
  
  get 'about' => 'welcome#about'
  
  root 'wikis#index'
end
