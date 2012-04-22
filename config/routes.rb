Paulmanwaring::Application.routes.draw do
  resources :posts, :only => [:index, :show]

  devise_for :users
  
  # Namespace for Admin Section
  namespace :admin do
    # Admin 'Home' page
    match '/' => "posts#index", :as => :home    
    resources :posts
    resources :pages
    resources :users, :except => [:create, :new]    
  end    
  
  match '/errors/test' => 'errors#test'
  
  root :to => 'home#index'
end
