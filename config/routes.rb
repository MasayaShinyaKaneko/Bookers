Rails.application.routes.draw do
  root to: 'books#top'
  get 'home/about' => "books#about", as:"about"
  devise_for :users
  resources :books, only:[:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
