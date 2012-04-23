class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tagships, :dependent => :destroy
  has_many :tags, :through => :tagships  
  
  validates_presence_of :title, :content
  
  def to_param
    "#{id}-#{title}".downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
  end  
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

