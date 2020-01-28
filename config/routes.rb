# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'identities#index'

  resources :identities, except: :show do
    resources :facets, only: %i[index new create]
  end
end
