# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#homepage'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :orders
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
