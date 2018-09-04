Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :skip => [:registrations]

  root to: "home#index"

  resources :books, except: [:new, :destroy], param: :token do
    member do
      post 'create_member', 'fetch_users'
      post 'create_item'
    end
  end

end
