class Admin::InquiriesController < Admin::BaseController  

  authorize_resource :class => "Inquiry"
  
  before_filter :set_active_nav  

  def index
    
    params[:sort] ||= "description" 
        
    @inquiries = Inquiry.order(sort_column + " " + sort_direction).page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @inquiries }
    end    
  end

  def show
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @inquiry }
    end
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      redirect_to admin_inquiries_path, notice: "Successfully created inquiry."
    else
      render :new
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    
    if @inquiry.update_attributes(params[:inquiry])
      redirect_to admin_inquiries_path, notice: "Successfully updated inquiry."
    else
      render :edit
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to admin_inquiries_path, notice: "Successfully destroyed inquiry."
  end
  
  private
  
  def set_active_nav
    @selected_nav = "content"
    @selected_page = "inquiries"    
  end
end
