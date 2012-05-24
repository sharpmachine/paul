class Category < ActiveRecord::Base
  
  has_many :posts, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name 
  
  def to_param
    "#{id}-#{name}".downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
  end   
end
# == Schema Information
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  posts_count :integer(4)      default(0)
#

