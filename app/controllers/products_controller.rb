class ProductsController < ApplicationController

  skip_authorization_check
  
  before_filter :set_active_nav  

  def index
    @products = Product.order("created_at").page(params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  private
  
  def set_active_nav
    @selected_nav = "store"
  end  
end