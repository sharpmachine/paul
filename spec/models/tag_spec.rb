# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tagstring  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Tag do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  before(:each) do
    FactoryGirl.create(:tag, tagstring: "First")
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "fields" do
    it { should have_db_column(:tagstring).of_type(:string) }
  end


  context "basic validations" do
    let(:tag) { FactoryGirl.create(:tag) }   
    it { should validate_presence_of(:tagstring) }
    it { should validate_uniqueness_of(:tagstring) }    
  end
end
