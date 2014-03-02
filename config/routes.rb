Crowdfunder::Application.routes.draw do

  resources :pledges

  resources :projects do
    resources :breakpoints
  end

  get 'signin'          =>    'sessions#new',               as: :signin
  get 'signout'         =>    'sessions#destroy',           as: :signout
  resources :sessions, only: [:create]

  get 'signup'          =>    'users#new',                  as: :signup
  resources :users

  get 'tags/:tag', to: 'articles#index', as: :tag

  root      'welcome#index'
end
