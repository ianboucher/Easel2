Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :profiles

  resources :artworks

  resources :images, only: [:create, :update, :destroy]

  resources :favorites, only: [:create, :destroy]

  resources :purchases, only: [:new, :create]

  resources :refunds, only: [:create]

  resources :dashboards, only: :show

  authenticated :user do
    root 'dashboards#show', as: :authenticated_root # change root for signed-in users
  end

  get 'welcome/about'

  root 'welcome#index'

end
