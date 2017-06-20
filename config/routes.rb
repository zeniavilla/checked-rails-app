Rails.application.routes.draw do
  
  #users
  resources :users, only: [:index, :create, :destroy, :update]
  get 'users/sign_up', to: 'users#new'
  get 'profile/:id/edit', to: 'users#edit', as: 'edit_profile'
  put 'profile/:id', to: 'users#update'

  # sessions
  get '/sign_out', to: 'sessions#destroy'
  get '/sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  resources :categories do
    resources :chores, except: [:new, :create]
  end

  get '/chores/new', to: 'chores#new', as: 'new_chore'
  post '/chores', to: 'chores#create'

  resources :team, only: :create

  root 'static#index'
end
