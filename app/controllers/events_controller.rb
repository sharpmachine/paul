class EventsController < ApplicationController  
  
  skip_authorization_check

  before_filter :set_active_nav  
  
  def index
        
    @events = Event.website_listing.page(params[:page]).per(10)
    
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end    
  end

  def new
    @selected_nav = "invite"
    @intro = Page.find("why-invite-paul")  
    @how = Page.find("how-to-invite-paul")  
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      UserMailer.event_notification(@event).deliver
      redirect_to events_path, notice: "Thank you for inviting Paul to minister. We will be in touch with you soon."
    else
      @selected_nav = "invite"      
      @intro = Page.find("why-invite-paul") 
      @how = Page.find("how-to-invite-paul")           
      render :new
    end
  end
  
  private
  
  def set_active_nav
    @selected_nav = "schedule"
  end  
end
