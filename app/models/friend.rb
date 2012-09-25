class Friend < ActiveRecord::Base
  attr_accessible :title, :name, :description, :url, :featured, :friendimage, :friendimage_cache, :remote_friendimage_url
  
  validates_presence_of :name, :url 
  validates_presence_of :title, :description, :friendimage, :if => :featured?
  
  validates_format_of :url, :with => /^(((http|https?):\/\/)?((?:[-a-z0-9]+\.)+[a-z]{2,})).*/i, :message => "has an invalid format"
  
  after_save :set_featured, :if => :featured?
  
  mount_uploader :friendimage, FriendimageUploader
    
  def featured?
    featured
  end
  
  def self.featured
    where("featured = ?", true)
  end
  
  def self.links
    where("featured = ?", false)
  end  
  
  private 
  
  def set_featured
    keep = Friend.featured.order("updated_at").limit(3).pluck("id")
    Friend.where("id not in (?)", keep).update_all :featured => false
  end
end
# == Schema Information
#
# Table name: friends
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  name        :string(255)
#  description :string(255)
#  url         :string(255)
#  picture_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  featured    :boolean
#  friendimage :string(255)
#

