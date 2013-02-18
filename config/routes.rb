Pos::Application.routes.draw do

  resources :products do 
    member do
      get :activate
      get :deactivate
    end
  end

  resources :sales do
    member do
      get :checkout
      get :complete
    end
  end
  resources :sale_items
  resources :transactions
  resources :refunds
  match 'refunds/search' => 'refunds#search', :via => :post

  resources :suppliers
  resources :stock_locations
  resources :stock_levels
  resources :supplier_stock_orders do
    member do
      get :complete
      get :process_order
    end
  end
  resources :stock_transfers do
    member do
      get :complete
    end
  end

  get "reports" => 'reports#index'
  get "reports/sale"
  get "reports/stock"
  get "reports/financial"
  get "reports/staff"
  get "reports/supplier"
  get "reports/customer"

  match 'help' => "home#help"

  devise_for :users, :skip => [:sessions]
  devise_scope :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    get 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get 'signup', :to => 'devise/registrations#new', :as => :new_user_registration
  end
  match 'members' => 'users#members_index', :via => :get
  match 'staff' => 'users#staff_index', :via => :get
  match 'members/:id' => 'users#edit', :via => :get, :as => :edit_user
  match 'members/:id' => 'users#update', :via => :put, :as => :edit_user
  match 'users/purchases'=> 'users#purchases', :via=>:get
  root :to => "home#index"

end
