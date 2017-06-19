Rails.application.routes.draw do
  resources :users, except: :new
  get 'users/sign_up', to: 'users#new'

  # sessions
  get 'users/sign_out', to: 'sessions#destroy'
  get 'users/sign_in', to: 'sessions#new'

  resources :categories do
    resources :chores
  end

  resources :team, only: :create

  root 'static#index'
end
