Rails.application.routes.draw do

  root to: "users#index"
  resources :sessions, only: %i[new create destroy]
  get 'password' , to: 'passwords#new'
  post 'password' , to: 'passwords#create'
  get 'password/edit' , to: "passwords#edit"
  patch "password/edit" , to: "passwords#update"

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
  post 'cart_items' => "cart_items#create"
  get 'cart_items/:id' => "cart_items#show", as: "cart_item"
  delete 'cart_items/:id' => "cart_items#destroy"

  resources :users do
    resources :addresses
  end

  resources :restaurants do
    resources :foods
  end

end
