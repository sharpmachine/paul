# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  posts_count :integer          default(0)
#

class Category < ActiveRecord::Base
  
  has_many :posts, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name 
  
  def to_param
    "#{id}-#{name}".downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
  end   
end
