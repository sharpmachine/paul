class FriendsController < ApplicationController  

  skip_authorization_check
  
  def index
    @selected_nav = "friends"   
    @friends = Friend.all
  end
  
end