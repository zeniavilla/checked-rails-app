Rails.application.routes.draw do
  
  #users
  resources :users, only: [:index, :create, :destroy, :update]
  get 'users/sign_up', to: 'users#new'
  get 'profile', to: 'users#show'
  get 'profile/:id/edit', to: 'users#edit', as: 'edit_profile'

  # sessions
  get '/sign_out', to: 'sessions#destroy'
  get '/sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  resources :categories do
    resources :chores
  end

  resources :team, only: :create

  root 'static#index'
end
