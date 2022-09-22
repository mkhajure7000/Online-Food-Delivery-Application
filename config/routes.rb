Rails.application.routes.draw do

  root to: "users#index"
  resources :sessions, only: %i[new create destroy]
  get 'password' , to: 'passwords#new'
  post 'password' , to: 'passwords#create'
  get 'password/edit' , to: "passwords#edit"
  patch "password/edit" , to: "passwords#update"

  resources :cart_items
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
  
  resources :orders, only: %i[index show create]

  resources :users do
    resources :addresses
  end

  resources :restaurants do
    resources :foods
  end

end
