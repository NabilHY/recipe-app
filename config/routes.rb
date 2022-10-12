Rails.application.routes.draw do
  root "foods#index"
  devise_for :users
  devise_for :installs
  resources :recipes, only: [:new, :create, :destroy, :index, :show]
  resources :foods, only: [:destroy, :index, :new, :create, :show]
  resources :public_recipes, only: [:index]
end

