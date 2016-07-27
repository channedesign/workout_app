Rails.application.routes.draw do

  devise_for :users

  resources :users do
  	resources :workouts
  end

  root 'dashboard#index'
end
