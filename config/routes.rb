Clean::Application.routes.draw do
  devise_for :users
  
  # Namespace for Admin Section
  namespace :admin do
    # Admin 'Home' page
    match '/' => "home#index", :as => :home    
    resources :pages
  end    
  
  match '/errors/test' => 'errors#test'
  
  root :to => 'home#index'
  match '*a', :to => 'errors#routing'  
end
