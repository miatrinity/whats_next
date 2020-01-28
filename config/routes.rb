# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'identities#index'

  resources :identities, except: :show do
    resources :facets, except: :show
  end
  #  only: %i[index new create edit]
end
