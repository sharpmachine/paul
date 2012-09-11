class HomeController < ApplicationController
  skip_authorization_check
  
  def index
    @selected_nav = "home"
    @intro = Page.find("homepage-intro")
    @post = Post.published.try(:first)
    @product = Product.get_featured
    @pictures = Picture.published.limit(3)  
    @instagrams = Instacache.retrieve
  end  
  
  def paul
    @selected_nav = "paul"
    @nursing = Page.find("paul-nursing")
    @faith_journey = Page.find("paul-faith-journey")
    @family = Page.find("paul-family")
    @interests = Page.find("paul-interests")
    @life_messages = Page.find("paul-life-messages")
    @present_career = Page.find("paul-present-career")
    @prison_service = Page.find("paul-prison-service")
    @sonship = Page.find("paul-sonship")
    @world_view = Page.find("paul-world-view")
  end  
  
  def give
    @selected_nav = "give"
    @our_heart = Page.find("give-our-heart")
    @chloe_and_stu = Page.find("give-chloe-and-stu-s-orphanage")
    @down_syndrome = Page.find("give-down-syndrome-charity")
    @john_and_sarah = Page.find("give-john-and-sarah-s-orphanage")    
    
  end
  
  
  def friends
    @selected_nav = "friends"
    @our_heart = Page.find("give-our-heart")   
  end  
end


