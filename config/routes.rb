Rails.application.routes.draw do
  #resources :probandos
  root to: 'home#index'
  resources :flags, only: [:create]
  get 'flags/create'
  get 'policy/index'
  get 'users/index', as: "profile"
  get 'users/show'
  get 'users/edit_user', as: "edit_user"
  get 'posts/index', as: 'posts_index'
  post 'users/update'
  get 'users/enable_admin', to: 'users#enable_admin', as: 'enable_admin'
  get 'users/unable_admin', to: 'users#unable_admin', as: 'unable_admin'
  get 'users/enable_superadmin', to: 'users#enable_superadmin', as: 'enable_superadmin'
  get 'users/unable_superadmin', to: 'users#unable_superadmin', as: 'unable_superadmin'
  resources :users, only: [:enable_admin, :unable_admin, :enable_superadmin, :unable_superadmin]
  resources :posts
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :inappropiate_posts, only: [:create]
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # si falla omniauth añadir passthru a callbacks controller
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
