Rails.application.routes.draw do
  devise_for :users

  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?

  root to: 'pages#home'
  get '/terms_of_use', to: 'pages#terms_of_use'
  get '/privacy_policy', to: 'pages#privacy_policy'

  resources :surveys, only: [:index, :new, :create, :show, :destroy] do
    resources :choices, only: [:new, :create]
    resource :publication, only: [ :create, :destroy ]
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
end


# TODO: Positive uplifting lingo for who is the reacher
# TODO: Make survey disappear after a period of time
# TODO: immediate survey removal after reporting, and then need to be placed back in thru approval
# TODO: After 100 votes if there is a steep difference survey disappears
# TODO: Reach out to the guys of hotornot and see if you can get their advice
# TODO: Style using glassmorphism
# TODO: Add video background to about page
# TODO: Set up docker and dip
