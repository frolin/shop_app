Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products

  root to: 'products#index'

  devise_for :users
  resources :users
end
