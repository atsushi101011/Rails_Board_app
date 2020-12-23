Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :boards
  #get 'boards', to: 'boards#index'
  #get 'boards/new', to: 'boards#new'
  #post 'boards' to: 'boards#create'
end
