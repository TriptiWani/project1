# == Route Map
#
#          Prefix Verb   URI Pattern                  Controller#Action
#            root GET    /                            pages#home
# manage_products GET    /manage_products(.:format)   pages#products_home
#           users GET    /users(.:format)             users#index
#                 POST   /users(.:format)             users#create
#        new_user GET    /users/new(.:format)         users#new
#       edit_user GET    /users/:id/edit(.:format)    users#edit
#            user GET    /users/:id(.:format)         users#show
#                 PATCH  /users/:id(.:format)         users#update
#                 PUT    /users/:id(.:format)         users#update
#                 DELETE /users/:id(.:format)         users#destroy
#        products GET    /products(.:format)          products#index
#                 POST   /products(.:format)          products#create
#     new_product GET    /products/new(.:format)      products#new
#    edit_product GET    /products/:id/edit(.:format) products#edit
#         product GET    /products/:id(.:format)      products#show
#                 PATCH  /products/:id(.:format)      products#update
#                 PUT    /products/:id(.:format)      products#update
#                 DELETE /products/:id(.:format)      products#destroy
#          orders GET    /orders(.:format)            orders#index
#                 POST   /orders(.:format)            orders#create
#       new_order GET    /orders/new(.:format)        orders#new
#      edit_order GET    /orders/:id/edit(.:format)   orders#edit
#           order GET    /orders/:id(.:format)        orders#show
#                 PATCH  /orders/:id(.:format)        orders#update
#                 PUT    /orders/:id(.:format)        orders#update
#                 DELETE /orders/:id(.:format)        orders#destroy
#           login GET    /login(.:format)             session#new
#                 POST   /login(.:format)             session#create
#                 DELETE /login(.:format)             session#destroy
#

Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/manage_products' => 'pages#products_home'
  resources :users
  resources :products
  resources :orders
  resources :line_items

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/line_items/:product_id/new' => 'line_items#new' , :as => 'new_product_line_item_path'
end
