class Admin::ProductsController < Admin::BaseController  

  authorize_resource :class => "Product"
  
  before_filter :set_active_nav  

  def index
    
    params[:sort] ||= "title" 
    params[:direction] ||= "desc"     
        
    @products = Product.order(sort_column + " " + sort_direction).page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @products }
    end    
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path, notice: "Successfully created product."
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path, notice: "Successfully updated product."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: "Successfully destroyed product."
  end
  
  private
  
  def set_active_nav
    @selected_nav = "products"
    @selected_page = "products"    
  end
end
