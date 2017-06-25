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
  get '/auth/facebook/callback' => 'sessions#create'

  resources :categories do
    resources :chores, except: [:index]
  end

  get '/chores', to: 'chores#index', as: 'chores'
  
  post '/categories/:id/chores/:id/checked', to: 'chores#checked', as: 'checked'

  resources :teams, only: :show

  root 'static#index'
end
