Rails.application.routes.draw do

  resources :products

  root to: 'products#index'

  devise_for :users
  resources :users, :controllers => {registrations: 'registrations'}, :only =>[:show]
end
