Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: "home#index"

  resources :books, only: [:index, :create, :edit, :update]
  get 'book/:token', to: 'books#book', as: 'book_token'

end
