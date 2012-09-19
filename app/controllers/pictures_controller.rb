class PicturesController < ApplicationController  

  skip_authorization_check
  

  def index
    @selected_nav = "photos"   

    @pictures = Picture.published.limit(6)
    @instagrams = Instacache.retrieve
    
    params[:picture] ||= @pictures.first.id

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def archive
    @selected_nav = "photos"   
    
    @pictures = Picture.published.page(params[:page]).per(18)

    respond_to do |format|
      format.html # index.html.erb
    end
  end  
  
end