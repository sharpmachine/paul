class EventsController < ApplicationController  
  
  skip_authorization_check

  def index
    
    params[:sort] ||= "created_at" 
        
    @events = Event.order(sort_column + " " + sort_direction).page(params[:page])
    
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
      redirect_to admin_events_path, notice: "Successfully created event."
    else
      render :new
    end
  end
  
end
