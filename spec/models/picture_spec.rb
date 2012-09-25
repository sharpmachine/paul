require 'spec_helper'

describe Picture do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "fields" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:published).of_type(:boolean) }    
    it { should have_db_column(:photo).of_type(:string) }    
  end

  context "basic validations" do   
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:photo) }
  end
end
# == Schema Information
#
# Table name: pictures
#
#  id          :integer         not null, primary key
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  title       :string(255)
#  description :text
#  published   :boolean         default(FALSE)
#  slug        :string(255)
#  photo       :string(255)
#

