Rails.application.routes.draw do
  devise_for :users

  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?

  root to: 'pages#home'

  resources :surveys, only: [:new, :create, :show] do
    resources :choices, only: [:new, :create]
    resource :publication, only: :create
    resource :results, only: :show
  end

  resources :choices, only: :destroy do
    resources :votes, only: [:create]
  end
end


