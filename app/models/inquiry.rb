class Inquiry < ActiveRecord::Base
  attr_accessible :email, :description
  
  validates_presence_of :email, :description
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i  
end
# == Schema Information
#
# Table name: inquiries
#
#  id          :integer          not null, primary key
#  email       :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#