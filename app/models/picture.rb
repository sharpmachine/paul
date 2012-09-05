class Picture < ActiveRecord::Base
  
  has_many :posts
  
  has_attached_file :image, :styles => { :thumb => "100x75>", :small => "320x240>", :medium => "480x360>", :square => "360x360#", :large => "640x480>" },
                    :url  => "/assets/pictures/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/pictures/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"
  
  validates_presence_of :title
  attr_accessible :image, :title, :published, :description
  
  extend FriendlyId
  friendly_id :title, use: :slugged  
  
end
# == Schema Information
#
# Table name: pictures
#
#  id                 :integer         not null, primary key
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string(255)
#  description        :text
#  published          :boolean         default(FALSE)
#  slug               :string(255)
#

