class HomeController < ApplicationController
  skip_authorization_check
  
  def index
    @intro = Page.find("homepage-intro")
    @product = Product.get_featured
  end  
end
