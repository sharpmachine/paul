class EventsController < ApplicationController  
  
  skip_authorization_check

  before_filter :set_active_nav  
  
  def index
        
    @events = Event.website_listing.page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end    
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path, notice: "Thank you for inviting Paul to minister. We will be in touch with you soon."
    else
      render :new
    end
  end
  
  private
  
  def set_active_nav
    @selected_nav = ""
    @selected_page = "schedule"    
  end  
end
