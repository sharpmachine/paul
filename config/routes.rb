Paulmanwaring::Application.routes.draw do
  resources :categories, :only => [:index, :show]

  resources :posts, :only => [:index, :show]

  devise_for :users
  
  # Namespace for Admin Section
  namespace :admin do
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
    resources :pictures, :except => [:edit, :update]   
  end    
  
  match '/errors/test' => 'errors#test'
  
  root :to => 'home#index'
end
