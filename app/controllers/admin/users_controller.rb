class Admin::UsersController < Admin::BaseController
  
  authorize_resource :class => "User" 
  
  before_filter :set_active_nav  
  
  def index
    params[:sort] ||= "lastname"
    split = params[:q] ? params[:q].split(' ', 2) : []    
    @users = User.where("firstname like ? or lastname like ? or (firstname like ? and lastname like ?) or email like ?", "#{params[:q]}%", "#{params[:q]}%", "#{split.first}%", "#{split.last}%", "#{params[:q]}").order(sort_column + " " + sort_direction).page(params[:page])  
  end
 

  # GET /users/1
  def show
    @user = User.find(params[:id]) 
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  def update 
    @user = User.find(params[:id])
     
    if @user.update_attributes(params[:user], :as => current_user.role.to_sym)
      redirect_to(admin_user_path(@user), :notice => 'Profile successfully updated.') 
    else
      render :action => "edit"
    end
  end
  
  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      redirect_to(admin_users_path, :alert => 'Cannot delete your own profile while logged in.') 
    else
      @user.destroy
      redirect_to(admin_users_path, :notice => 'User has been permanently deleted')
    end  
  end
  
  private
  
  def set_active_nav
    @selected_nav = "users"
    @selected_page = "users"    
  end  

end
