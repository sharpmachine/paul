# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
      title "MyString"
    end
end# == Schema Information
#
# Table name: pictures
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# == Schema Information
#
# Table name: pictures
#
#  id                 :integer(4)      not null, primary key
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#

# == Schema Information
#
# Table name: pictures
#
#  id                 :integer(4)      not null, primary key
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#

