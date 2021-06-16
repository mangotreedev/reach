Rails.application.routes.draw do
  devise_for :users

  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?

  root to: 'pages#home'
  get '/about', to: 'pages#about'

  resources :surveys, only: [:index, :new, :create, :show, :destroy] do
    resources :choices, only: [:new, :create]
    resource :publication, only: [ :create, :destroy ]
    resource :approval, only: :create
    resource :results, only: :show
    resource :reports, only: :create
  end

  resources :choices, only: :destroy do
    resources :votes, only: :create
  end

  namespace :user do
    resource :dashboard, only: :show
  end

  namespace :admin do
    resource :dashboard, only: :show
  end

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer", as: 'blazer_dashboard'
  end
end
