# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  permalink  :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Page do

  before(:each) do
    @page = Factory.build(:page)
  end

  it "should be valid" do
    @page.should be_valid
  end
  
  it "should not be valid without a title" do
    @page.title = ""
    @page.should_not be_valid
  end
  
  it "should not be valid without a permalink" do
    @page.permalink = ""
    @page.should_not be_valid
  end

  it "should not be valid with illegal spaces in a permalink" do
    @page.permalink = "bad perma link"
    @page.should_not be_valid
  end
  
  it "should not be valid with illegal characters in a permalink" do
    @page.permalink = "bad&perma/link"
    @page.should_not be_valid
  end

  it "should be valid with blank content" do
    @page.content = ""
    @page.should be_valid
  end

end
