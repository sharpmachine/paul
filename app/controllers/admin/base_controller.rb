# The Admin::BaseController has all the Admin Section specific settings. 
# All Controllers in the Admin section inherit from this controller.
class Admin::BaseController < ApplicationController
  
  layout 'admin'
  
  # Check permissions
  before_filter :verify_admin
  
  private
  
  def verify_admin
    raise CanCan::AccessDenied unless user_signed_in? && current_user.is_admin?
    @admin_section = true
  end
  
end