# == Schema Information
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  author             :string(255)
#  url                :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  product_type       :string(255)
#  slug               :string(255)
#  featured           :boolean         default(FALSE), not null
#  short_description  :text
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Product do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  # before(:each) do
  #   FactoryGirl.create(:product)
  # end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "associations" do
#    it { should belong_to(:) }
#    it { should have_many(:) }
  end
  
  context "fields" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:author).of_type(:string) }
    it { should have_db_column(:short_description).of_type(:text) }    
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:featured).of_type(:boolean) }        
  end

  context "basic validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:short_description) }    
    it { should validate_presence_of(:url) }               
  end
  

  context "feautured product" do
    let(:product) { FactoryGirl.create(:product, :featured => true) }
    let(:product2) { FactoryGirl.create(:product, :featured => false, :title => "Strategic planning toolkit") }    
    
    it "should be feautured" do
      product.featured?.should be_true
      product2.featured?.should be_false      
    end 
    
    it "setting feautured should unset the others" do
      product.featured?.should be_true
      product2.featured?.should be_false
      product2.featured = true
      product2.save!
      product.reload
      product.featured?.should be_false
      product2.featured?.should be_true    
    end  
    
    it "getting the featured product" do
      product.featured?.should be_true
      test_product = Product.get_featured
      product.should == test_product   
    end                  
  end  
  
end  
