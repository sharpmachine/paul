require File.dirname(__FILE__) + '/../spec_helper'

describe Inquiry do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  before(:each) do
    FactoryGirl.create(:inquiry)
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "associations" do
#    it { should belong_to(:) }
#    it { should have_many(:) }
  end
  
  context "fields" do
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:description).of_type(:string) }
    
  end

  context "basic validations" do
    it { should validate_presence_of(:email) }         
    it { should validate_presence_of(:description) }             
  end
  
end

# == Schema Information
#
# Table name: inquiries
#
#  id          :integer         not null, primary key
#  email       :string(255)
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

