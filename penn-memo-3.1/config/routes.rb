Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  resources :responses
  resources :user_tags
  devise_for :users
  resources :memos
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
