class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category  
  has_many :tagships, :dependent => :destroy
  has_many :tags, :through => :tagships  
  
  validates_presence_of :title, :content, :category_id
  
  def to_param
    "#{id}-#{title}".downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
  end  
end
# == Schema Information
#
# Table name: posts
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  content     :text
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  category_id :integer(4)
#  published   :boolean(1)      default(FALSE)
#

