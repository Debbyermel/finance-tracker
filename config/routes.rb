Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  resources :users, only: [:show]
  resources :friendships, only: [:create, :destroy]
  resources :user_stocks, only: [:create, :destroy]
end
