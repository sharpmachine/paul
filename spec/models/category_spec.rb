require 'spec_helper'

describe Category do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  before(:each) do
    FactoryGirl.create(:category, name: "First")
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "fields" do
    it { should have_db_column(:name).of_type(:string) }
  end


  context "basic validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }    
  end
end
# == Schema Information
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  posts_count :integer(4)      default(0)
#

