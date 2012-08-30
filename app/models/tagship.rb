# == Schema Information
#
# Table name: tagships
#
#  id      :integer          not null, primary key
#  post_id :integer
#  tag_id  :integer
#

class Tagship < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag  
end
