Rails.application.routes.draw do
  devise_for :users

  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?

  root to: 'pages#home'

  resources :surveys, only: [:new, :create, :show] do
    resources :choices, only: [:new, :create]
    resource :publication, only: :create
  end
  resources :choices, only: :destroy
end
