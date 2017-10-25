Rails.application.routes.draw do
  resources :collaborators
  
  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :users, only: [:update]
  resources :charges, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'
  
  root 'wikis#index'
  
end
