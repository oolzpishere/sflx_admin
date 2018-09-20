Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :galleries
    resources :images
    resources :gallery_types

    root to: "users#index"
  end

  devise_for :users, only: :sessions
  # devise_for :users, skip: [:registrations, :confirmations]

  resources :pages, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  resources :galleries, only: [:index, :show]
  resources :crequests, only: [:new, :create]

  get 'conference', 'web', 'about', 'contact', 'contact/find_us', to: 'pages#show'

end
