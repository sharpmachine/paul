# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string(255)
#  description        :text
#  published          :boolean          default(FALSE)
#  slug               :string(255)
#

# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
      title "MyString"
      description "MyString"
      published true            
    end
end
