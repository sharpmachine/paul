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

# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
      title "About"
      permalink "about"
      content "<p>All about this website</p>"
    end
end# == Schema Information
#
# Table name: pages
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  permalink  :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

