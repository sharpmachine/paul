class Admin::<%= plural_class_name %>Controller < Admin::BaseController  

  authorize_resource :class => "<%= class_name %>"
  
  before_filter :set_active_nav  

  <%= controller_methods :actions %>
  
  private
  
  def set_active_nav
    @selected_nav = ""
    @selected_page = ""    
  end
end
