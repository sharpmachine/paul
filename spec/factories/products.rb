FactoryGirl.define do 
  factory :product do
    title "MyString"
    author "MyString"
    short_description "This is a short description"
    url "MyString"
    featured false
    product_type "book"
    image { File.new "#{Rails.root}/spec/attachments/whenHeavenInvadesEarth_LG.jpg" }
  end
end
# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  author             :string(255)
#  description        :text
#  url                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  product_type       :string(255)
#  slug               :string(255)
#