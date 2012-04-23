class Picture < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb => "100x75>", :small => "320x240>", :medium => "480x360>", :large => "640x480>" },
                    :url  => "/assets/pictures/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/pictures/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"
end
# == Schema Information
#
# Table name: pictures
#
#  id                 :integer(4)      not null, primary key
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#

