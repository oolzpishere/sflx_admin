Rails.application.routes.draw do
  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
  end

  namespace :admin do
    resources :users
    resources :galleries
    resources :images
    resources :gallery_types

    root to: "users#index"
  end

  devise_for :users, only: :sessions
  # devise_for :users, skip: [:registrations, :confirmations]

  # resources :galleries, only: [:index, :show]
  mount Frontend::Engine   => '/', as: 'frontend'
  mount Cgallery::Engine   => '/', as: 'gallery'
  # resources :pages, only: [:index, :show]

  # root to: "pages#index"

  resources :crequests, only: [:new, :create]


  # last line
  get 'conference', 'web', 'about', 'contact', 'contact/find_us', to: 'pages#show'

end
