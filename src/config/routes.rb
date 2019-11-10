# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#homepage'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :items do
    resources :orders
  end

  get '/my_items', to: 'items#my_items', as: 'my_items'

  resources :pages

  delete 'users/:id', to: 'registrations#delete', as: 'delete_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
