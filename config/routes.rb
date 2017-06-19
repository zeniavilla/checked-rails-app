Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :chores
  end

  resources :team, only: :create

  root 'static#index'
end
