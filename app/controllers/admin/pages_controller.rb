class Admin::PagesController < Admin::BaseController

  authorize_resource :class => "Page"
  
  before_filter :set_active_nav  
  
  # GET admin/pages
  def index
    params[:sort] ||= "title"    
    @pages = Page.order(sort_column + " " + sort_direction).page(params[:page])
  end

  # GET admin/pages/new
  def new
    @page = Page.new
  end

  # GET admin/pages/1/edit
  def edit
    @page = Page.find(params[:id]) 
  end

  # POST admin/pages
  def create
    @page = Page.new(params[:page])
    
    if @page.save
      respond_to do |format|
        format.html { redirect_to(admin_pages_path, :notice => 'Content was successfully created.') }
        format.js
      end
    else
      render :action => "new"
    end
  end

  # PUT admin/pages/1
  def update
    @page = Page.find(params[:id]) 

    if @page.update_attributes(params[:page])
      redirect_to(admin_pages_path, :notice => 'Content was successfully updated.')
    else
      render :action => "edit" 
    end
  end

  # DELETE admin/pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(admin_pages_path)
  end
  
  private
  
  def set_active_nav
    @selected_nav = "content"
    @selected_page = "blocks"    
  end  
end
