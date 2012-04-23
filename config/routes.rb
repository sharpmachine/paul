Paulmanwaring::Application.routes.draw do
  resources :posts, :only => [:index, :show]

  devise_for :users
  
  # Namespace for Admin Section
  namespace :admin do
    # Admin 'Home' page
    match '/' => "posts#index", :as => :home    
    resources :posts
    resources :pages
    resources :tags, :only => [:create, :new, :destroy]        
    resources :users, :only => [:create, :new, :destroy]    
  end    
  
  match '/errors/test' => 'errors#test'
  
  root :to => 'home#index'
end
