class HomeController < ApplicationController
  skip_authorization_check
  
  def index
    @selected_nav = "home"
    @intro = Page.find("homepage-intro")
    @post = Post.published.try(:first)
    @product = Product.get_featured
    @pictures = Picture.published.limit(3)  
    @instagrams = Instacache.retrieve
    @events = Event.website_listing.limit(3)
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
    @connect = Page.find("paul-connect")    
  end  
  
  def give
    @selected_nav = "give"
    @our_heart = Page.find("give-our-heart")
    @chloe_and_stu = Page.find("give-chloe-and-stu-s-kids-homes")
    @erica = Page.find("give-erica-greve")
    @john_and_sarah = Page.find("give-john-and-sarah-s-orphanage")    
  end  
  
  def privacy
    @selected_nav = "privacy"    
    @page = Page.find("privacy-policy")    
  end  
  
  def terms
    @selected_nav = "terms"    
    @page = Page.find("terms-and-conditions")    
  end  
end


