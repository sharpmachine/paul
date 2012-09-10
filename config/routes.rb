Paulmanwaring::Application.routes.draw do
  
  devise_for :users
  resources :categories, :only => :show

  resources :posts, :only => [:index, :show]

  resources :events, :only => [:index, :new, :create]
    
  # Namespace for Admin Section
  namespace :admin do
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
  
  root :to => 'home#index'
  match '*a', :to => 'errors#routing', :format => false  
end
