# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  permalink  :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base
    validates_presence_of :title, :permalink
    validates_uniqueness_of :title, :permalink  
    validates_format_of :permalink, :with => /^([A-Za-z0-9]|(_|-))+$/, :message => "No spaces or /,&,*,$,etc. allowed"
    
    attr_accessible :title, :permalink, :content    
end

# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  permalink  :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
