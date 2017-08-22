Rails.application.routes.draw do
  
  #users
  resources :users, only: [:index, :create, :destroy, :update]
  get '/sign_up', to: 'users#new'
  get 'profile/:id', to: 'users#show', as: 'profile'
  get 'profile/:id/edit', to: 'users#edit', as: 'edit_profile'
  put 'profile/:id', to: 'users#update'

  # sessions
  get '/sign_out', to: 'sessions#destroy'
  get '/sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  resources :categories, except: [:edit, :update, :destroy] do
    resources :chores, except: [:index]
  end

  get '/chores', to: 'chores#index', as: 'chores'
  
  post '/categories/:id/chores/:id/checked', to: 'chores#checked', as: 'checked'

  resources :teams, only: :show

  root 'static#index'
end
