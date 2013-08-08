CitizenII::Application.routes.draw do


  devise_for :users

  resources :orders do
    resources :dishes
    resources :sides
    resources :drinks
    resource  :address 
  end

  resources :boxmenus do    
    resources :dishes
    resources :sides
    resources :drinks
    resources :salads
  end
  
  resources :schedules
  resources :punchclocks
  resources :menus
  resources :maps
  resource :address 
  resources :photos
  resources :galleries
  resources :blogs
  resources :maps
 
  namespace :admin do
    resources :punchclocks
    
      get 'clocks', :to => 'punchclocks#clocks', :as => :clocks
      match 'get_dates' => 'punchclocks#get_dates'
    
  end

 

  root :to => 'blogs#show'
  match 'get_box_menu' => 'boxmenus#get_box_menu', :as => 'get_box_menu'
  match 'get_menu' => 'menus#get_menu', :as => 'get_menu'
  match 'order_sheet' => 'orders#order_sheet', :as => 'order_sheet'
  match 'textile_preview' => 'textile_preview#show'
  match 'confirmation' => 'orders#confirmation', :as => 'confirmation'
  match 'map' => "maps#show", :as =>'map'
  match 'directions' => 'maps#directions', :as =>'directions'
  match 'publish' => 'blogs#publish', :as => 'publish'

end