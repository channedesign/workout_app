Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users do
  	resources :workouts
  end


  resource :dashboard, only: [:index] do
  	collection do
  		post :search, to: 'dashboard#search'
  		get :search, to: 'dashboard#search'
  	end
  end

  root 'dashboard#index'
end
