Cgallery::Engine.routes.draw do
  resources :galleries, only: [:index, :show]
end
