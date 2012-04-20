class Admin::HomeController < Admin::BaseController
  skip_authorization_check # Skip authorization on this controller, since it will be caught by the Admin::BaseController's verify_admin filter.
    
  def index
  end 

end