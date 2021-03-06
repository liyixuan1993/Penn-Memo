Rails.application.routes.draw do
  resources :responds
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :memos

  root "memos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
