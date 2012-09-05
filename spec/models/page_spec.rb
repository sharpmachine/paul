require 'spec_helper'

describe Page do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "fields" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:text) }
  end


  context "basic validations" do   
    it { should validate_presence_of(:title) }
  end
end  
