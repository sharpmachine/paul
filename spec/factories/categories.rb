# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
      name "MyString"
    end
end# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

