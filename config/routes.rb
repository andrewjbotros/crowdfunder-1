Crowdfunder::Application.routes.draw do

  get 'signin'          =>    'sessions#new',               as: :signin
  get 'signout'         =>    'sessions#destroy',           as: :signout
  resources :sessions, only: [:create]

  get 'signup'          =>    'users#new',                  as: :signup
  resources :users

  root      'welcome#index'
end
