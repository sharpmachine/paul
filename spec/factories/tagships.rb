# == Schema Information
#
# Table name: tagships
#
#  id      :integer          not null, primary key
#  post_id :integer
#  tag_id  :integer
#

# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagship do
      post_id 1
      tag_id 1
    end
end
