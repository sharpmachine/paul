require 'spec_helper'

describe Post do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "fields" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:text) }
  end


  context "basic validations" do   
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

