Rails.application.routes.draw do
  
  #users
  resources :users, only: [:index, :create, :destroy, :update]
  get 'users/sign_up', to: 'users#new'
  get 'profile', to: 'users#show'
  get 'profile/edit', to: 'users#edit'

  # sessions
  get '/sign_out', to: 'sessions#destroy'
  get '/sign_in', to: 'sessions#new'

  resources :categories do
    resources :chores
  end

  resources :team, only: :create

  root 'static#index'
end
