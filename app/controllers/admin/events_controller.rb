class Admin::EventsController < Admin::BaseController  

  authorize_resource :class => "Event"
  
  before_filter :set_active_nav  

  def index
    
    params[:sort] ||= "created_at" 
        
    @events = Event.order(sort_column + " " + sort_direction).page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end    
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event], :as => :admin)
    if @event.save
      redirect_to admin_events_path, notice: "Successfully created event."
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(params[:event], :as => :admin)
      redirect_to admin_events_path, notice: "Successfully updated event."
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path, notice: "Successfully destroyed event."
  end
  
  private
  
  def set_active_nav
    @selected_nav = ""
    @selected_page = ""    
  end
end
