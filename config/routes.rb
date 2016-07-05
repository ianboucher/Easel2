Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :profiles

  resources :artworks

  resources :purchases, only: [:new, :create]

  resources :images#, only: [:create, :destroy]

  resources :dashboards, only: :show

  authenticated :user do
    root 'dashboards#show', as: :authenticated_root # change root for signed-in users
  end

  get 'welcome/about'

  root 'welcome#index'

end
