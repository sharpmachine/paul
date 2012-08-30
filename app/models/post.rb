# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  published   :boolean          default(FALSE)
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true  
  has_many :tagships, :dependent => :destroy
  has_many :tags, :through => :tagships  
  
  validates_presence_of :title, :content, :category_id
  
  def to_param
    "#{id}-#{title}".downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
  end 
    
end
