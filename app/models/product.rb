class Product < ActiveRecord::Base
  attr_accessible :title, :author, :description, :url, :product_type, :image
  
  validates_presence_of :title, :author, :description, :url, :product_type
  
  has_attached_file :image, :styles => { :small => "100x127>", :large => "245x310>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"   
  
  PRODUCT_TYPES = %w[book teaching_series toolkit]  
end
# == Schema Information
#
# Table name: products
#
#  id                 :integer(4)      not null, primary key
#  title              :string(255)
#  author             :string(255)
#  description        :text
#  url                :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  product_type       :string(255)
#

