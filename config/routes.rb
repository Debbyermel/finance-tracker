Rails.application.routes.draw do
  resources :user_stocks, only: [:create]
  devise_for :users
  root 'pages#home'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'users#search'
end
