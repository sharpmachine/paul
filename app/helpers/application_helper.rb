module ApplicationHelper
  def title(page_title)
    @title = capture { page_title }
  end
  
  def meta_description(page_description)
    @meta_description = capture { page_description }
  end
  
  def meta_keywords(page_keywords)
    @meta_keywords = capture { page_keywords }
  end  
  
  def selected_nav(selection = nil)
    @selected_nav = capture { selection }
  end

  def selected_page(selection = nil)
    @selected_page = capture { selection }
  end  

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge({:sort => column, :direction => direction}), {:class => css_class}
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def show_breadcrumbs(locals = {})
    locals.reverse_merge! :parent_text => nil, :parent_url => nil, :sub_parent_text => nil, :sub_parent_url => nil
    if @admin_section
      render :partial => 'admin/breadcrumb', :locals => locals
    else
      render :partial => 'layouts/breadcrumb', :locals => locals      
    end    
  end
  
  def nice_date(date = nil, include_year = false)
    if date && include_year
      date.strftime("%B %-d, %Y")
    elsif date
      date.strftime("%B %-d")      
    end  
  end
  
  def markdown(text, text_length = 450)
    snippet = text.length < text_length ? text : text[0..text_length].gsub(/\b(\S+)$/, '...')
    Redcarpet.new(snippet, :hard_wrap, :filter_html, :autolink).to_html.html_safe    
  end  
end
