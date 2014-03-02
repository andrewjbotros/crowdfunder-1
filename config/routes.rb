Crowdfunder::Application.routes.draw do

  resources :pledges

  resources :projects

  get 'signin'          =>    'sessions#new',               as: :signin
  get 'signout'         =>    'sessions#destroy',           as: :signout
  resources :sessions, only: [:create]

  get 'signup'          =>    'users#new',                  as: :signup
  resources :users do
    resources :projects, controller: "users/projects" do
      resources :breakpoints, controller: "users/breakpoints"
    end
  end

  get 'tags/:tag', to: 'projects#index', as: :tag

  root      'welcome#index'
end
