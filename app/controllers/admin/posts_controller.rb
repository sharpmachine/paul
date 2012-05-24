class Admin::PostsController < Admin::BaseController

  authorize_resource :class => "Post"
  
  before_filter :get_tags, :set_active_nav
  
  def index
    params[:sort] ||= "posts.created_at"  
    params[:direction] ||= "desc"        
    @posts = Post.where("posts.title like ?", "%#{params[:q]}%").includes(:user, :category).order(sort_column + " " + sort_direction).page(params[:page])  
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])

  end
  
  def publish
    @post = Post.find(params[:id])
    @post.published = true
    @post.save
    redirect_to admin_posts_path, notice: 'Post published.'
  end  

  def create
    @post = Post.new(params[:post])
    @post.user = current_user    

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_path, notice: 'Post created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_posts_path, notice: 'Post updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_path, notice: 'Post deleted.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_tags
    @tags = Tag.order("tagstring")
    @tag = Tag.new
  end
  
  def set_active_nav
    @selected_nav = "blog"
    @selected_page = "posts"    
  end  
end
