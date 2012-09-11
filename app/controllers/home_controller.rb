class HomeController < ApplicationController
  skip_authorization_check
  
  def index
    @selected_nav = "home"
    
    @intro = Page.find("homepage-intro")
    @post = Post.published.try(:first)
    @product = Product.get_featured

    @instagrams = Instacache.retrieve
  end  
end
