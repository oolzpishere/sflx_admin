Rails.application.routes.draw do
  resources :galleries
  namespace :admin do
    resources :users
    resources :galleries
    resources :images
    
    root to: "users#index"
  end

  devise_for :users
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '*path', to: 'pages#show'
  root to: "pages#index"
end
