Rails.application.routes.draw do
  get 'policy/index'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # si falla omniauth añadir passthru a callbacks controller
  

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
