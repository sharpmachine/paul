class Admin::FriendsController < Admin::BaseController  

  authorize_resource :class => "Friend"
  
  before_filter :set_active_nav  

  def index
    
    params[:sort] ||= "created_at" 
        
    @friends = Friend.order(sort_column + " " + sort_direction).page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @friends }
    end    
  end

  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @friend }
    end
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(params[:friend])
    if @friend.save
      redirect_to admin_friends_path, notice: "Successfully created friend."
    else
      render :new
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    
    if @friend.update_attributes(params[:friend])
      redirect_to admin_friends_path, notice: "Successfully updated friend."
    else
      render :edit
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to admin_friends_path, notice: "Successfully destroyed friend."
  end
  
  private
  
  def set_active_nav
    @selected_nav = "content"
    @selected_page = "friends"    
  end
end
