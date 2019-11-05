# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#home'
  resources :sessions, only: %i[new create destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
