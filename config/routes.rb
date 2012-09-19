Paulmanwaring::Application.routes.draw do
  
  devise_for :users
  resources :categories, :only => :show
  resources :products, :only => :index
  resources :pictures, :only => :index
  resources :posts, :only => [:index, :show]
  resources :events, :only => [:index, :new, :create]
  resources :contacts, :only => [:create, :index]  
    
  # Namespace for Admin Section
  namespace :admin do
    resources :inquiries

    resources :events

    resources :products

    # Admin 'Home' page
    match '/' => "posts#index", :as => :home    
    resources :posts do
      member do
        get :publish
      end
    end
    resources :categories    
    resources :pages
    resources :tags, :only => [:create, :new, :destroy]        
    resources :users, :except => [:create, :new]    
    resources :pictures
  end    
  
  match '/errors/test' => 'errors#test'
  
  match 'paul' => 'home#paul', :as => :paul
  match 'give' => 'home#give', :as => :give
  match 'friends' => 'home#friends', :as => :friends    
  match 'photos' => 'pictures#index', :as => :photos
  match 'photo-archive' => 'pictures#archive', :as => :photo_archive  
  match 'contact' => 'contacts#index', :as => :contact
  match 'privacy' => 'home#privacy', :as => :privacy
  match 'terms' => 'home#terms', :as => :terms    
    
  root :to => 'home#index'
  match '*a', :to => 'errors#routing', :format => false  
end
