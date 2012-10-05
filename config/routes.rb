Rajesh::Application.routes.draw do
  resources :products

  resources :users
  
  resources :sessions
  match 'auth/:provider/callback', :to => 'sessions#create'
  match 'auth/failure', :to => redirect('/')
  match 'signout', :to => 'sessions#destroy', :as => 'signout'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  match 'admin/role_create' => 'admin#role_create'
  match 'admin/user_create' => 'admin#user_create'
  match 'admin/signin' => 'admin#signin'
  match 'admin/signin' => 'admin#signin'

  match 'buyer/catalog' => 'buyer#catalog'
  match 'buyer/show' => 'buyer#show'
  match 'buyer/cart_catalog' => 'buyer#cart_catalog'
  match 'buyer/display_total' => 'buyer#display_total'
  match 'buyer/pay' => 'buyer#pay'
  match 'buyer/print_receipt' => 'buyer#print_receipt'
  match 'admin/logout' => 'admin#logout'

  match 'admin/display_users' => 'admin#display_users'

  #------------------------- not mandatory----------
  match 'admin/x' => 'admin#x'
  match  'admin/start_append' => 'admin#start_append'
  match 'admin/end_append' => 'admin#end_append'
#------------------------- not mandatory----------
# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
# root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
