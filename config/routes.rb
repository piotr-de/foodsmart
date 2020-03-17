Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :recipes, only: [ :index, :show ]
  resources :ingredients, only: [ :index, :show ]
  get "/api/:query", to: 'recipes#api', as: :api
end
