module EventHelper
  
  def status_label(status = nil)
    # From event.rb model: [new processing declined accepted published_to_website]
    case status
    when "new"  
      "<span class=\"label label-important\">#{status.titleize}</span>".html_safe
    when "processing"  
      "<span class=\"label label-warning\">#{status.titleize}</span>".html_safe 
    when "declined"  
      "<span class=\"label\">#{status.titleize}</span>".html_safe 
    when "accepted"  
      "<span class=\"label label-info\">#{status.titleize}</span>".html_safe                
    when "featured"  
      "<span class=\"label label-success\">Featured</span>".html_safe
    when "published_to_website"  
      "<span class=\"label label-success\">#{status.titleize}</span>".html_safe      
    else
      "<span class=\"label\">#{status.titleize}</span>".html_safe      
    end    
  end
end