class ApplicationController < ActionController::Base
  protect_from_forgery
  
  check_authorization :unless => :devise_controller?  
  
  helper :all # Include all helpers all the time
  helper_method :sort_column, :sort_direction 
  
  if Rails.env == "production"
    rescue_from Exception, :with => :render_error
    rescue_from RuntimeError, :with => :render_error 
    rescue_from AbstractController::ActionNotFound, :with => :render_not_found
    rescue_from AbstractController::DoubleRenderError, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionView::MissingTemplate, :with => :render_not_found    
    rescue_from NoMethodError, :with => :render_error
    rescue_from ActiveRecord::RecordInvalid, :with => :render_error
  end
  
  rescue_from CanCan::AccessDenied, :with => :cancan_error  
  
  private

  def after_sign_in_path_for(resource)
     if session[:url_back]
       set_redirect = session[:url_back] 
       session[:url_back] = nil
       set_redirect
    else
      root_path
    end  
  end
  
  def sort_column
    params[:sort]
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  protected
  
  def cancan_error(exception)    
    # Handle the error message differently if the user is signed in.
    if user_signed_in?
      # For certain error messages we want to redirect the user differently.
        redirect_to(root_path, :alert => exception.message )
        # redirect_to(root_url, :alert => "#{exception.subject} - #{exception.message}" )
    else
      session[:url_back] = request.url
      redirect_to(new_user_session_path, :alert => "Please sign in.")
    end
  end  
  
  def render_not_found(exception)
    logger.info exception
    render :template => "errors/404", :status => 404, :layout => "application"
  end

  def render_error(exception)
    logger.info exception    
    render :template => "errors/500", :status => 500, :layout => "application"
  end
  
end
