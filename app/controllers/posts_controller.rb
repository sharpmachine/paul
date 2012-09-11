class PostsController < ApplicationController

  skip_authorization_check
  
  before_filter :set_active_nav  

  def index
    @posts = Post.published.includes(:picture, :category, :tags, :user)
    
    if params[:q]
      @posts = @posts.text_search(params[:q])
    elsif params[:tag]
      @posts = @posts.where("tags.tagstring = ?", params[:tag])
    end       
    @posts = @posts.page(params[:page])
    
    @categories = Category.order("name")    

    @tagcloud = Tag.cloud
    
    respond_to do |format|
      format.html # index.html.erb
      format.atom # index.atom.builder
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  
  private
  
  def set_active_nav
    @selected_nav = "blog"    
  end  
end
