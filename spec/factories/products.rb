FactoryGirl.define do 
  factory :product do
    title "MyString"
    author "MyString"
    description "MyText"
    url "MyString"
  end
end
# == Schema Information
#
# Table name: products
#
#  id                 :integer(4)      not null, primary key
#  title              :string(255)
#  author             :string(255)
#  description        :text
#  url                :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  product_type       :string(255)
#

