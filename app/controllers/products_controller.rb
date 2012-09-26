class ProductsController < ApplicationController

  skip_authorization_check
  
  before_filter :set_active_nav  

  def index
    @products = Product.order("featured desc, created_at")
    @products = @products.text_search(params[:q]) if params[:q].present?
    @products = @products.page(params[:page]).per(6)
  end
  
  private
  
  def set_active_nav
    @selected_nav = "store"
  end  
end