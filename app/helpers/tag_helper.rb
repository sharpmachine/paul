module TagHelper
  def tag_cloud(cloud = {})
    min_font_size = 10 
    max_font_size = 30
    
    max_frequency = cloud.values.max
    min_frequency = cloud.values.min
    range = max_frequency - min_frequency
    multiplier = ((max_font_size - min_font_size) / range).to_f

    html = ""    
    cloud.keys.each do |tag|
      font_size = min_font_size + ((max_frequency-(max_frequency-(cloud[tag]-min_frequency)))*multiplier).to_i
      html << link_to(tag, posts_path(:tag => tag), :style => "font-size: #{font_size}px;")
      html << " "
    end  
    html.html_safe
  end
end  