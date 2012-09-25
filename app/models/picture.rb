class Picture < ActiveRecord::Base
  
  has_many :posts
  
  # has_attached_file :image, 
  #                   :styles => { :thumb => { :geometry => "308x116#", :processors => [:cropper]}, :small => "308x206#", :medium => { :geometry => "628x235#", :processors => [:cropper]}, :large => "950x660>" },
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
  # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"
  # 
  validates_presence_of :title
  attr_accessible :image, :title, :published, :description, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  after_update :reprocess_image, :if => :cropping?
  
  
  # def cropping?
  #   !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  # end
  # 
  # def image_geometry(style = :original)
  #   @geometry ||= {}
  #   @geometry[style] ||= Paperclip::Geometry.from_file(image.to_file(style))
  # end
  # 
  # def image_aspect_ratio
  #   (image_geometry(:medium).width / image_geometry(:medium).height).round(2)
  # end  
  
  extend FriendlyId
  friendly_id :title, use: :slugged  
  
  
  def has_post?
    posts.published.any?
  end
  
  def self.published
    where("pictures.published = ?", true).order("pictures.updated_at desc")
  end
  
  private
  
  # def reprocess_image
  #   image.reprocess!
  # end  
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

