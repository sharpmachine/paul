module PostHelper
  
  def picture_thumbnail(picture = nil)
    if picture
      image_tag picture.image.url(:thumb)
    else
      image_tag "placeholder.jpg"
    end    
  end
end