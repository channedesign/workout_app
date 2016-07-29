Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users do
  	resources :workouts
  end

  root 'dashboard#index'
end
