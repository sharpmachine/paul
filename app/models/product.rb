class Product < ActiveRecord::Base
  attr_accessible :title, :author, :url, :product_type, :image, :featured, :short_description, :remote_image_url, :image_cache
  
  validates_presence_of :title, :author, :url, :product_type, :short_description, :image
  
  validates_length_of :short_description, :maximum => 50, :too_long => "must be 50 words maximum.", :tokenizer => lambda {|str| str.scan(/\w+/) }
  
  # has_attached_file :image, 
  #                   :styles => { :small => "158x200#" },
  #                   :storage => :s3,
  #                   :s3_permissions => :public_read,                    
  #                   :s3_credentials => {
  #                     :bucket            => ENV['S3_BUCKET_NAME'],
  #                     :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
  #                     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  #                   },
  #                   :path => "/:class/:id/:attachment/:style/:filename"
  # 
  # validates_attachment_presence :image
  # validates_attachment_size :image, :less_than => 10.megabytes
  #validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"   
  
  mount_uploader :image, ImageUploader
  
  PRODUCT_TYPES = %w[book teaching_series toolkit]  
  
  after_save :set_featured_flag, :if => :featured_changed?
  
  extend FriendlyId
    friendly_id :title, use: :slugged
  
  def self.get_featured
    find_by_featured(true)
  end
  
  private
  
  def set_featured_flag
    if featured?
      Product.where("id <> ?", id).update_all :featured => false
    end  
  end
end
# == Schema Information
#
# Table name: products
#
#  id                :integer         not null, primary key
#  title             :string(255)
#  author            :string(255)
#  url               :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  product_type      :string(255)
#  slug              :string(255)
#  featured          :boolean         default(FALSE), not null
#  short_description :text
#  image             :string(255)
#

