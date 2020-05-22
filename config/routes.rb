Rails.application.routes.draw do
  root 'home#index'
  get "home/about" => "home#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :create, :show, :edit, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
