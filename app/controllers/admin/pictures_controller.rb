class Admin::PicturesController < Admin::BaseController

  authorize_resource :class => "Picture"  
  
  before_filter :set_active_nav    

  def index
    
    params[:sort] ||= "updated_at"  
    params[:direction] ||= "desc"    
    
    @pictures = Picture.order(sort_column + " " + sort_direction).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.js #index.js.erb
      format.json { render json: @pictures }
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      if params[:picture][:image].blank?
        redirect_to admin_picture_path(@picture), notice: 'Picture was successfully saved.'  
      else  
        render :action => 'crop'  
      end
    else
      render action: "new"
    end

  end
  
  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(params[:picture])
      if params[:picture][:image].blank?
        redirect_to admin_picture_path(@picture), notice: 'Picture was successfully saved.'  
      else  
        render :action => 'crop'  
      end  
    else
      render action: "edit"
    end

  end  

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to admin_pictures_path, notice: 'Picture was successfully deleted.'
  end
  
  private
  
  def set_active_nav
    @selected_nav = "pages"
    @selected_page = "photos"    
  end  
end
