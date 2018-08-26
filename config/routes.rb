Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: "home#index"

  resources :books, only: [:index, :create]
  get 'book/:token' => 'books#book', as: 'book'

end
