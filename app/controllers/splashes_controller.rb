class SplashesController < ApplicationController

  skip_authorization_check
  
  layout "splash"

  def index
  end
   
end