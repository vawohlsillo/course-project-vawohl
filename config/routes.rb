Rails.application.routes.draw do
  #resources :probandos
  resources :flags, only: [:create]
  get 'flags/create'
  get 'policy/index'
  get 'users/index', as: "profile"
  get 'users/show'
  get 'users/edit_user', as: "edit_user"
  get 'posts/index'
  patch 'users/update'
  resources :posts
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :inappropiate_posts, only: [:create]
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # si falla omniauth añadir passthru a callbacks controller
  

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
