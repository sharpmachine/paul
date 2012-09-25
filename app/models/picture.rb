class Picture < ActiveRecord::Base
  
  has_many :posts
  
  validates_presence_of :title, :photo, :photo_cache
  attr_accessible :photo, :title, :published, :description, :crop_x, :crop_y, :crop_w, :crop_h, :photo_cache
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  after_update :crop_photo, :if => :cropping?
  
  mount_uploader :photo, PhotoUploader
  
  def crop_photo
    photo.recreate_versions!
  end
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  extend FriendlyId
  friendly_id :title, use: :slugged  
  
  
  def has_post?
    posts.published.any?
  end
  
  def self.published
    where("pictures.published = ?", true).order("pictures.updated_at desc")
  end
  
end
# == Schema Information
#
# Table name: pictures
#
#  id          :integer         not null, primary key
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  title       :string(255)
#  description :text
#  published   :boolean         default(FALSE)
#  slug        :string(255)
#  photo       :string(255)
#

