# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#home'
  resources :sessions, only: %i[new create destroy]
  namespace :moderator do
    resources :blog_posts do
      resources :approvals, only: %i[new create edit]
      resources :suggestions, only: %i[new create]
      post 'decline', as: 'decline', action: :destroy, controller: "approvals"
    end
  end

  resources :blog_posts do
    resources :comments
  end

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
