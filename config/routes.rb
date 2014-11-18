Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, :controllers => {registrations: 'registrations'}, :only =>[:show]


  resources :products

  root to: 'products#index'


end
