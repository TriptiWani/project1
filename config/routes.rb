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
  get '/orders/report' => 'orders#report' , :as => 'order_report'
  # get '/orders/:from_date/:to_date' => 'orders#index' , :as => 'order_detail'
  resources :users
  resources :products
  resources :orders
  resources :line_items

  get 'auth/facebook', as: "fb_auth_provider"
  get 'auth/facebook/callback' => 'users#login'

  get '/auth/twitter', as: "tw_auth_provider"
  get '/auth/twitter/callback' => 'users#twitter_login'

  get '/contact' => 'pages#contact' , :as => 'contact_us'
  get '/products/index/:category' => 'products#index', :as => 'product_category'
  get '/manage_products' => 'pages#products_home'
  # get '/users/:id/edit' => 'users#edit' , :as => 'edit_user'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/line_items/:product_id/new' => 'line_items#new' , :as => 'add_to_order'
  get '/line_items/:order_id/index' => 'line_items#index', :as => 'order_list'
  post '/orders/:id/:status' => 'orders#status' , :as => 'order_status'

  get '/currency' => 'pages#currency' , :as => 'get_currency'
end
