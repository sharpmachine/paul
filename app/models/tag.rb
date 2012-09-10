class Tag < ActiveRecord::Base
  has_many :tagships, dependent: :destroy  
  has_many :posts, through: :tagships
  
  validates_presence_of :tagstring
  validates_uniqueness_of :tagstring  

  attr_accessible :tagstring, :posts_count
  
  def frequency
    posts.size
  end
  
  def self.cloud
    all.inject({}){|set, t| set[t.tagstring] = t.frequency unless t.frequency == 0; set }
  end
end
# == Schema Information
#
# Table name: tags
#
#  id          :integer         not null, primary key
#  tagstring   :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  posts_count :integer         default(0)
#

