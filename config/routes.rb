Rails.application.routes.draw do
  root 'users#show'
  devise_for :users
  #devise_scope :user do
  #  root to: 'devise/sessions#new'
  #end
end
