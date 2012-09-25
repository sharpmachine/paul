class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    process :resize_to_limit => [950, 671]
  end
  
  version :medium, :from_version => :large do
    process :crop
    process :resize_to_fill => [628, 235]
  end 
  
  version :small, :from_version => :large do
    process :resize_to_fill => [308, 206]
  end
  
  version :thumb, :from_version => :large do
    process :crop
    process :resize_to_fill => [308, 116]
  end  

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def crop
    if model.crop_x.present?
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i                        
        img.crop!(x, y, w, h)
      end  
    end
  end
end
