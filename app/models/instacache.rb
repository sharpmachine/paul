class Instacache < ActiveRecord::Base
  
  attr_accessible :link_url, :low_resolution_url, :thumbnail_url
  
  def self.retrieve
    # Search for most recent out of the database here.
    new_cache = where("created_at > ?", 1.hour.ago)
    
    if new_cache.any?
      # Return the cached items
      new_cache    
    else
      # If there are none, reload the cache from instagram      
      begin # Rescue from errors incase there is a problem with Instagram
        most_recent = Instagram.user_recent_media(211842030)
    
        self.delete_all
        most_recent.each_with_index do |media_item, i|
          self.create(:link_url => media_item.link, :low_resolution_url => media_item.images.low_resolution.url, :thumbnail_url => media_item.images.thumbnail.url)
  		    break if i == 3        
        end
      rescue
      end
      all
    end  
  end
end
# == Schema Information
#
# Table name: instacaches
#
#  id                 :integer         not null, primary key
#  thumbnail_url      :string(255)
#  low_resolution_url :string(255)
#  link_url           :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

