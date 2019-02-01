Admin::Engine.routes.draw do
  scope path: :admin do
    resources :galleries
    resources :gallery_types
    resources :images, only: [:destroy]

    root to: 'galleries#index'
  end

  devise_for :users, module: 'devise', class_name: "Account::User"

end
