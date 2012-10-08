CitizenII::Application.routes.draw do


  resources :menus

  resources :maps

  resources :salads

  resources :orders do
    resources :dishes
    resources :sides
    resources :drinks
    resource  :address 
  end

  resource :address 

  resources :drinks

  resources :sides

  resources :dishes

  resources :boxmenus do    
    resources :dishes
    resources :sides
    resources :drinks
  end


  resources :photos

  resources :galleries

  

  resources :blogs
  resources :maps
  
  resources :authentications, :only => [:index, :create, :destroy]
  match '/auth/:provider/callback' => 'authentications#create'

 # devise_for :users, :controllers => { :authentications => 'registrations' }
  
  #devise_for :users, :controllers => { :omniauth_callbacks => 'authentications', :registrations => 'registrations' }
devise_for :users, :controllers => {:authentications => "authentications", :omniauth_callbacks => "omniauth_callbacks"}
  
  
  
  root :to => 'blogs#show'
  match 'get_menu' => 'menus#get_menu', :as => 'get_menu'
  match 'order_sheet' => 'orders#order_sheet', :as => 'order_sheet'
  match 'textile_preview' => 'textile_preview#show'
  match 'confirmation' => 'orders#confirmation', :as => 'confirmation'
  match 'map' => "maps#show", :as =>'map'
  match 'directions' => 'maps#directions', :as =>'directions'
  match 'publish' => 'blogs#publish', :as => 'publish'
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end