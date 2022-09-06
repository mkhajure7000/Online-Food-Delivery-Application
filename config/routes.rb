Rails.application.routes.draw do

  root to: "users#index"
  resources :sessions, only: %i[new create destroy]
  get 'password' , to: 'passwords#new'
  post 'password' , to: 'passwords#create'
  get 'password/edit' , to: "passwords#edit"
  patch "password/edit" , to: "passwords#update"

  resources :users do
    resources :addresses
  end

  resources :restaurants do
    resources :foods
  end

end
