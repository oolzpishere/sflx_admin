Frontend::Engine.routes.draw do
  root to: "pages#index"
  
  # last line
  get 'conference', 'web', 'about', 'contact', 'contact/find_us', to: 'pages#show'
end
