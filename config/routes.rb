Rails.application.routes.draw do
  resources :posts, only:[:create, :index]
  resources :users, only:[:show, :index, :update]
  resources :comments
  resources :friendships, only:[:new, :create, :destroy]
  resources :friend_requests, only:[:create, :destroy]
  resources :likes

  root 'posts#index'
  devise_for :users, path: 'u', :controllers => { omniauth_callbacks: "users/omniauth_callbacks",
                                                  registrations: "registrations" }
end
