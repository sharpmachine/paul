# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
      tagstring "MyString"
    end
end# == Schema Information
#
# Table name: tags
#
#  id         :integer(4)      not null, primary key
#  tagstring  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# == Schema Information
#
# Table name: tags
#
#  id          :integer(4)      not null, primary key
#  tagstring   :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  posts_count :integer(4)      default(0)
#

