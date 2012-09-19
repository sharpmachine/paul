class PostsController < ApplicationController

  skip_authorization_check
  
  before_filter :set_active_nav  

  def index
    @posts = Post.published.includes(:picture, :category, :tags, :user)
    
    if params[:q].present?
      @posts = @posts.text_search(params[:q])
    elsif params[:tag].present?
      @posts = @posts.where("tags.tagstring = ?", params[:tag])
    elsif params[:author].present?
      @user = User.find_by_id(params[:author])
      @posts = @posts.where("users.id = ?", @user)       
    end       
    @posts = @posts.page(params[:page]).per(4)  
    
    respond_to do |format|
      format.html # index.html.erb
      format.atom # index.atom.builder
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end
  
  private
  
  def set_active_nav
    @selected_nav = "blog" 
    @categories = Category.order("name")   
    @tagcloud = Tag.cloud       
  end  
end
