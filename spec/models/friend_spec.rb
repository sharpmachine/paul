require File.dirname(__FILE__) + '/../spec_helper'

describe Friend do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  before(:each) do
    FactoryGirl.create(:friend)
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "associations" do
#    it { should belong_to(:) }
#    it { should have_many(:) }
  end
  
  context "fields" do
      it { should have_db_column(:title).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:description).of_type(:string) }
      it { should have_db_column(:url).of_type(:string) }
      it { should have_db_column(:picture_id).of_type(:integer) }
    
  end

  context "basic validations" do
#    it { should validate_presence_of(:name) }         
  end
  
end  
# == Schema Information
#
# Table name: friends
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  name        :string(255)
#  description :string(255)
#  url         :string(255)
#  picture_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  featured    :boolean
#

