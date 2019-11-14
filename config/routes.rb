# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#home'
  resources :sessions, only: %i[new create destroy]
  namespace :moderator do
    resources :blog_posts do
      resources :approvals, only: %i[new create destroy]
      post 'decline', as: 'decline', action: :destroy, controller: "approvals"
      resources :suggestions, only: %i[new create]
    end
  end

  resources :blog_posts do
    resources :comments
    scope module: :blog_posts do
      resource :status_save, only: %i[create]
      resource :status_submit, only: %i[create]
    end
  end

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
