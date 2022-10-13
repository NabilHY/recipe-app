Rails.application.routes.draw do
  root "foods#index"
  devise_for :users
  devise_for :installs
  resources :recipes, only: [:new, :create, :destroy, :index, :show]
  resources :foods, only: [:destroy, :index, :new, :create, :show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]

  resources :recipes, only: [:index] do
    resources :recipe_foods, only: [ :new, :create, :destroy, :index]
  end
end

