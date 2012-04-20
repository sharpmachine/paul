# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Clean::Application.initialize!

# Overide the default handling of form errors:
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  if html_tag.start_with?("<label") || html_tag.include?("radio")
    html_tag 
  else 
    "<span class=\"field_with_errors\">#{html_tag}</span>".html_safe
  end  
end