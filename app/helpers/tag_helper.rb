module TagHelper
  def tag_cloud(cloud = {})
    min_font_color = 32
    max_font_color = 204
    
    max_frequency = cloud.values.max
    min_frequency = cloud.values.min
    range = max_frequency - min_frequency
    range = 1 if range == 0
    multiplier = ((max_font_color - min_font_color) / range).to_f

    html = ""    
    cloud.keys.each do |tag|
      font_color = (255 - (min_font_color + ((max_frequency-(max_frequency-(cloud[tag]-min_frequency)))*multiplier).to_i)).to_s(16)
      html << link_to(tag, posts_path(:tag => tag), :style => "background-color:##{font_color}#{font_color}#{font_color};", :class => "tag-btn")
      html << " "
    end  
    html.html_safe
  end
end  