class Friend < ActiveRecord::Base
  attr_accessible :title, :name, :description, :url, :picture_id, :featured
  
  belongs_to :picture
  
  validates_presence_of :title, :name, :description, :url, :picture_id
  
  validates_format_of :url, :with => /^(((http|https?):\/\/)?((?:[-a-z0-9]+\.)+[a-z]{2,})).*/i, :message => "has an invalid format"
  
  def featured?
    featured
  end
  
  def self.featured
    where("featured = ?", true)
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
#

