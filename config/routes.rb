Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show'
  resources :recipes, only: [:create, :destroy, :index, :show]
  resources :foods, only: [:create, :destroy, :index, :show]
end
