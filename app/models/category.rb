class Category < ActiveRecord::Base
  
  has_many :posts, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name 
  
  attr_accessible :name, :post_ids, :posts_count
  
  extend FriendlyId
  friendly_id :name, use: :slugged  
end
# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  posts_count :integer         default(0)
#  slug        :string(255)
#

