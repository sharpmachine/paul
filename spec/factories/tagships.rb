# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagship do
      post_id 1
      tag_id 1
    end
end
# == Schema Information
#
# Table name: tagships
#
#  id      :integer(4)      not null, primary key
#  post_id :integer(4)
#  tag_id  :integer(4)
#

