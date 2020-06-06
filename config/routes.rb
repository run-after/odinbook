Rails.application.routes.draw do
  resources :posts, only:[:create, :index, :update]
  resources :users, only:[:show, :index]
  resources :comments
  resources :friendships, only:[:new, :create, :destroy]
  resources :friend_requests, only:[:create, :destroy]
  root 'posts#index'
  devise_for :users, path: 'u'
end
