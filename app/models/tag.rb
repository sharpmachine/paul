# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tagstring  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  has_many :tagships, dependent: :destroy  
  has_many :posts, through: :tagships
  
  validates_presence_of :tagstring
  validates_uniqueness_of :tagstring  

  attr_accessible :tagstring
end

# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tagstring  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
