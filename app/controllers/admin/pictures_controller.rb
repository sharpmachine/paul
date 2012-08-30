class Admin::PicturesController < Admin::BaseController

  authorize_resource :class => "Picture"  
  
  before_filter :set_active_nav    
  # GET /pictures
  # GET /pictures.json
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

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to admin_pictures_path, notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to admin_picture_path(@picture), notice: 'Picture was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end  


  # DELETE /pictures/1
  # DELETE /pictures/1.json
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
