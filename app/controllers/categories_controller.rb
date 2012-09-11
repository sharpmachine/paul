class CategoriesController < ApplicationController
  
  skip_authorization_check
  
  before_filter :set_active_nav

  def show
    @category = Category.find(params[:id])
    
    @posts = @category.posts.published.page(params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.xml # show.xml.builder      
    end

  end  
  
  private
  
  def set_active_nav
    @selected_nav = "blog"   
  end  

end
