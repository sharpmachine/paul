class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  version :small do
    process :resize_to_limit => [150, 150]
  end
  
  version :thumb, :from_version => :small do
    process :resize_to_limit => [75, 75]
  end  

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
