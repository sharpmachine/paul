class Post < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :content
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

