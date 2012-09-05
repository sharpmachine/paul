class Page < ActiveRecord::Base
    validates_presence_of :title
    validates_uniqueness_of :title
    
    attr_accessible :title, :content    
    
    extend FriendlyId
    friendly_id :title, use: :slugged    
end

# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

