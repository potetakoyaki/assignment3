Rails.application.routes.draw do
  get 'users/show'
  get "home/about" => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :books
  resources :users, only: [:show, :index, :edit, :update]
end