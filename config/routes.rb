Rails.application.routes.draw do
  resources :users

  resources :categories do
    resources :chores
  end

  resources :team, only: :create

  root 'static#index'
end
